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

@interface VCUserDetails(){
    UIPickerView *_pickerGender, *_pickerYearGraduated, *_pickerEducation, *_pickerLicense, *_pickerNationality, *_pickerEthnicity, *_pickerReferrers, *_pickerStatus, *_pickerWillRelocate, *_pickerAvailability, *_pickerSalaryType, *_pickerCurrency;
    UIDatePicker *_pickerBday, *_pickerAvailableFrom;
}
@end

@implementation VCUserDetails

- (void)viewDidLoad{
    [super viewDidLoad];

    self.locationprefs = [NSMutableArray arrayWithArray:[self.appDelegate.offlineGateway getPreferredLocations]];
    self.languages = [NSMutableArray arrayWithArray:[self.appDelegate.offlineGateway getLanguages]];
    
    [self manageTextField:self.fieldFirstName withValue:[self.appDelegate.offlineGateway getFirstName]];
    [self manageTextField:self.fieldLastName withValue:[self.appDelegate.offlineGateway getLastName]];
    [self manageTextField:self.fieldEmail withValue:[self.appDelegate.offlineGateway getEmail]];
    [self manageTextField:self.fieldAltEmail withValue:[self.appDelegate.offlineGateway getAlternateEmail]];
    [self manageTextField:self.fieldGender withValue:[self.appDelegate.offlineGateway getGender]];
    [self manageTextField:self.fieldPhone withValue:[self.appDelegate.offlineGateway getPhone]];
    [self manageTextField:self.fieldAltPhone withValue:[self.appDelegate.offlineGateway getAlternatePhone]];
    [self manageTextField:self.fieldMobile withValue:[self.appDelegate.offlineGateway getMobile]];
    [self manageTextField:self.fieldBirthdate withValue:[self.appDelegate.offlineGateway getBirthdate]];
    
    [self manageTextField:self.fieldAddress withValue:[self.appDelegate.offlineGateway getAddress]];
    [self manageTextField:self.fieldCity withValue:[self.appDelegate.offlineGateway getCity]];
    [self manageTextField:self.fieldCountryState withValue:[self.appDelegate.offlineGateway getCountryState]];
    [self manageTextField:self.fieldPostcode withValue:[self.appDelegate.offlineGateway getPostcode]];
    [self manageTextField:self.fieldLinkedin withValue:[self.appDelegate.offlineGateway getLinkedin]];
    [self manageTextField:self.fieldTwitter withValue:[self.appDelegate.offlineGateway getTwitter]];
    [self manageTextField:self.fieldSkype withValue:[self.appDelegate.offlineGateway getSkype]];
    
    [self manageTextField:self.fieldUniversity withValue:[self.appDelegate.offlineGateway getUniversity]];
    [self manageTextField:self.fieldSubject withValue:[self.appDelegate.offlineGateway getSubject]];
    [self manageTextField:self.fieldYearGraduated withValue:[self.appDelegate.offlineGateway getYearGraduated]];
    [self manageTextField:self.fieldEducation withValue:[self.appDelegate.offlineGateway getEducation]];

    [self manageTextField:self.fieldLicense withValue:[self.appDelegate.offlineGateway getDrivingLicense]];
    [self manageTextField:self.fieldNationality withValue:[self.appDelegate.offlineGateway getNationality]];
    [self manageTextField:self.fieldEthnicity withValue:[self.appDelegate.offlineGateway getEthnicity]];
    [self manageTextField:self.fieldReferrer withValue:[self.appDelegate.offlineGateway getReferrer]];
    [self manageTextField:self.fieldMaritalStatus withValue:[self.appDelegate.offlineGateway getMaritalStatus]];

    [self manageTextField:self.fieldWillRelocate withValue:[self.appDelegate.offlineGateway getWillRelocate]];
    [self manageTextField:self.fieldNoticePeriod withValue:[self.appDelegate.offlineGateway getNoticePeriod]];
    [self manageTextField:self.fieldAvailableFrom withValue:[self.appDelegate.offlineGateway getAvailableFrom]];

    [self manageTextField:self.fieldJobTitles withValue:[self.appDelegate.offlineGateway getPreferredJobTitles]];
    [self manageTextField:self.fieldCurrency withValue:[self.appDelegate.offlineGateway getCurrency]];

    [self manageTextField:self.fieldSalaryFrom withValue:[self.appDelegate.offlineGateway getSalaryFrom]];
    [self manageTextField:self.fieldSalaryTo withValue:[self.appDelegate.offlineGateway getSalaryTo]];
    [self manageTextField:self.fieldSalaryType withValue:[self.appDelegate.offlineGateway getSalaryType]];

    self.cellCountry.detailTextLabel.text = [self.appDelegate.offlineGateway getCountry];
    self.cellPreferredLocation.detailTextLabel.text = [NSString stringWithFormat:@"%d",(int)self.locationprefs.count];
    self.cellLanguages.detailTextLabel.text = [NSString stringWithFormat:@"%d",(int)self.languages.count];

    self.switchEUAuthorized.on = [self.appDelegate.offlineGateway isEUAuthorized];
    self.switchWillAllowAlerts.on = [self.appDelegate.offlineGateway isAlertsAllowed];
    self.switchIsPermanent.on = [self.appDelegate.offlineGateway isPermanent];
    self.switchIsTemporary.on = [self.appDelegate.offlineGateway isTemporary];
    self.switchIsContract.on = [self.appDelegate.offlineGateway isContract];
    self.switchIsParttime.on = [self.appDelegate.offlineGateway isPartTime];
    self.fieldMainSkills.text = [self.appDelegate.offlineGateway getMainSkills];
    
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
    
    _pickerGender = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListGender andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerGender list:self.appDelegate.userDetails.propListGender field:self.fieldGender];
    _pickerBday = [[UIDatePicker alloc] init];
    _pickerBday.datePickerMode = UIDatePickerModeDate;
    _pickerBday.date = [self.appDelegate.velosiDateFormat dateFromString:self.fieldBirthdate.text];
    _pickerBday.maximumDate = [NSDate date];
    _pickerBday.backgroundColor = [UIColor whiteColor];
    _pickerBday.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _pickerBday.layer.shadowOpacity = 1;
    _pickerBday.layer.shadowOffset = CGSizeMake(0, 0);
    [_pickerBday addTarget:self action:@selector(updateBirthdayField) forControlEvents:UIControlEventValueChanged];
    _pickerYearGraduated = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListYearGraduated andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerYearGraduated list:self.appDelegate.userDetails.propListYearGraduated field:self.fieldYearGraduated];
    _pickerEducation = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListEducation andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerEducation list:self.appDelegate.userDetails.propListEducation field:self.fieldEducation];
    _pickerLicense = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListLicense andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerLicense list:self.appDelegate.userDetails.propListLicense field:self.fieldLicense];
    _pickerNationality = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListNationality andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerNationality list:self.appDelegate.userDetails.propListNationality field:self.fieldNationality];
    _pickerEthnicity = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListEthnicity andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerEthnicity list:self.appDelegate.userDetails.propListEthnicity field:self.fieldEthnicity];
    _pickerReferrers = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.referrerList andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerReferrers list:self.appDelegate.referrerList field:self.fieldReferrer];
    _pickerStatus = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListMaritalStatus andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerStatus list:self.appDelegate.userDetails.propListMaritalStatus field:self.fieldMaritalStatus];
    _pickerWillRelocate = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListRelocate andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerWillRelocate list:self.appDelegate.userDetails.propListRelocate field:self.fieldWillRelocate];
    _pickerAvailability = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListAvailability andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerAvailability list:self.appDelegate.userDetails.propListAvailability field:self.fieldNoticePeriod];
    _pickerAvailableFrom = [[UIDatePicker alloc] init];
    _pickerAvailableFrom.datePickerMode = UIDatePickerModeDate;
    if([self.fieldAvailableFrom.text length] > 0)
        _pickerAvailableFrom.date = [self.appDelegate.velosiDateFormat dateFromString:self.fieldAvailableFrom.text];
    _pickerAvailableFrom.backgroundColor = [UIColor whiteColor];
    _pickerAvailableFrom.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _pickerAvailableFrom.layer.shadowOpacity = 1;
    _pickerAvailableFrom.layer.shadowOffset = CGSizeMake(0, 0);
    [_pickerAvailableFrom addTarget:self action:@selector(updateAvailableFromField) forControlEvents:UIControlEventValueChanged];
    _pickerSalaryType = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.userDetails.propListSalaryType andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerSalaryType list:self.appDelegate.userDetails.propListSalaryType field:self.fieldSalaryType];
    _pickerCurrency = [[VelosiCustomPicker alloc] initWithElements:self.appDelegate.currencyList.currencyNameList andRowSelectionDelegate:self hasAll:NO];
    [self selectPicker:_pickerCurrency list:self.appDelegate.currencyList.currencySymbolList field:self.fieldCurrency];
}

- (void)selectPicker:(UIPickerView *)picker list:(NSArray *)list field:(UITextField *)tf{
    if(tf.text && tf.text.length>0 && [list containsObject:tf.text])
        [picker selectRow:[list indexOfObject:tf.text] inComponent:0 animated:NO];
}

- (void)updateBirthdayField{
    self.fieldBirthdate.text = [self.appDelegate.velosiDateFormat stringFromDate:_pickerBday.date];
}

- (void)updateAvailableFromField{
    self.fieldAvailableFrom.text = [self.appDelegate.velosiDateFormat stringFromDate:_pickerAvailableFrom.date];
}

- (IBAction)done:(id)sender {
    NSLog(@"Done");
}

- (IBAction)showList:(id)sender {
    [self.view endEditing:YES];
    [self.appDelegate.slider toggleSidebar];
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
        self.fieldGender.text = [self.appDelegate.userDetails.propListGender objectAtIndex:row];
    else if(pickerView == _pickerYearGraduated)
        self.fieldYearGraduated.text = [self.appDelegate.userDetails.propListYearGraduated objectAtIndex:row];
    else if(pickerView == _pickerEducation)
        self.fieldEducation.text = [self.appDelegate.userDetails.propListEducation objectAtIndex:row];
    else if(pickerView == _pickerLicense)
        self.fieldEducation.text = [self.appDelegate.userDetails.propListLicense objectAtIndex:row];
    else if(pickerView == _pickerNationality)
        self.fieldNationality.text = [self.appDelegate.userDetails.propListNationality objectAtIndex:row];
    else if(pickerView == _pickerEthnicity)
        self.fieldEthnicity.text = [self.appDelegate.userDetails.propListEthnicity objectAtIndex:row];
    else if(pickerView == _pickerReferrers)
        self.fieldReferrer.text = [self.appDelegate.referrerList objectAtIndex:row];
    else if(pickerView == _pickerStatus)
        self.fieldMaritalStatus.text = [self.appDelegate.userDetails.propListMaritalStatus objectAtIndex:row];
    else if(pickerView == _pickerWillRelocate)
        self.fieldWillRelocate.text = [self.appDelegate.userDetails.propListRelocate objectAtIndex:row];
    else if(pickerView == _pickerAvailability)
        self.fieldNoticePeriod.text = [self.appDelegate.userDetails.propListAvailability objectAtIndex:row];
    else if(pickerView == _pickerSalaryType)
        self.fieldSalaryType.text = [self.appDelegate.userDetails.propListSalaryType objectAtIndex:row];
    else if(pickerView == _pickerCurrency)
        self.fieldCurrency.text = [self.appDelegate.currencyList.currencySymbolList objectAtIndex:row];
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
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender];
    } else if([segue.identifier isEqualToString:@"segueLocationPreferences"]){
        ((VCCountrySelection *)segue.destinationViewController).selectedFields = self.locationprefs;
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender];
    }
    
    if([segue.destinationViewController isKindOfClass:[VCLanguages class]]){
        ((VCLanguages *)segue.destinationViewController).languages = self.languages;
        [(VCLanguages *)segue.destinationViewController cellSelectorSelectedCell:sender];
    }
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            NSLog(@"Save");
            break;
            
        case 1:
            NSLog(@"Close Account");
            break;
            
        case 2:
            break;
            
        default:
            break;
    }
}

@end
