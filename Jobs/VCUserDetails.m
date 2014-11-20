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
    _user = self.propAppDelegate.propUser;
    
    [self manageTextField:self.fieldFirstName withValue:[_user propFirstName]];
    [self manageTextField:self.fieldLastName withValue:[_user propLastName]];
    [self manageTextField:self.fieldEmail withValue:[_user propEmail]];
    [self manageTextField:self.fieldAltEmail withValue:[_user propAltEmail]];
    [self manageTextField:self.fieldGender withValue:[self.propAppDelegate.propUserDetails.propDictGender objectForKey:[_user propGenderID]]];
    [self manageTextField:self.fieldPhone withValue:[_user propPhone]];
    [self manageTextField:self.fieldAltPhone withValue:[_user propAltPhone]];
    [self manageTextField:self.fieldMobile withValue:[_user propMobile]];
    [self manageTextField:self.fieldBirthdate withValue:[self.propAppDelegate.propGatewayOnline deserializeJsonDateString:[_user propBirthdate]]];
    
    [self manageTextField:self.fieldAddress withValue:[_user propAddress]];
    [self manageTextField:self.fieldCity withValue:[_user propCity]];
    [self manageTextField:self.fieldCountryState withValue:[_user propCountryState]];
    [self manageTextField:self.fieldPostcode withValue:[_user propPostCode]];
    [self manageTextField:self.fieldLinkedin withValue:[_user propLinkedIn]];
    [self manageTextField:self.fieldTwitter withValue:[_user propTwitter]];
    [self manageTextField:self.fieldSkype withValue:[_user propSkype]];
    
    [self manageTextField:self.fieldUniversity withValue:[_user propUniversity]];
    [self manageTextField:self.fieldSubject withValue:[_user propSubject]];
    [self manageTextField:self.fieldYearGraduated withValue:[_user propYearGraduated]];
    [self manageTextField:self.fieldEducation withValue:[self.propAppDelegate.propUserDetails.propDictEducation objectForKey:[_user propEducationID]]];

    [self manageTextField:self.fieldLicense withValue:[self.propAppDelegate.propUserDetails.propDictLicense objectForKey:[_user propDrivingLicenseID]]];
    [self manageTextField:self.fieldNationality withValue:[self.propAppDelegate.propUserDetails.propDictNationality objectForKey:[_user propNationalityID]]];
    [self manageTextField:self.fieldEthnicity withValue:[self.propAppDelegate.propUserDetails.propDictEtchnicity objectForKey:[_user propEthnicityID]]];
    
    [self manageTextField:self.fieldReferrer withValue:[self.propAppDelegate.propDictReferrers objectForKey:[_user propReferrerID]]];
    [self manageTextField:self.fieldMaritalStatus withValue:[self.propAppDelegate.propUserDetails.propDictMaritalStatus objectForKey:[_user propMaritalStatusID]]];

    [self manageTextField:self.fieldWillRelocate withValue:[self.propAppDelegate.propUserDetails.propDictRelocate objectForKey:[_user propWillingToRelocateID]]];
    [self manageTextField:self.fieldNoticePeriod withValue:[self.propAppDelegate.propUserDetails.propDictAvailability objectForKey:[_user propNoticePeriodID]]];
    [self manageTextField:self.fieldAvailableFrom withValue:[self.propAppDelegate.propGatewayOnline deserializeJsonDateString:[_user propAvailableFrom]]];

    [self manageTextField:self.fieldJobTitles withValue:[_user propJobTitles]];
    [self manageTextField:self.fieldCurrency withValue:[_user propCurrency]];

    [self manageTextField:self.fieldSalaryFrom withValue:[_user propSalaryFrom]];
    [self manageTextField:self.fieldSalaryTo withValue:[_user propSalaryTo]];
    [self manageTextField:self.fieldSalaryType withValue:[self.propAppDelegate.propUserDetails.propDictSalaryType objectForKey:[_user propSalaryTypeID]]];

    self.cellCountry.detailTextLabel.text = [self.propAppDelegate.propCountries.propDictCountryIds objectForKey:[_user propCountryID]];
    self.cellPreferredLocation.detailTextLabel.text = [NSString stringWithFormat:@"%d",(int)self.propListLocationPrefs.count];
    self.cellLanguages.detailTextLabel.text = [NSString stringWithFormat:@"%d",(int)self.propListLanguages.count];

    self.switchEUAuthorized.on = [_user propIsEUAuthorized];
    self.switchWillAllowAlerts.on = [_user propIsAlertsAllowed];
    self.switchIsPermanent.on = [_user propIsPermanent];
    self.switchIsTemporary.on = [_user propIsTemporary];
    self.switchIsContract.on = [_user propIsContract];
    self.switchIsParttime.on = [_user propIsPartTime];
    self.fieldMainSkills.text = [_user propMainSkills];
    
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
    _pickerCurrency = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propCurrency.propListCurrencyNames rowSelectionDelegate:self selectedItem:self.fieldCurrency.text];
}

- (void)updateBirthdayField{
    self.fieldBirthdate.text = [self.propAppDelegate.propDateFormatVelosi stringFromDate:_pickerBday.date];
}

- (void)updateAvailableFromField{
    self.fieldAvailableFrom.text = [self.propAppDelegate.propDateFormatVelosi stringFromDate:_pickerAvailableFrom.date];
}

- (IBAction)done:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSNumber *genderID = [NSNumber numberWithInt:[[self.propAppDelegate.propUserDetails.propDictGender allKeysForObject:_fieldGender.text][0] intValue]];
        NSNumber *countryID = [NSNumber numberWithInt:[[self.propAppDelegate.propCountries.propDictCountryIds allKeysForObject:_cellCountry.detailTextLabel.text][0] intValue]];
        NSNumber *educationID = [NSNumber numberWithInt:[[self.propAppDelegate.propUserDetails.propDictEducation allKeysForObject:_fieldEducation.text][0] intValue]];
        NSNumber *licenseID = [NSNumber numberWithInt:[[self.propAppDelegate.propUserDetails.propDictLicense allKeysForObject:_fieldLicense.text][0] intValue]];
        NSNumber *nationalityID = [NSNumber numberWithInt:[[self.propAppDelegate.propUserDetails.propDictNationality allKeysForObject:_fieldNationality.text][0] intValue]];
        NSNumber *ethnicityID = [NSNumber numberWithInt:[[self.propAppDelegate.propUserDetails.propDictEtchnicity allKeysForObject:_fieldEthnicity.text][0] intValue]];
        NSNumber *referrerID = [NSNumber numberWithInt:[[self.propAppDelegate.propDictReferrers allKeysForObject:_fieldReferrer.text][0] intValue]];
        NSNumber *marStatID = [NSNumber numberWithInt:[[self.propAppDelegate.propUserDetails.propDictMaritalStatus allKeysForObject:_fieldMaritalStatus.text][0] intValue]];
        NSNumber *relocateID = [NSNumber numberWithInt:[[self.propAppDelegate.propUserDetails.propDictRelocate allKeysForObject:_fieldWillRelocate.text][0] intValue]];
        NSNumber *notPeriodID = [NSNumber numberWithInt:[[self.propAppDelegate.propUserDetails.propDictAvailability allKeysForObject:_fieldNoticePeriod.text][0] intValue]];
        NSNumber *salTypeID = [NSNumber numberWithInt:[[self.propAppDelegate.propUserDetails.propDictSalaryType allKeysForObject:_fieldSalaryType.text][0] intValue]];
        NSString *result = [self.propAppDelegate.propGatewayOnline saveCandidateDetailsWitJSONContents:[_user jsonFromUserWithFirstName:_fieldFirstName.text lastName:_fieldLastName.text email:_fieldEmail.text altEmail:_fieldAltEmail.text genderID:genderID gender:_fieldGender.text phone:_fieldPhone.text altPhone:_fieldAltPhone.text mobile:_fieldMobile.text bday:_fieldBirthdate.text address:_fieldAddress.text city:_fieldCity.text countryState:_fieldCountryState.text postcode:_fieldPostcode.text countryID:countryID country:_cellCountry.detailTextLabel.text linkedIn:_fieldLinkedin.text twitter:_fieldTwitter.text skype:_fieldSkype.text isEUAuthorized:[NSNumber numberWithBool:_switchEUAuthorized.isOn] university:_fieldUniversity.text subject:_fieldSubject.text yearGraduated:[NSNumber numberWithInt:[_fieldYearGraduated.text intValue]] educationID:educationID education:_fieldEducation.text drivingLicenseID:licenseID drivingLicense:_fieldLicense.text nationalityID:nationalityID nationality:_fieldNationality.text ethnicityID:ethnicityID ethnicity:_fieldEthnicity.text referrerID:referrerID referrer:_fieldReferrer.text maritalStatusID:marStatID maritalStatus:_fieldMaritalStatus.text preferredLocations:[self.propListLocationPrefs componentsJoinedByString:@","] willingToRelocateID:relocateID willingToRelocate:_fieldWillRelocate.text noticePeriodID:notPeriodID noticePeriod:_fieldNoticePeriod.text availableFrom:_fieldAvailableFrom.text languages:[self.propListLanguages componentsJoinedByString:@","] isAlertsAllowed:[NSNumber numberWithBool:_switchWillAllowAlerts.isOn] isPermanent:[NSNumber numberWithBool:_switchIsPermanent.isOn] isTemporary:[NSNumber numberWithBool:_switchIsTemporary.isOn] isContract:[NSNumber numberWithBool:_switchIsContract.isOn] isPartTime:[NSNumber numberWithBool:_switchIsParttime.isOn] jobTitles:_fieldJobTitles.text currencyThree:_fieldCurrency.text salaryFrom:[NSNumber numberWithInt:[_fieldSalaryFrom.text intValue]] salaryTo:[NSNumber numberWithInt:[_fieldSalaryTo.text intValue]] salaryTypeID:salTypeID salaryType:_fieldSalaryType.text mainSkills:_fieldMainSkills.text]];
        
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
        self.fieldCurrency.text = [self.propAppDelegate.propCurrency.propListCurrencySymbols objectAtIndex:row];
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
