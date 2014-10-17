//
//  VCUserDetails.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserDetails.h"
#import "LVUserDetail.h"
#import "VelosiDesigner.h"
#import "DAKeyboardControl.h"
#import "VelosiCustomPicker.h"
#import "User.h"

@interface VCUserDetails(){
    UIPickerView *_pickerGender, *_pickerYearGraduated, *_pickerEducation, *_pickerLicense, *_pickerNationality, *_pickerEthnicity, *_pickerReferrers, *_pickerStatus, *_pickerWillRelocate, *_pickerAvailability, *_pickerSalaryType, *_pickerCurrency;
    UIDatePicker *_pickerBday, *_pickerAvailableFrom;
    LVUserDetail *_vcChild;
}
@end

@implementation VCUserDetails

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _bottomNavigator.layer.shadowColor = [UIColor blackColor].CGColor;
    _bottomNavigator.layer.shadowOpacity = 1;
    _bottomNavigator.layer.shadowOffset = CGSizeMake(0, 0);

    _lvContainer.layer.shadowColor = [UIColor blackColor].CGColor;
    _lvContainer.layer.shadowOpacity = 1;
    _lvContainer.layer.shadowOffset = CGSizeMake(0, 0);

    [self manageTextField:_vcChild.fieldFirstName withValue:[self.appDelegate.offlineGateway getFirstName]];
    [self manageTextField:_vcChild.fieldLastName withValue:[self.appDelegate.offlineGateway getLastName]];
    [self manageTextField:_vcChild.fieldEmail withValue:[self.appDelegate.offlineGateway getEmail]];
    [self manageTextField:_vcChild.fieldAltEmail withValue:[self.appDelegate.offlineGateway getAlternateEmail]];
    [self manageTextField:_vcChild.fieldGender withValue:[self.appDelegate.offlineGateway getGender]];
    [self manageTextField:_vcChild.fieldPhone withValue:[self.appDelegate.offlineGateway getPhone]];
    [self manageTextField:_vcChild.fieldAltPhone withValue:[self.appDelegate.offlineGateway getAlternatePhone]];
    [self manageTextField:_vcChild.fieldMobile withValue:[self.appDelegate.offlineGateway getMobile]];
    [self manageTextField:_vcChild.fieldBirthdate withValue:[self.appDelegate.offlineGateway getBirthdate]];
    
    [self manageTextField:_vcChild.fieldAddress withValue:[self.appDelegate.offlineGateway getAddress]];
    [self manageTextField:_vcChild.fieldCity withValue:[self.appDelegate.offlineGateway getCity]];
    [self manageTextField:_vcChild.fieldCountryState withValue:[self.appDelegate.offlineGateway getCountryState]];
    [self manageTextField:_vcChild.fieldPostcode withValue:[self.appDelegate.offlineGateway getPostcode]];
    [self manageTextField:_vcChild.fieldLinkedin withValue:[self.appDelegate.offlineGateway getLinkedin]];
    [self manageTextField:_vcChild.fieldTwitter withValue:[self.appDelegate.offlineGateway getTwitter]];
    [self manageTextField:_vcChild.fieldSkype withValue:[self.appDelegate.offlineGateway getSkype]];
    
    [self manageTextField:_vcChild.fieldUniversity withValue:[self.appDelegate.offlineGateway getUniversity]];
    [self manageTextField:_vcChild.fieldSubject withValue:[self.appDelegate.offlineGateway getSubject]];
    [self manageTextField:_vcChild.fieldYearGraduated withValue:[self.appDelegate.offlineGateway getYearGraduated]];
    [self manageTextField:_vcChild.fieldEducation withValue:[self.appDelegate.offlineGateway getEducation]];

    [self manageTextField:_vcChild.fieldLicense withValue:[self.appDelegate.offlineGateway getDrivingLicense]];
    [self manageTextField:_vcChild.fieldNationality withValue:[self.appDelegate.offlineGateway getNationality]];
    [self manageTextField:_vcChild.fieldEthnicity withValue:[self.appDelegate.offlineGateway getEthnicity]];
    [self manageTextField:_vcChild.fieldReferrer withValue:[self.appDelegate.offlineGateway getReferrer]];
    [self manageTextField:_vcChild.fieldMaritalStatus withValue:[self.appDelegate.offlineGateway getMaritalStatus]];

    [self manageTextField:_vcChild.fieldWillRelocate withValue:[self.appDelegate.offlineGateway getWillRelocate]];
    [self manageTextField:_vcChild.fieldNoticePeriod withValue:[self.appDelegate.offlineGateway getNoticePeriod]];
    [self manageTextField:_vcChild.fieldAvailableFrom withValue:[self.appDelegate.offlineGateway getAvailableFrom]];

    [self manageTextField:_vcChild.fieldJobTitles withValue:[self.appDelegate.offlineGateway getPreferredJobTitles]];
    [self manageTextField:_vcChild.fieldCurrency withValue:[self.appDelegate.offlineGateway getCurrency]];

    [self manageTextField:_vcChild.fieldSalaryFrom withValue:[self.appDelegate.offlineGateway getSalaryFrom]];
    [self manageTextField:_vcChild.fieldSalaryTo withValue:[self.appDelegate.offlineGateway getSalaryTo]];
    [self manageTextField:_vcChild.fieldSalaryType withValue:[self.appDelegate.offlineGateway getSalaryType]];

    _vcChild.cellCountry.detailTextLabel.text = [self.appDelegate.offlineGateway getCountry];
    _vcChild.switchEUAuthorized.on = [self.appDelegate.offlineGateway isEUAuthorized];
    _vcChild.switchWillAllowAlerts.on = [self.appDelegate.offlineGateway isAlertsAllowed];
    _vcChild.switchIsPermanent.on = [self.appDelegate.offlineGateway isPermanent];
    _vcChild.switchIsTemporary.on = [self.appDelegate.offlineGateway isTemporary];
    _vcChild.switchIsContract.on = [self.appDelegate.offlineGateway isContract];
    _vcChild.switchIsParttime.on = [self.appDelegate.offlineGateway isPartTime];
        _vcChild.fieldMainSkills.text = [self.appDelegate.offlineGateway getMainSkills];
    
    _vcChild.fieldFirstName.delegate = self;
    _vcChild.fieldLastName.delegate = self;
    _vcChild.fieldEmail.delegate = self;
    _vcChild.fieldAltEmail.delegate = self;
    _vcChild.fieldGender.delegate = self;
    _vcChild.fieldPhone.delegate = self;
    _vcChild.fieldAltPhone.delegate = self;
    _vcChild.fieldMobile.delegate = self;
    _vcChild.fieldBirthdate.delegate = self;
    
    _vcChild.fieldAddress.delegate = self;
    _vcChild.fieldCity.delegate = self;
    _vcChild.fieldCountryState.delegate = self;
    _vcChild.fieldPostcode.delegate = self;
    _vcChild.fieldLinkedin.delegate = self;
    _vcChild.fieldTwitter.delegate = self;
    _vcChild.fieldSkype.delegate = self;
    
    _vcChild.fieldUniversity.delegate = self;
    _vcChild.fieldSubject.delegate = self;
    _vcChild.fieldYearGraduated.delegate = self;
    _vcChild.fieldEducation.delegate = self;
    
    _vcChild.fieldLicense.delegate = self;
    _vcChild.fieldNationality.delegate = self;
    _vcChild.fieldEthnicity.delegate = self;
    _vcChild.fieldReferrer.delegate = self;
    _vcChild.fieldMaritalStatus.delegate = self;
    
    _vcChild.fieldWillRelocate.delegate = self;
    _vcChild.fieldNoticePeriod.delegate = self;
    _vcChild.fieldAvailableFrom.delegate = self;
    _vcChild.fieldJobTitles.delegate = self;
    _vcChild.fieldCurrency.delegate = self;
    
    _vcChild.fieldSalaryFrom.delegate = self;
    _vcChild.fieldSalaryTo.delegate = self;
    _vcChild.fieldSalaryType.delegate = self;
    _vcChild.fieldMainSkills.delegate = self;
    _vcChild.fieldMainSkills.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    _pickerGender = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListGender andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerGender list:self.appDelegate.userDetails.propListGender field:_vcChild.fieldGender];
    _pickerBday = [[UIDatePicker alloc] init];
    _pickerBday.datePickerMode = UIDatePickerModeDate;
    _pickerBday.date = [self.appDelegate.velosiDateFormat dateFromString:_vcChild.fieldBirthdate.text];
    _pickerBday.maximumDate = [NSDate date];
    _pickerBday.backgroundColor = [UIColor whiteColor];
    _pickerBday.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _pickerBday.layer.shadowOpacity = 1;
    _pickerBday.layer.shadowOffset = CGSizeMake(0, 0);
    [_pickerBday addTarget:self action:@selector(updateBirthdayField) forControlEvents:UIControlEventValueChanged];
    _pickerYearGraduated = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListYearGraduated andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerYearGraduated list:self.appDelegate.userDetails.propListYearGraduated field:_vcChild.fieldYearGraduated];
    _pickerEducation = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListEducation andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerEducation list:self.appDelegate.userDetails.propListEducation field:_vcChild.fieldEducation];
    _pickerLicense = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListLicense andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerLicense list:self.appDelegate.userDetails.propListLicense field:_vcChild.fieldLicense];
    _pickerNationality = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListNationality andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerNationality list:self.appDelegate.userDetails.propListNationality field:_vcChild.fieldNationality];
    _pickerEthnicity = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListEthnicity andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerEthnicity list:self.appDelegate.userDetails.propListEthnicity field:_vcChild.fieldEthnicity];
    _pickerReferrers = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.referrerList andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerReferrers list:self.appDelegate.referrerList field:_vcChild.fieldReferrer];
    _pickerStatus = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListMaritalStatus andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerStatus list:self.appDelegate.userDetails.propListMaritalStatus field:_vcChild.fieldMaritalStatus];
    _pickerWillRelocate = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListRelocate andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerWillRelocate list:self.appDelegate.userDetails.propListRelocate field:_vcChild.fieldWillRelocate];
    _pickerAvailability = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListAvailability andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerAvailability list:self.appDelegate.userDetails.propListAvailability field:_vcChild.fieldNoticePeriod];
    _pickerAvailableFrom = [[UIDatePicker alloc] init];
    _pickerAvailableFrom.datePickerMode = UIDatePickerModeDate;
    if([_vcChild.fieldAvailableFrom.text length] > 0)
        _pickerAvailableFrom.date = [self.appDelegate.velosiDateFormat dateFromString:_vcChild.fieldAvailableFrom.text];
    _pickerAvailableFrom.backgroundColor = [UIColor whiteColor];
    _pickerAvailableFrom.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _pickerAvailableFrom.layer.shadowOpacity = 1;
    _pickerAvailableFrom.layer.shadowOffset = CGSizeMake(0, 0);
    [_pickerAvailableFrom addTarget:self action:@selector(updateAvailableFromField) forControlEvents:UIControlEventValueChanged];
    _pickerSalaryType = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListSalaryType andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerSalaryType list:self.appDelegate.userDetails.propListSalaryType field:_vcChild.fieldSalaryType];
    _pickerCurrency = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.currencyList.currencyNameList andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerCurrency list:self.appDelegate.currencyList.currencySymbolList field:_vcChild.fieldCurrency];
}

- (void)selectPicker:(UIPickerView *)picker list:(NSArray *)list field:(UITextField *)tf{
    if(tf.text && tf.text.length>0)
        [picker selectRow:[list indexOfObject:tf.text] inComponent:0 animated:NO];
}

- (void)updateBirthdayField{
    _vcChild.fieldBirthdate.text = [self.appDelegate.velosiDateFormat stringFromDate:_pickerBday.date];
}

- (void)updateAvailableFromField{
    _vcChild.fieldAvailableFrom.text = [self.appDelegate.velosiDateFormat stringFromDate:_pickerAvailableFrom.date];
}

- (IBAction)showUserSearchPage:(id)sender{
    [self switchToSearchPage];
}

- (IBAction)showUserDocumentsPage:(id)sender {
    [self switchToDocumentPage];
}

- (IBAction)showUserEmploymentPage:(id)sender {
    [self switchToEmploymentPage];
}

- (IBAction)showUserPasswordPage:(id)sender {
    [self switchToPasswordPage];
}
- (IBAction)showUserApplicationPage:(id)sender {
    [self switchToApplicationsPage];
}

- (IBAction)toggleActions:(id)sender {
    [self toggleActionToolbar];
}

- (IBAction)save:(id)sender {
    NSLog(@"save");
}

- (IBAction)closeAccount:(id)sender {
    NSLog(@"Close account");
}

- (IBAction)logout:(id)sender {
    [self logoutAndShowLogin:sender];
}

- (IBAction)advanceSearch:(id)sender {
    [self switchToAdvanceSearchPage:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //NOTE: this is triggered first before viewdidload
    if([segue.identifier isEqualToString:@"segueEmbedDetail"])
        _vcChild = (LVUserDetail *)segue.destinationViewController;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [VelosiDesigner makeVelosiFocusedTextField:textField];
    
    if(textField == _vcChild.fieldGender)
        textField.inputView = _pickerGender;
    else if(textField == _vcChild.fieldBirthdate)
        textField.inputView = _pickerBday;
    else if(textField == _vcChild.fieldYearGraduated)
        textField.inputView = _pickerYearGraduated;
    else if(textField == _vcChild.fieldEducation)
        textField.inputView = _pickerEducation;
    else if(textField == _vcChild.fieldLicense)
        textField.inputView = _pickerLicense;
    else if(textField == _vcChild.fieldNationality)
        textField.inputView = _pickerNationality;
    else if(textField == _vcChild.fieldEthnicity)
        textField.inputView = _pickerEthnicity;
    else if(textField == _vcChild.fieldReferrer)
        textField.inputView = _pickerReferrers;
    else if(textField == _vcChild.fieldMaritalStatus)
        textField.inputView = _pickerStatus;
    else if(textField == _vcChild.fieldWillRelocate)
        textField.inputView = _pickerWillRelocate;
    else if(textField == _vcChild.fieldNoticePeriod)
        textField.inputView = _pickerAvailability;
    else if(textField == _vcChild.fieldAvailableFrom)
        textField.inputView = _pickerAvailableFrom;
    else if(textField == _vcChild.fieldSalaryType)
        textField.inputView = _pickerSalaryType;
    else if(textField == _vcChild.fieldCurrency)
        textField.inputView = _pickerCurrency;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [VelosiDesigner makeVelosiTextField:textField];
    [self manageTextField:textField withValue:textField.text];
}

- (void)pickerSelection:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(pickerView == _pickerGender)
        _vcChild.fieldGender.text = [self.appDelegate.userDetails.propListGender objectAtIndex:row];
    else if(pickerView == _pickerYearGraduated)
        _vcChild.fieldYearGraduated.text = [self.appDelegate.userDetails.propListYearGraduated objectAtIndex:row];
    else if(pickerView == _pickerEducation)
        _vcChild.fieldEducation.text = [self.appDelegate.userDetails.propListEducation objectAtIndex:row];
    else if(pickerView == _pickerLicense)
        _vcChild.fieldEducation.text = [self.appDelegate.userDetails.propListLicense objectAtIndex:row];
    else if(pickerView == _pickerNationality)
        _vcChild.fieldNationality.text = [self.appDelegate.userDetails.propListNationality objectAtIndex:row];
    else if(pickerView == _pickerEthnicity)
        _vcChild.fieldEthnicity.text = [self.appDelegate.userDetails.propListEthnicity objectAtIndex:row];
    else if(pickerView == _pickerReferrers)
        _vcChild.fieldReferrer.text = [self.appDelegate.referrerList objectAtIndex:row];
    else if(pickerView == _pickerStatus)
        _vcChild.fieldMaritalStatus.text = [self.appDelegate.userDetails.propListMaritalStatus objectAtIndex:row];
    else if(pickerView == _pickerWillRelocate)
        _vcChild.fieldWillRelocate.text = [self.appDelegate.userDetails.propListRelocate objectAtIndex:row];
    else if(pickerView == _pickerAvailability)
        _vcChild.fieldNoticePeriod.text = [self.appDelegate.userDetails.propListAvailability objectAtIndex:row];
    else if(pickerView == _pickerSalaryType)
        _vcChild.fieldSalaryType.text = [self.appDelegate.userDetails.propListSalaryType objectAtIndex:row];
    else if(pickerView == _pickerCurrency)
        _vcChild.fieldCurrency.text = [self.appDelegate.currencyList.currencySymbolList objectAtIndex:row];
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    textView.textColor = [UIColor blackColor];
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    textView.textColor = [UIColor lightGrayColor];
}

- (void)manageTextField:(UITextField *)textField withValue:(NSString *)val{
    if(!val || [val isEqualToString:@""]){
        textField.layer.borderWidth = 1;
        textField.layer.borderColor = [UIColor redColor].CGColor;
    }
    
    textField.text = val;
}
@end
