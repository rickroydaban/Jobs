//
//  VCSavedSearchDetail.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCSavedSearchDetail.h"
#import "VelosiCustomPicker.h"
#import "VCCountrySelection.h"
#import "VCLocationSelection.h"
#import "MBProgressHUD.h"

@interface VCSavedSearchDetail(){
    VelosiCustomPicker *_pickerSearchIns, *_pickerJobTypes, *_pickerPostedWithins;
    NSMutableDictionary *_selectedLocation;
}
@end

@implementation VCSavedSearchDetail

- (void)viewDidLoad{
    [super viewDidLoad];
    _selectedLocation = [NSMutableDictionary dictionary];
    
    _pickerSearchIns = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propListSearchIns rowSelectionDelegate:self selectedItem:nil];
    _pickerJobTypes = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propListJobTypes rowSelectionDelegate:self selectedItem:nil];
    _pickerPostedWithins = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propListPostedWithins rowSelectionDelegate:self selectedItem:nil];
    
    _propFieldName.text = [_propSavedSearch getName];
    _propFieldSearchFor.text = [_propSavedSearch getSearchFor];
    _propFieldSearchIn.text = [_propSavedSearch getSearchIn];
    [_pickerSearchIns selectRowWithText:_propFieldSearchIn.text];
    _propCellLocation.detailTextLabel.text = [_propSavedSearch getLocation];
    _propCellCountry.detailTextLabel.text = [self.propAppDelegate.propListCountries.propDictCountryIds allKeysForObject:[_propSavedSearch getCountryID]][0];
    _propFieldDistance.text = [_propSavedSearch getDistance];
    _propFieldJobType.text = [_propSavedSearch getJobType];
    [_pickerJobTypes selectRowWithText:_propFieldJobType.text];
    _propFieldPostedWithin.text = [self.propAppDelegate.propDictPostedWithins allKeysForObject:[_propSavedSearch getPostedWithin]][0];
    [_pickerPostedWithins selectRowWithText:_propFieldPostedWithin.text];
    
    _propFieldName.delegate = self;
    _propFieldSearchFor.delegate = self;
    _propFieldSearchIn.delegate = self;
    _propFieldDistance.delegate = self;
    _propFieldJobType.delegate = self;
    _propFieldPostedWithin.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"%@",_selectedLocation);
}

- (IBAction)done:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *searchInID = [self.propAppDelegate.propDictSearchIns objectForKey:_propFieldSearchIn.text];
    NSString *countryID = [self.propAppDelegate.propListCountries.propDictCountryIds objectForKey:_propCellCountry.detailTextLabel.text];
    NSString *jobTypeID = [self.propAppDelegate.propDictJobTypes objectForKey:_propFieldJobType.text];
    NSString *postedWithin = [self.propAppDelegate.propDictPostedWithins objectForKey:_propFieldPostedWithin];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *result = [self.propAppDelegate.propGatewayOnline saveSavedSearchesWithJSONContents:[_propSavedSearch jsonFromName:_propFieldName.text searchFor:_propFieldSearchFor.text searchInID:searchInID searchIn:_propFieldSearchIn.text location:_propCellLocation.detailTextLabel.text lat:@"0" lng:@"0" countryID:countryID distance:_propFieldDistance.text jobTypeID:jobTypeID jobType:_propFieldJobType.text postedWithin:postedWithin]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[[UIAlertView alloc] initWithTitle:@" " message:(result!=nil)?result:@"Saved Successfully!" delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            [self.view endEditing:YES];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField == _propFieldSearchIn)
        textField.inputView = _pickerSearchIns;
    else if(textField == _propFieldJobType)
        textField.inputView = _pickerJobTypes;
    else if(textField == _propFieldPostedWithin)
        textField.inputView = _pickerPostedWithins;
}

- (void)pickerSelection:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(pickerView == _pickerSearchIns)
        self.propFieldSearchIn.text = [self.propAppDelegate.propListSearchIns objectAtIndex:row];
    else if(pickerView == _pickerJobTypes)
        self.propFieldJobType.text = [self.propAppDelegate.propListJobTypes objectAtIndex:row];
    else if(pickerView == _pickerPostedWithins)
        self.propFieldPostedWithin.text = [self.propAppDelegate.propListPostedWithins objectAtIndex:row];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@",sender);
    if([segue.identifier isEqualToString:@"segueSavedSearchDetailToLoation"])
        [(VCLocationSelection *)segue.destinationViewController cellSelectorSelectedCell:sender withObject:_selectedLocation];
    else if([segue.identifier isEqualToString:@"segueSavedSearchDetailToCountry"])
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender withObject:nil];
}


@end
