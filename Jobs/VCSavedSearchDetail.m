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
#import "VCJobSummary.h"
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
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(save)],[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search)]];
    
    _pickerSearchIns = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propListSearchIns rowSelectionDelegate:self selectedItem:nil];
    _pickerJobTypes = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propListJobTypes rowSelectionDelegate:self selectedItem:nil];
    _pickerPostedWithins = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propListPostedWithins rowSelectionDelegate:self selectedItem:nil];
    
    NSLog(@"name %@",[_propSavedSearch getName]);
    _propFieldName.text = [_propSavedSearch getName];
    NSLog(@"search for %@",[_propSavedSearch getSearchFor]);
    _propFieldSearchFor.text = [_propSavedSearch getSearchFor];
    NSLog(@"search in %@",[_propSavedSearch getSearchIn]);
    _propFieldSearchIn.text = [_propSavedSearch getSearchIn];
    [_pickerSearchIns selectRowWithText:_propFieldSearchIn.text];
    NSLog(@"location %@",[_propSavedSearch getLocation]);
    _propCellLocation.detailTextLabel.text = [_propSavedSearch getLocation];
    NSLog(@"country %@",[_propSavedSearch getCountryID]);
    _propCellCountry.detailTextLabel.text = [self.propAppDelegate.propCountries.propDictCountryIds objectForKey:[_propSavedSearch getCountryID]];
    NSLog(@"distance %@",[_propSavedSearch getDistance]);
    _propFieldDistance.text = [_propSavedSearch getDistance];
    NSLog(@"jobtypeID %@",[_propSavedSearch getJobTypeID]);
    _propFieldJobType.text = [self.propAppDelegate.propDictJobTypesForSearch allKeysForObject:[NSString stringWithFormat:@"%@",[_propSavedSearch getJobTypeID]]][0];
    [_pickerJobTypes selectRowWithText:_propFieldJobType.text];
    NSLog(@"posted %@",[_propSavedSearch getPostedWithin]);
    _propFieldPostedWithin.text = [self.propAppDelegate.propDictPostedWithins allKeysForObject:[_propSavedSearch getPostedWithin]][0];
    [_pickerPostedWithins selectRowWithText:_propFieldPostedWithin.text];
    
    _propFieldName.delegate = self;
    _propFieldSearchFor.delegate = self;
    _propFieldSearchIn.delegate = self;
    _propFieldDistance.delegate = self;
    _propFieldJobType.delegate = self;
    _propFieldPostedWithin.delegate = self;
}

- (void)save{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *searchInID = [self.propAppDelegate.propDictSearchIns objectForKey:_propFieldSearchIn.text];
    NSString *countryID = [self.propAppDelegate.propCountries.propDictCountryIds objectForKey:_propCellCountry.detailTextLabel.text];
    NSString *jobTypeID = [self.propAppDelegate.propDictJobTypesForSearch objectForKey:_propFieldJobType.text];
    NSString *postedWithin = [self.propAppDelegate.propDictPostedWithins objectForKey:_propFieldPostedWithin.text];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *result = [self.propAppDelegate.propGatewayOnline saveSavedSearchesWithJSONContents:[_propSavedSearch jsonFromName:_propFieldName.text searchFor:_propFieldSearchFor.text searchInID:searchInID searchIn:_propFieldSearchIn.text location:_propCellLocation.detailTextLabel.text lat:@"0" lng:@"0" countryID:countryID distance:_propFieldDistance.text jobTypeID:jobTypeID jobType:_propFieldJobType.text postedWithin:postedWithin]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[[UIAlertView alloc] initWithTitle:@" " message:(result)?result:self.propAppDelegate.messageSaveSuccessful delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            [self.view endEditing:YES];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (void)search{
    [self performSegueWithIdentifier:@"savedSearchToJobSummary" sender:nil];
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
    if([segue.identifier isEqualToString:@"segueSavedSearchDetailToLoation"])
        [(VCLocationSelection *)segue.destinationViewController cellSelectorSelectedCell:sender withObject:_selectedLocation];
    else if([segue.identifier isEqualToString:@"segueSavedSearchDetailToCountry"])
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender withObject:nil];
    else if([segue.identifier isEqualToString:@"savedSearchToJobSummary"]){
        NSString *searchCountryID = ([_propCellCountry.detailTextLabel.text isEqualToString:@"Any"])?@"0":[self.propAppDelegate.propCountries.propDictCountryIds allKeysForObject:_propCellCountry.detailTextLabel.text][0];
        NSString *searchLocation = ([_propCellLocation.detailTextLabel.text isEqualToString:@"Any"])?@"0":_propCellLocation.detailTextLabel.text;
        
        VCJobSummary *vcJobSummary = (VCJobSummary *)segue.destinationViewController;
        vcJobSummary.propSearchFor = self.propFieldSearchFor.text;
        vcJobSummary.propSearchIn = self.propFieldSearchIn.text;
        vcJobSummary.propSearchLocationID = searchLocation;
        vcJobSummary.propSearchLocation = _propCellLocation.detailTextLabel.text;
        vcJobSummary.propSearchCountryID = searchCountryID;
        vcJobSummary.propSearchDistance = self.propFieldDistance.text;
        vcJobSummary.propSearchJobType = self.propFieldJobType.text;
        vcJobSummary.propSearchPostedWithin = [self.propAppDelegate.propDictPostedWithins objectForKey:self.propFieldPostedWithin.text];
    }
}


@end
