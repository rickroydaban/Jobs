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
    
}
@end

@implementation VCSavedSearchDetail

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _pickerSearchIns = [[VelosiCustomPicker alloc] initWithElements:self.propAppDelegate.propListSearchIns andRowSelectionDelegate:self hasAll:NO];
    _pickerJobTypes = [[VelosiCustomPicker alloc] initWithElements:self.propAppDelegate.propListJobTypes andRowSelectionDelegate:self hasAll:NO];
    _pickerPostedWithins = [[VelosiCustomPicker alloc] initWithElements:self.propAppDelegate.propListPostedWithins andRowSelectionDelegate:self hasAll:NO];
    
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
    _propSwitchSendEmail.on = ([_propSavedSearch willAlert])?YES:NO;
    
    _propFieldName.delegate = self;
    _propFieldSearchFor.delegate = self;
    _propFieldSearchIn.delegate = self;
    _propFieldDistance.delegate = self;
    _propFieldJobType.delegate = self;
    _propFieldPostedWithin.delegate = self;
}

- (IBAction)done:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *searchInID = [self.propAppDelegate.propDictSearchIns allKeysForObject:_propFieldSearchIn.text][0];
    NSString *countryID = [self.propAppDelegate.propListCountries.propDictCountryIds allKeysForObject:_propCellCountry.detailTextLabel.text][0];
    NSString *jobTypeID = [self.propAppDelegate.propDictJobTypes allKeysForObject:_propFieldJobType.text][0];
    NSString *postedWithin = [self.propAppDelegate.propDictPostedWithins allKeysForObject:_propFieldPostedWithin][0];
    
    [self.propAppDelegate.propGatewayOnline saveSavedSearchesWithJSONContents:[_propSavedSearch jsonFromName:_propFieldName.text searchFor:_propFieldSearchFor.text searchInID:searchInID searchIn:_propFieldSearchIn.text location:_propCellLocation.detailTextLabel.text lat:0 lng:0 countryID:countryID distance:_propFieldDistance.text jobTypeID:jobTypeID jobType:_propFieldJobType.text postedWithin:postedWithin willAlert:(_propSwitchSendEmail.isOn)?@"true":@"false"] connectionDelegate:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"failed %@",error);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"response %@",response);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding]);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"success!");
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void) connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
        [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]
             forAuthenticationChallenge:challenge];
    }
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

- (BOOL) connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace{
    if([[protectionSpace authenticationMethod] isEqualToString:NSURLAuthenticationMethodServerTrust]){
        return YES;
    }
    
    return NO;
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
        [(VCLocationSelection *)segue.destinationViewController cellSelectorSelectedCell:sender];
    else if([segue.identifier isEqualToString:@"segueSavedSearchDetailToCountry"])
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender];
}


@end
