//
//  VCUserDetails.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserDetails.h"
#import "VelosiDesigner.h"
#import "VelosiColors.h"
#import "VelosiCustomPicker.h"
#import "User.h"
#import "VCCountrySelection.h"
#import "VCLanguages.h"
#import "MBProgressHUD.h"

@interface VCUserDetails(){
    VelosiCustomPicker *_pickerGender, *_pickerYearGraduated, *_pickerEducation, *_pickerLicense, *_pickerNationality, *_pickerEthnicity, *_pickerReferrers, *_pickerStatus, *_pickerWillRelocate, *_pickerAvailability, *_pickerSalaryType, *_pickerCurrency;
    UIDatePicker *_pickerBday, *_pickerAvailableFrom;
}
@end

@implementation VCUserDetails

- (void)viewDidLoad{
    [super viewDidLoad];

    self.propListLocationPrefs = [NSMutableArray array];
    self.propListLanguages = [NSMutableArray array];
    
    [self manageTextField:self.fieldFirstName withValue:[self.propAppDelegate.propGatewayOffline getFirstName]];
    [self manageTextField:self.fieldLastName withValue:[self.propAppDelegate.propGatewayOffline getLastName]];
    [self manageTextField:self.fieldEmail withValue:[self.propAppDelegate.propGatewayOffline getEmail]];
    [self manageTextField:self.fieldAltEmail withValue:[self.propAppDelegate.propGatewayOffline getAlternateEmail]];
    [self manageTextField:self.fieldGender withValue:[self.propAppDelegate.propGatewayOffline getGender]];
    [self manageTextField:self.fieldPhone withValue:[self.propAppDelegate.propGatewayOffline getPhone]];
    [self manageTextField:self.fieldAltPhone withValue:[self.propAppDelegate.propGatewayOffline getAlternatePhone]];
    [self manageTextField:self.fieldMobile withValue:[self.propAppDelegate.propGatewayOffline getMobile]];
    [self manageTextField:self.fieldBirthdate withValue:[self.propAppDelegate.propGatewayOffline getBirthdate]];
    
    [self manageTextField:self.fieldAddress withValue:[self.propAppDelegate.propGatewayOffline getAddress]];
    [self manageTextField:self.fieldCity withValue:[self.propAppDelegate.propGatewayOffline getCity]];
    [self manageTextField:self.fieldCountryState withValue:[self.propAppDelegate.propGatewayOffline getCountryState]];
    [self manageTextField:self.fieldPostcode withValue:[self.propAppDelegate.propGatewayOffline getPostcode]];
    [self manageTextField:self.fieldLinkedin withValue:[self.propAppDelegate.propGatewayOffline getLinkedin]];
    [self manageTextField:self.fieldTwitter withValue:[self.propAppDelegate.propGatewayOffline getTwitter]];
    [self manageTextField:self.fieldSkype withValue:[self.propAppDelegate.propGatewayOffline getSkype]];
    
    [self manageTextField:self.fieldUniversity withValue:[self.propAppDelegate.propGatewayOffline getUniversity]];
    [self manageTextField:self.fieldSubject withValue:[self.propAppDelegate.propGatewayOffline getSubject]];
    [self manageTextField:self.fieldYearGraduated withValue:[self.propAppDelegate.propGatewayOffline getYearGraduated]];
    [self manageTextField:self.fieldEducation withValue:[self.propAppDelegate.propGatewayOffline getEducation]];

    [self manageTextField:self.fieldLicense withValue:[self.propAppDelegate.propGatewayOffline getDrivingLicense]];
    [self manageTextField:self.fieldNationality withValue:[self.propAppDelegate.propGatewayOffline getNationality]];
    [self manageTextField:self.fieldEthnicity withValue:[self.propAppDelegate.propGatewayOffline getEthnicity]];
    [self manageTextField:self.fieldReferrer withValue:[self.propAppDelegate.propGatewayOffline getReferrer]];
    [self manageTextField:self.fieldMaritalStatus withValue:[self.propAppDelegate.propGatewayOffline getMaritalStatus]];

    [self manageTextField:self.fieldWillRelocate withValue:[self.propAppDelegate.propGatewayOffline getWillRelocate]];
    [self manageTextField:self.fieldNoticePeriod withValue:[self.propAppDelegate.propGatewayOffline getNoticePeriod]];
    [self manageTextField:self.fieldAvailableFrom withValue:[self.propAppDelegate.propGatewayOffline getAvailableFrom]];

    [self manageTextField:self.fieldJobTitles withValue:[self.propAppDelegate.propGatewayOffline getPreferredJobTitles]];
    [self manageTextField:self.fieldCurrency withValue:[self.propAppDelegate.propGatewayOffline getCurrency]];

    [self manageTextField:self.fieldSalaryFrom withValue:[self.propAppDelegate.propGatewayOffline getSalaryFrom]];
    [self manageTextField:self.fieldSalaryTo withValue:[self.propAppDelegate.propGatewayOffline getSalaryTo]];
    [self manageTextField:self.fieldSalaryType withValue:[self.propAppDelegate.propGatewayOffline getSalaryType]];

    self.cellCountry.detailTextLabel.text = [self.propAppDelegate.propGatewayOffline getCountry];
    self.cellPreferredLocation.detailTextLabel.text = [NSString stringWithFormat:@"%d",(int)self.propListLocationPrefs.count];
    self.cellLanguages.detailTextLabel.text = [NSString stringWithFormat:@"%d",(int)self.propListLanguages.count];

    self.switchEUAuthorized.on = [self.propAppDelegate.propGatewayOffline isEUAuthorized];
    self.switchWillAllowAlerts.on = [self.propAppDelegate.propGatewayOffline isAlertsAllowed];
    self.switchIsPermanent.on = [self.propAppDelegate.propGatewayOffline isPermanent];
    self.switchIsTemporary.on = [self.propAppDelegate.propGatewayOffline isTemporary];
    self.switchIsContract.on = [self.propAppDelegate.propGatewayOffline isContract];
    self.switchIsParttime.on = [self.propAppDelegate.propGatewayOffline isPartTime];
    self.fieldMainSkills.text = [self.propAppDelegate.propGatewayOffline getMainSkills];
    
    self.fieldFirstName.delegate = self;
    self.fieldLastName.delegate = self;
    self.fieldEmail.delegate = self;
    self.fieldAltEmail.delegate = self;
    self.fieldGender.delegate = self;
    self.fieldPhone.delegate = self;
    self.fieldAltPhone.delegate = self;
    self.fieldMobile.delegate = self;
    self.fieldBirthdate.delegate = self;
    
    self.fieldAddress.delegate = self;
    self.fieldCity.delegate = self;
    self.fieldCountryState.delegate = self;
    self.fieldPostcode.delegate = self;
    self.fieldLinkedin.delegate = self;
    self.fieldTwitter.delegate = self;
    self.fieldSkype.delegate = self;
    
    self.fieldUniversity.delegate = self;
    self.fieldSubject.delegate = self;
    self.fieldYearGraduated.delegate = self;
    self.fieldEducation.delegate = self;
    
    self.fieldLicense.delegate = self;
    self.fieldNationality.delegate = self;
    self.fieldEthnicity.delegate = self;
    self.fieldReferrer.delegate = self;
    self.fieldMaritalStatus.delegate = self;
    
    self.fieldWillRelocate.delegate = self;
    self.fieldNoticePeriod.delegate = self;
    self.fieldAvailableFrom.delegate = self;
    self.fieldJobTitles.delegate = self;
    self.fieldCurrency.delegate = self;
    
    self.fieldSalaryFrom.delegate = self;
    self.fieldSalaryTo.delegate = self;
    self.fieldSalaryType.delegate = self;
    self.fieldMainSkills.delegate = self;
    self.fieldMainSkills.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    _pickerGender = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propUserDetails.propListGender rowSelectionDelegate:self selectedItem:self.fieldGender.text];
    _pickerBday = [[UIDatePicker alloc] init];
    _pickerBday.datePickerMode = UIDatePickerModeDate;
    _pickerBday.date = [self.propAppDelegate.propDateFormatVelosi dateFromString:self.fieldBirthdate.text];
    _pickerBday.maximumDate = [NSDate date];
    _pickerBday.backgroundColor = [UIColor whiteColor];
    _pickerBday.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _pickerBday.layer.shadowOpacity = 1;
    _pickerBday.layer.shadowOffset = CGSizeMake(0, 0);
    [_pickerBday addTarget:self action:@selector(updateBirthdayField) forControlEvents:UIControlEventValueChanged];
    _pickerYearGraduated = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propUserDetails.propListYearGraduated rowSelectionDelegate:self selectedItem:self.fieldYearGraduated.text];
    _pickerEducation = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propUserDetails.propListEducation rowSelectionDelegate:self selectedItem:self.fieldEducation.text];
    _pickerLicense = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propUserDetails.propListLicense rowSelectionDelegate:self selectedItem:self.fieldLicense.text];
    _pickerNationality = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propUserDetails.propListNationality rowSelectionDelegate:self selectedItem:self.fieldNationality.text];
    _pickerEthnicity = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propUserDetails.propListEthnicity rowSelectionDelegate:self selectedItem:self.fieldEthnicity.text];
    _pickerReferrers = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propListReferrers rowSelectionDelegate:self selectedItem:self.fieldReferrer.text];
    _pickerStatus = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propUserDetails.propListMaritalStatus rowSelectionDelegate:self selectedItem:self.fieldMaritalStatus.text];
    _pickerWillRelocate = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propUserDetails.propListRelocate rowSelectionDelegate:self selectedItem:self.fieldWillRelocate.text];
    _pickerAvailability = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propUserDetails.propListAvailability rowSelectionDelegate:self selectedItem:self.fieldNoticePeriod.text];
    _pickerAvailableFrom = [[UIDatePicker alloc] init];
    _pickerAvailableFrom.datePickerMode = UIDatePickerModeDate;
    if([self.fieldAvailableFrom.text length] > 0)
        _pickerAvailableFrom.date = [self.propAppDelegate.propDateFormatVelosi dateFromString:self.fieldAvailableFrom.text];
    _pickerAvailableFrom.backgroundColor = [UIColor whiteColor];
    _pickerAvailableFrom.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _pickerAvailableFrom.layer.shadowOpacity = 1;
    _pickerAvailableFrom.layer.shadowOffset = CGSizeMake(0, 0);
    [_pickerAvailableFrom addTarget:self action:@selector(updateAvailableFromField) forControlEvents:UIControlEventValueChanged];
    _pickerSalaryType = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propUserDetails.propListSalaryType rowSelectionDelegate:self selectedItem:self.fieldSalaryType.text];
    _pickerCurrency = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propListCurrency.propListCurrencyNames rowSelectionDelegate:self selectedItem:self.fieldCurrency.text];
}

- (void)updateBirthdayField{
    self.fieldBirthdate.text = [self.propAppDelegate.propDateFormatVelosi stringFromDate:_pickerBday.date];
}

- (void)updateAvailableFromField{
    self.fieldAvailableFrom.text = [self.propAppDelegate.propDateFormatVelosi stringFromDate:_pickerAvailableFrom.date];
}

//fix country, referrers and currency
- (IBAction)done:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *result = [self.propAppDelegate.propGatewayOnline saveCandidateDetailsWithUser:[[User alloc] initWithID:[self.propAppDelegate.propGatewayOffline getUserID] fname:_fieldFirstName.text lname:_fieldLastName.text email:_fieldEmail.text altEmail:_fieldEmail.text gender:[self keysFromDictionary:self.propAppDelegate.propUserDetails.propDictGender forValue:_fieldGender.text] phone:_fieldPhone.text altPhone:_fieldAltPhone.text mobile:_fieldMobile.text birthday:_fieldBirthdate.text address:_fieldAddress.text city:_fieldCity.text countryState:_fieldCountryState.text postCode:_fieldPostcode.text country:_cellCountry.detailTextLabel.text linkedIn:_fieldLinkedin.text twitter:_fieldTwitter.text skype:_fieldSkype.text isEUAuthorised:_switchEUAuthorized.isOn university:_fieldUniversity.text subject:_fieldSubject.text yearGraduated:_fieldYearGraduated.text hea:[self keysFromDictionary:self.propAppDelegate.propUserDetails.propDictEducation forValue:_fieldEducation.text] driverLicense:[self keysFromDictionary:self.propAppDelegate.propUserDetails.propDictLicense forValue:_fieldLicense.text] nationality:[self keysFromDictionary:self.propAppDelegate.propUserDetails.propDictNationality forValue:_fieldNationality.text] ethnicity:[self keysFromDictionary:self.propAppDelegate.propUserDetails.propDictEtchnicity forValue:_fieldEthnicity.text] referrer:[self keysFromDictionary:self.propAppDelegate.propDictReferrers forValue:_fieldReferrer.text] maritalStatus:[self keysFromDictionary:self.propAppDelegate.propUserDetails.propDictMaritalStatus forValue:_fieldMaritalStatus.text] isPermanent:_switchIsPermanent.isOn isContract:_switchIsContract.isOn isTemporary:_switchIsTemporary.isOn isPartTime:_switchIsParttime.isOn jobTitlePrefs:_fieldJobTitles.text currency:[self keysFromDictionary:self.propAppDelegate.propListCurrency.propDictCurrencySymbolNames forValue:_fieldCurrency.text] salaryFrom:_fieldSalaryFrom.text salaryTo:_fieldSalaryTo.text salaryType:[self keysFromDictionary:self.propAppDelegate.propUserDetails.propDictSalaryType forValue:_fieldSalaryType.text] mainSkills:_fieldMainSkills.text locationPrefs:_propListLocationPrefs relocationWillingness:[self keysFromDictionary:self.propAppDelegate.propUserDetails.propDictRelocate forValue:_fieldWillRelocate.text] noticePeriod:[self keysFromDictionary:self.propAppDelegate.propUserDetails.propDictAvailability forValue:_fieldNoticePeriod.text] availableFrom:_fieldAvailableFrom.text languages:_propListLanguages allowAlerts:_switchWillAllowAlerts.isOn]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[[UIAlertView alloc] initWithTitle:nil message:(result!=nil)?result:@"Changed Succesfully!" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (NSString *)makeJSONArrayFromArray:(NSArray *)array{
    NSMutableString *str = [[NSMutableString alloc] initWithString:[array objectAtIndex:0]];
    for(int i=1; i<array.count; i++)
        [str appendString:[array objectAtIndex:i]];
    
    return str;
}

- (NSString *)keysFromDictionary:(NSDictionary *)dict forValue:(NSString *)val{
    NSArray *keys = [dict allKeysForObject:val];
    if(keys.count > 0)
        return [keys objectAtIndex:0];
    
    return @"";
}

- (IBAction)showList:(id)sender {
    [self.view endEditing:YES];
    [self.propAppDelegate.propSlider toggleSidebar];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [VelosiDesigner makeVelosiFocusedTextField:textField];
    textField.rightView = nil;
    if(textField == self.fieldGender)
        textField.inputView = _pickerGender;
    else if(textField == self.fieldBirthdate)
        textField.inputView = _pickerBday;
    else if(textField == self.fieldYearGraduated)
        textField.inputView = _pickerYearGraduated;
    else if(textField == self.fieldEducation)
        textField.inputView = _pickerEducation;
    else if(textField == self.fieldLicense)
        textField.inputView = _pickerLicense;
    else if(textField == self.fieldNationality)
        textField.inputView = _pickerNationality;
    else if(textField == self.fieldEthnicity)
        textField.inputView = _pickerEthnicity;
    else if(textField == self.fieldReferrer)
        textField.inputView = _pickerReferrers;
    else if(textField == self.fieldMaritalStatus)
        textField.inputView = _pickerStatus;
    else if(textField == self.fieldWillRelocate)
        textField.inputView = _pickerWillRelocate;
    else if(textField == self.fieldNoticePeriod)
        textField.inputView = _pickerAvailability;
    else if(textField == self.fieldAvailableFrom)
        textField.inputView = _pickerAvailableFrom;
    else if(textField == self.fieldSalaryType)
        textField.inputView = _pickerSalaryType;
    else if(textField == self.fieldCurrency)
        textField.inputView = _pickerCurrency;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [VelosiDesigner makeVelosiTextField:textField];
    [self manageTextField:textField withValue:textField.text];
}

- (void)pickerSelection:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(pickerView == _pickerGender)
        self.fieldGender.text = [self.propAppDelegate.propUserDetails.propListGender objectAtIndex:row];
    else if(pickerView == _pickerYearGraduated)
        self.fieldYearGraduated.text = [self.propAppDelegate.propUserDetails.propListYearGraduated objectAtIndex:row];
    else if(pickerView == _pickerEducation)
        self.fieldEducation.text = [self.propAppDelegate.propUserDetails.propListEducation objectAtIndex:row];
    else if(pickerView == _pickerLicense)
        self.fieldEducation.text = [self.propAppDelegate.propUserDetails.propListLicense objectAtIndex:row];
    else if(pickerView == _pickerNationality)
        self.fieldNationality.text = [self.propAppDelegate.propUserDetails.propListNationality objectAtIndex:row];
    else if(pickerView == _pickerEthnicity)
        self.fieldEthnicity.text = [self.propAppDelegate.propUserDetails.propListEthnicity objectAtIndex:row];
    else if(pickerView == _pickerReferrers)
        self.fieldReferrer.text = [self.propAppDelegate.propListReferrers objectAtIndex:row];
    else if(pickerView == _pickerStatus)
        self.fieldMaritalStatus.text = [self.propAppDelegate.propUserDetails.propListMaritalStatus objectAtIndex:row];
    else if(pickerView == _pickerWillRelocate)
        self.fieldWillRelocate.text = [self.propAppDelegate.propUserDetails.propListRelocate objectAtIndex:row];
    else if(pickerView == _pickerAvailability)
        self.fieldNoticePeriod.text = [self.propAppDelegate.propUserDetails.propListAvailability objectAtIndex:row];
    else if(pickerView == _pickerSalaryType)
        self.fieldSalaryType.text = [self.propAppDelegate.propUserDetails.propListSalaryType objectAtIndex:row];
    else if(pickerView == _pickerCurrency)
        self.fieldCurrency.text = [self.propAppDelegate.propListCurrency.propListCurrencySymbols objectAtIndex:row];
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    textView.textColor = [UIColor blackColor];
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    textView.textColor = [UIColor lightGrayColor];
}

- (void)manageTextField:(UITextField *)textField withValue:(NSString *)val{
    if(!val || [val isEqualToString:@""]){
        textField.rightViewMode = UITextFieldViewModeAlways;
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 16, 18)];
        img.image = [UIImage imageNamed:@"icon_warning"];
        textField.rightView = img;
    }
    
    textField.text = val;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueDetailToCountrySelection"]){
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender withObject:nil];
    } else if([segue.identifier isEqualToString:@"segueLocationPreferences"]){
        ((VCCountrySelection *)segue.destinationViewController).selectedFields = self.propListLocationPrefs;
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender withObject:nil];
    }
    
    if([segue.destinationViewController isKindOfClass:[VCLanguages class]]){
        ((VCLanguages *)segue.destinationViewController).propListLanguages = self.propListLanguages;
        [(VCLanguages *)segue.destinationViewController cellSelectorSelectedCell:sender withObject:nil];
    }
}

@end
