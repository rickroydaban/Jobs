//
//  VCSavedSearchDetail.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCSavedSearchDetail.h"
#import "VelosiCustomPicker.h"

@interface VCSavedSearchDetail(){
    VelosiCustomPicker *_pickerSearchIns, *_pickerJobTypes, *_pickerPostedWithins;
    
}
@end

@implementation VCSavedSearchDetail

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _pickerSearchIns = [[VelosiCustomPicker alloc] initWithElements:self.propAppDelegate.propListSearchIns andRowSelectionDelegate:self hasAll:NO];
    _pickerJobTypes = [[VelosiCustomPicker alloc] initWithElements:self.propAppDelegate.propListJobTypes andRowSelectionDelegate:self hasAll:NO];
    _pickerPostedWithins = [[VelosiCustomPicker alloc] initWithElements:self.propAppDelegate.propListPostedWithins andRowSelectionDelegate:self hasAll:NO];
    
    _propFieldName.text = _propSavedSearch.propTitle;
    _propFieldSearchFor.text = _propSavedSearch.propSearchFor;
    _propFieldSearchIn.text = [self.propAppDelegate.propDictSearchIns allKeysForObject:[NSString stringWithFormat:@"%d",_propSavedSearch.propSearchIn]][0];
    _propCellLocation.detailTextLabel.text = _propSavedSearch.propLocation;
    _propCellCountry.detailTextLabel.text = [self.propAppDelegate.propListCountries.propDictCountryIds allKeysForObject:[NSString stringWithFormat:@"%d",_propSavedSearch.propCountryID]][0];
    _propFieldDistance.text = [NSString stringWithFormat:@"%d",_propSavedSearch.propDistance];
    _propFieldJobType.text = [self.propAppDelegate.propDictJobTypes allKeysForObject:[NSString stringWithFormat:@"%d",_propSavedSearch.propJobTypeID]][0];
    _propFieldPostedWithin.text = [self.propAppDelegate.propDictPostedWithins allKeysForObject:[NSString stringWithFormat:@"%d",_propSavedSearch.propPostedWithin]][0];
    _propSwitchSendEmail.on = (_propSavedSearch.propEmailAlert)?YES:NO;
    
    _propFieldName.delegate = self;
    _propFieldSearchFor.delegate = self;
    _propFieldSearchIn.delegate = self;
    _propFieldDistance.delegate = self;
    _propFieldJobType.delegate = self;
    _propFieldPostedWithin.delegate = self;
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


@end
