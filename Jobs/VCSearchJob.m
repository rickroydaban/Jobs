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
#import "VCJobSummary.h"
#import "MBProgressHUD.h"
#import "VCCountrySelection.h"
#import "VCLocationSelection.h"

@interface VCSearchJob (){
    UITapGestureRecognizer *_mainViewTapRecognizer;
    UIPickerView *_pickerSearchIns, *_pickerJobTypes, *_pickerPostedWithins;
    NSMutableArray *_results;
}

@end

@implementation VCSearchJob


- (void)viewDidLoad {
    [super viewDidLoad];
        
    _pickerSearchIns = [[VelosiCustomPicker alloc] initWithElements:self.propAppDelegate.propListSearchIns andRowSelectionDelegate:self hasAll:NO];
    _pickerJobTypes = [[VelosiCustomPicker alloc] initWithElements:self.propAppDelegate.propListJobTypes andRowSelectionDelegate:self hasAll:NO];
    _pickerPostedWithins = [[VelosiCustomPicker alloc] initWithElements:self.propAppDelegate.propListPostedWithins andRowSelectionDelegate:self hasAll:NO];
    
    _mainViewTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onMainViewTapped)];
    _mainViewTapRecognizer.delegate = self;
    [self.view addGestureRecognizer:_mainViewTapRecognizer];
    
    self.propLv.delegate = self;
    self.propLv.dataSource = self;
    self.propLv.allowsSelection = YES;
    self.propLv.rowHeight = 48;
    self.propLv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
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
    
    self.fieldSearchIn.text = [self.propAppDelegate.propListSearchIns objectAtIndex:0];
    self.fieldJobType.text = [self.propAppDelegate.propListJobTypes objectAtIndex:0];
    self.fieldPostedWithin.text = [self.propAppDelegate.propListPostedWithins objectAtIndex:0];
    self.fieldDistance.text =@"100";
}

-  (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.navigationBar.topItem.leftBarButtonItem.title = (self.propAppDelegate.propGatewayOffline.isLoggedIn)?@"Profile":@"Login";
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
    [self performSegueWithIdentifier:(indexPath.row==0)?@"segueToLocationSelection":@"segueToCountrySelection" sender:[self.propLv cellForRowAtIndexPath:indexPath]];
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
        self.fieldSearchIn.text = [self.propAppDelegate.propListSearchIns objectAtIndex:row];
    else if(pickerView == _pickerJobTypes)
        self.fieldJobType.text = [self.propAppDelegate.propListJobTypes objectAtIndex:row];
    else if(pickerView == _pickerPostedWithins)
        self.fieldPostedWithin = [self.propAppDelegate.propListPostedWithins objectAtIndex:row];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return (touch.view == [self.propLv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]].contentView || touch.view == [self.propLv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].contentView)?NO:YES;
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
        NSString *searchIn = [self.propAppDelegate.propDictSearchIns objectForKey:self.fieldSearchIn.text];
        NSString *location = [self.propLv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].detailTextLabel.text;
        NSString *country = [self.propLv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]].detailTextLabel.text;
        NSString *countryId;
        NSString *distance = self.fieldDistance.text;
        NSString *jobType = [self.propAppDelegate.propDictJobTypes objectForKey:self.fieldJobType.text];
        NSString *posted = [self.propAppDelegate.propDictPostedWithins objectForKey:self.fieldPostedWithin.text];
        
        if([location isEqualToString:@"Select"])
            location = @"";
        
        countryId = ([country isEqualToString:@"Select"])?@"0":[self.propAppDelegate.propListCountries.propDictCountryIds objectForKey:country];
        
        _results = [self.propAppDelegate.propGatewayOnline getAdvanceSearchResults:searched in:searchIn location:location radius:distance jobType:jobType country:countryId postedWithin:posted];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self performSegueWithIdentifier:@"segueToJobSummary" sender:sender];
        });
    });
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(sender == self.navigationController.navigationBar.topItem.rightBarButtonItem){
        VCJobSummary *vcJobSummary = (VCJobSummary *)segue.destinationViewController;
        vcJobSummary.propListJobs = _results;
    }
    
    if([segue.identifier isEqualToString:@"segueToCountrySelection"])
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender];
    else if([segue.identifier isEqualToString:@"segueToLocationSelection"])
        [(VCLocationSelection *)segue.destinationViewController cellSelectorSelectedCell:sender];
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}
@end
