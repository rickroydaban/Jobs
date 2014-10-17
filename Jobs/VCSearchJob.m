//
//  VCSearchJob.m
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCSearchJob.h"
#import "VelosiDesigner.h"
#import "VelosiCustomPicker.h"
#import "CountryList.h"
#import "VCJobSummary.h"
#import "MBProgressHUD.h"
#import "VCCountrySelection.h"

@interface VCSearchJob (){
    UITapGestureRecognizer *_mainViewTapRecognizer;
    NSArray *_searchIns, *_jobTypes, *_postedWithins;
    UIPickerView *_pickerSearchIns, *_pickerJobTypes, *_pickerPostedWithins;
    
    NSDictionary *_dCountry, *_dSearchIns, *_dJobTypes, *_dPostedWithins;
    CountryList *_countryList;
    NSMutableArray *_results;
}

@end

@implementation VCSearchJob

static VCSearchJob *instance;

+ (VCSearchJob *)getInstance{
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(instance)
        instance = nil;
    instance = self;

    _countryList = [[CountryList alloc] init];
    _searchIns = @[@"Job Title and Description", @"Job Title", @"Job Description"];
    _dSearchIns = [NSDictionary dictionaryWithObjects:@[@"0", @"1", @"2"] forKeys:_searchIns];
    _jobTypes = @[@"Permanent", @"Contract", @"Temporary", @"Part time", @"Ad hoc", @"Any"];
    _dJobTypes = [NSDictionary dictionaryWithObjects:@[@"1", @"2", @"3", @"4", @"5", @"9"] forKeys:_jobTypes];
    _postedWithins = @[@"Any", @"42 Days", @"35 Days", @"28 Days", @"21 Days", @"14 Days", @"7 Days",@"1 Day"];
    _dPostedWithins = [NSDictionary dictionaryWithObjects:@[@"0", @"42", @"35", @"28", @"21", @"14", @"7", @"1"] forKeys:_postedWithins];
    _pickerSearchIns = [[VelosiCustomPicker alloc] initWithElements:_searchIns andRowSelectionDelegate:self hasAll:NO];
    _pickerJobTypes = [[VelosiCustomPicker alloc] initWithElements:_jobTypes andRowSelectionDelegate:self hasAll:NO];
    _pickerPostedWithins = [[VelosiCustomPicker alloc] initWithElements:_postedWithins andRowSelectionDelegate:self hasAll:NO];
    
    _mainViewTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onMainViewTapped)];
    _mainViewTapRecognizer.delegate = self;
    [self.view addGestureRecognizer:_mainViewTapRecognizer];
    
    self.lv.delegate = self;
    self.lv.dataSource = self;
    self.lv.allowsSelection = YES;
    self.lv.rowHeight = 48;
    self.lv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.fieldSearchFor = [[UITextField alloc] init];
    self.fieldSearchIn = [[UITextField alloc] init];
    self.fieldDistance = [[UITextField alloc] init];
    self.fieldJobType = [[UITextField alloc] init];
    self.fieldPostedWithin = [[UITextField alloc] init];
    
    [VelosiDesigner makeVelosiTextField:self.fieldSearchFor];
    [VelosiDesigner makeVelosiTextField:self.fieldSearchIn];
    [VelosiDesigner makeVelosiTextField:self.fieldJobType];
    [VelosiDesigner makeVelosiTextField:self.fieldDistance];
    [VelosiDesigner makeVelosiTextField:self.fieldPostedWithin];
    
    self.fieldSearchFor.delegate = self;
    self.fieldSearchIn.delegate = self;
    self.fieldDistance.delegate = self;
    self.fieldJobType.delegate = self;
    self.fieldPostedWithin.delegate = self;
    
    self.fieldSearchIn.text = [_searchIns objectAtIndex:0];
    self.fieldJobType.text = [_jobTypes objectAtIndex:0];
    self.fieldPostedWithin.text = [_postedWithins objectAtIndex:0];
    self.fieldDistance.text =@"100";
}

-  (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.navigationBar.topItem.leftBarButtonItem.title = (self.appDelegate.offlineGateway.isLoggedIn)?@"Profile":@"Login";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;

    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    return [self makeInputableCell:cell title:@"Search For" textField:self.fieldSearchFor textFieldInset:100];
                    
                default:
                    return [self makeInputableCell:cell title:@"Search In" textField:self.fieldSearchIn textFieldInset:100];
            }
            
        case 1:
            switch (indexPath.row) {
                case 0:
                    
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell1"];
                    cell.textLabel.font = [UIFont systemFontOfSize:15];
                    cell.textLabel.text = @"Location";
                    cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
                    cell.detailTextLabel.text = @"Select";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;

                    return cell;
                    
                case 1:
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell2"];
                    cell.textLabel.font = [UIFont systemFontOfSize:15];
                    cell.textLabel.text = @"Country / Region";
                    cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
                    cell.detailTextLabel.text = @"Select";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    return cell;
                    
                default:
                    break;
            }
            
        default:
            switch (indexPath.row) {
                case 0:
                    return [self makeInputableCell:cell title:@"Distance" textField:self.fieldDistance textFieldInset:120];

                case 1:
                    return [self makeInputableCell:cell title:@"Job Type" textField:self.fieldJobType textFieldInset:120];
                    
                default:
                    return [self makeInputableCell:cell title:@"Posted within" textField:self.fieldPostedWithin textFieldInset:120];
            }
            
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //Assuming at section 1
    [self performSegueWithIdentifier:(indexPath.row==0)?@"segueToLocationSelection":@"segueToCountrySelection" sender:[self.lv cellForRowAtIndexPath:indexPath]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
        case 1:
            return 2;
            break;
            
        default:
            return 3;
    }
}

- (void)pickerSelection:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(pickerView == _pickerSearchIns)
        self.fieldSearchIn.text = [_searchIns objectAtIndex:row];
    else if(pickerView == _pickerJobTypes)
        self.fieldJobType.text = [_jobTypes objectAtIndex:row];
    else if(pickerView == _pickerPostedWithins)
        self.fieldPostedWithin = [_postedWithins objectAtIndex:row];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return (touch.view == [self.lv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]].contentView || touch.view == [self.lv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].contentView)?NO:YES;
}

- (UITableViewCell *)makeInputableCell:(UITableViewCell *)cell title:(NSString *)title textField:(UITextField *)textField textFieldInset:(CGFloat)inset{
    cell = [[UITableViewCell alloc] init];
    CGRect cf = cell.contentView.frame;
    
    //create label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 3, cf.size.width, cf.size.height)];
    label.font = [UIFont systemFontOfSize:15];
    label.text = title;
    
    //updaate textField
    textField.frame = CGRectMake(inset, cell.center.y-13, cf.size.width-10-inset, 30);
    
    [cell.contentView addSubview:label];
    [cell.contentView addSubview:textField];
    return cell;
}

- (void)onMainViewTapped{
    [self.view endEditing:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [VelosiDesigner makeVelosiFocusedTextField:textField];
    
    if(textField == self.fieldDistance || textField == self.fieldJobType || textField == self.fieldPostedWithin){
        if(textField == self.fieldDistance)
            textField.keyboardType = UIKeyboardTypeNumberPad;
        
        [self adjustViewForShowingKeyBoard:textField];
    }
    
    if(textField == self.fieldSearchIn)
        textField.inputView = _pickerSearchIns;
    else if(textField == self.fieldJobType)
        textField.inputView = _pickerJobTypes;
    else if(textField == self.fieldPostedWithin)
        textField.inputView = _pickerPostedWithins;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [VelosiDesigner makeVelosiTextField:textField];
    
    if(textField == self.fieldSearchIn || textField == self.fieldDistance || textField == self.fieldJobType || textField == self.fieldPostedWithin){
        [self adjustViewForHidingKeyBoard];
        
        if (textField == self.fieldDistance && [self.fieldDistance.text length] < 1) {
            textField.text = @"100";
        }
    }
}

- (void)adjustViewForShowingKeyBoard:(UITextField *)textField{
    CGRect vf = self.view.frame;
    CGRect f = textField.superview.superview.frame;
    vf.origin.y = vf.size.height-vf.size.height-f.origin.y-f.size.height+280;
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0];
    [UIView setAnimationCurve:7];
    
    // set views with new info
    self.view.frame = vf;
    
    
    // commit animations
    [UIView commitAnimations];
}

- (void)adjustViewForHidingKeyBoard{
    CGRect containerFrame = self.view.frame;
    containerFrame.origin.y = 0;
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0];
    [UIView setAnimationCurve:7];
    
    // set views with new info
    self.view.frame = containerFrame;
    
    
    // commit animations
    [UIView commitAnimations];
}

- (IBAction)done:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *searched = self.fieldSearchFor.text;
        NSString *searchIn = [_dSearchIns objectForKey:self.fieldSearchIn.text];
        NSString *location = [self.lv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].detailTextLabel.text;
        NSString *country = [self.lv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]].detailTextLabel.text;
        NSString *countryId;
        NSString *distance = self.fieldDistance.text;
        NSString *jobType = [_dJobTypes objectForKey:self.fieldJobType.text];
        NSString *posted = [_dPostedWithins objectForKey:self.fieldPostedWithin.text];
        
        if([location isEqualToString:@"Select"])
            location = @"";
        
        countryId = ([country isEqualToString:@"Select"])?@"0":[_countryList.countryIds objectForKey:country];
        
        _results = [self.appDelegate.onlineGateway getAdvanceSearchResults:searched in:searchIn location:location radius:distance jobType:jobType country:countryId postedWithin:posted];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self performSegueWithIdentifier:@"segueToJobSummary" sender:sender];
        });
    });
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(sender == self.navigationController.navigationBar.topItem.rightBarButtonItem){
        VCJobSummary *vcJobSummary = (VCJobSummary *)segue.destinationViewController;
        vcJobSummary.jobs = _results;
    }
    
    if([segue.identifier isEqualToString:@"segueToCountrySelection"])
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender];
}

- (IBAction)segueToProfile:(id)sender {
    [self presentViewController:[self.appDelegate.userPageNavigators getSwitchingPage] animated:YES completion:nil];
}
@end
