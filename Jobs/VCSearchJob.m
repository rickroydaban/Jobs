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
#import "CellSelector.h"

@interface VCSearchJob (){
    UIPickerView *_pickerSearchIns, *_pickerJobTypes, *_pickerPostedWithins;
}
@end

@implementation VCSearchJob

- (void)viewDidLoad {
    [super viewDidLoad];
        
    _pickerSearchIns = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propListSearchIns rowSelectionDelegate:self selectedItem:nil];
    _pickerJobTypes = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propListJobTypes rowSelectionDelegate:self selectedItem:nil];
    _pickerPostedWithins = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propListPostedWithins rowSelectionDelegate:self selectedItem:nil];
    
    self.propFieldSearchFor.delegate = self;
    self.propFieldSearchIn.delegate = self;
    self.propFieldDistance.delegate = self;
    self.propFieldJobType.delegate = self;
    self.propFieldPostedWithin.delegate = self;
    
    self.propFieldSearchIn.text = [self.propAppDelegate.propListSearchIns objectAtIndex:0];
    self.propFieldJobType.text = [self.propAppDelegate.propListJobTypes objectAtIndex:0];
    self.propFieldPostedWithin.text = [self.propAppDelegate.propListPostedWithins objectAtIndex:0];
    self.propFieldDistance.text =@"100";
}

- (void)pickerSelection:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(pickerView == _pickerSearchIns)
        self.propFieldSearchIn.text = [self.propAppDelegate.propListSearchIns objectAtIndex:row];
    else if(pickerView == _pickerJobTypes)
        self.propFieldJobType.text = [self.propAppDelegate.propListJobTypes objectAtIndex:row];
    else if(pickerView == _pickerPostedWithins)
        self.propFieldPostedWithin = [self.propAppDelegate.propListPostedWithins objectAtIndex:row];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [super textFieldDidEndEditing:textField];
    
    if(textField == self.propFieldSearchIn)
        textField.inputView = _pickerSearchIns;
    else if(textField == self.propFieldJobType)
        textField.inputView = _pickerJobTypes;
    else if(textField == self.propFieldDistance)
        textField.keyboardType = UIKeyboardTypeNumberPad;
    else if(textField == self.propFieldPostedWithin)
        textField.inputView = _pickerPostedWithins;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [super textFieldDidEndEditing:textField];
    
    if (textField == self.propFieldDistance && [self.propFieldDistance.text length] < 1)
        textField.text = @"100";
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(sender == self.navigationController.navigationBar.topItem.rightBarButtonItem){
        NSString *searchCountry = ([_propCellCountry.detailTextLabel.text isEqualToString:@"Any"])?@"0":[self.propAppDelegate.propCountries.propDictCountryIds objectForKey:_propCellCountry.detailTextLabel.text];
        NSString *searchLocation = ([_propCellLocation.detailTextLabel.text isEqualToString:@"Any"])?@"0":_propCellLocation.detailTextLabel.text;
        
        VCJobSummary *vcJobSummary = (VCJobSummary *)segue.destinationViewController;
        vcJobSummary.propSearchFor = self.propFieldSearchFor.text;
        vcJobSummary.propSearchIn = [self.propAppDelegate.propDictSearchIns objectForKey:self.propFieldSearchIn.text];
        vcJobSummary.propSearchLocation = searchLocation;
        vcJobSummary.propSearchCountry = searchCountry;
        vcJobSummary.propSearchDistance = self.propFieldDistance.text;
        vcJobSummary.propSearchJobType = [self.propAppDelegate.propDictJobTypes objectForKey:self.propFieldJobType.text];
        vcJobSummary.propSearchPostedWithin = [self.propAppDelegate.propDictPostedWithins objectForKey:self.propFieldPostedWithin.text];
    }else{
        [(NSObject<CellSelector> *)segue.destinationViewController cellSelectorSelectedCell:sender withObject:nil];
    }    
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}
@end
