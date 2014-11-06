//
//  VCUserDetails.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCUserTables.h"
#import "VelosiPickerRowSelectionDelegate.h"

@interface VCUserDetails : VCUserTables<VelosiPickerRowSelectionDelegate, UITextViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) NSMutableArray *propListLocationPrefs, *propListLanguages;

@property (strong, nonatomic) IBOutlet UITextField *fieldFirstName;
@property (strong, nonatomic) IBOutlet UITextField *fieldLastName;
@property (strong, nonatomic) IBOutlet UITextField *fieldEmail;
@property (strong, nonatomic) IBOutlet UITextField *fieldAltEmail;
@property (strong, nonatomic) IBOutlet UITextField *fieldGender;
@property (strong, nonatomic) IBOutlet UITextField *fieldPhone;
@property (strong, nonatomic) IBOutlet UITextField *fieldAltPhone;
@property (strong, nonatomic) IBOutlet UITextField *fieldMobile;
@property (strong, nonatomic) IBOutlet UITextField *fieldBirthdate;

@property (strong, nonatomic) IBOutlet UITextField *fieldAddress;
@property (strong, nonatomic) IBOutlet UITextField *fieldCity;
@property (strong, nonatomic) IBOutlet UITextField *fieldCountryState;
@property (strong, nonatomic) IBOutlet UITextField *fieldPostcode;
@property (strong, nonatomic) IBOutlet UITableViewCell *cellCountry;
@property (strong, nonatomic) IBOutlet UITextField *fieldLinkedin;
@property (strong, nonatomic) IBOutlet UITextField *fieldTwitter;
@property (strong, nonatomic) IBOutlet UITextField *fieldSkype;
@property (strong, nonatomic) IBOutlet UISwitch *switchEUAuthorized;

@property (strong, nonatomic) IBOutlet UITextField *fieldUniversity;
@property (strong, nonatomic) IBOutlet UITextField *fieldSubject;
@property (strong, nonatomic) IBOutlet UITextField *fieldYearGraduated;
@property (strong, nonatomic) IBOutlet UITextField *fieldEducation;

@property (strong, nonatomic) IBOutlet UITextField *fieldLicense;
@property (strong, nonatomic) IBOutlet UITextField *fieldNationality;
@property (strong, nonatomic) IBOutlet UITextField *fieldEthnicity;
@property (strong, nonatomic) IBOutlet UITextField *fieldReferrer;
@property (strong, nonatomic) IBOutlet UITextField *fieldMaritalStatus;

@property (strong, nonatomic) IBOutlet UITableViewCell *cellPreferredLocation;
@property (strong, nonatomic) IBOutlet UITextField *fieldWillRelocate;
@property (strong, nonatomic) IBOutlet UITextField *fieldNoticePeriod;
@property (strong, nonatomic) IBOutlet UITextField *fieldAvailableFrom;
@property (strong, nonatomic) IBOutlet UITableViewCell *cellLanguages;

@property (strong, nonatomic) IBOutlet UISwitch *switchWillAllowAlerts;
@property (strong, nonatomic) IBOutlet UISwitch *switchIsPermanent;
@property (strong, nonatomic) IBOutlet UISwitch *switchIsTemporary;
@property (strong, nonatomic) IBOutlet UISwitch *switchIsContract;
@property (strong, nonatomic) IBOutlet UISwitch *switchIsParttime;

@property (strong, nonatomic) IBOutlet UITextField *fieldJobTitles;
@property (strong, nonatomic) IBOutlet UITextField *fieldCurrency;
@property (strong, nonatomic) IBOutlet UITextField *fieldSalaryFrom;
@property (strong, nonatomic) IBOutlet UITextField *fieldSalaryTo;
@property (strong, nonatomic) IBOutlet UITextField *fieldSalaryType;

@property (strong, nonatomic) IBOutlet UITextView *fieldMainSkills;

@end
