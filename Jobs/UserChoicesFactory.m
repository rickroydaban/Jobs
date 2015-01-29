//
//  UserDetails.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/13/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//
#define USER_SALARYTYPE_NOTSELECTED @""
#define USER_SALARYTYPE_ANNUALLY @"Annually"
#define USER_SALARYTYPE_MONTHLY @"Monthly"
#define USER_SALARYTYPE_WEEKLY @"Weekly"
#define USER_SALARYTYPE_DAILY @"Daily"
#define USER_SALARYTYPE_HOURLY @"Hourly"

#define USER_AVAIL_NOTSELECTED @""
#define USER_AVAIL_1W @"1 Week Notice"
#define USER_AVAIL_2W @"2 Weeks Notice"
#define USER_AVAIL_3W @"3 Weeks Notice"
#define USER_AVAIL_4W @"4 Weeks Notice"
#define USER_AVAIL_1M @"1 Month Notice"
#define USER_AVAIL_2M @"2 Months Notice"
#define USER_AVAIL_3MPLUS @"3+ Months Notice"
#define USER_AVAIL_NOW @"Available Now"

#define USER_EDUC_NONE @""
#define USER_EDUC_NOFORMAL @"No Formal Qualifications"
#define USER_EDUC_ALEVEL @"School Qualification"
#define USER_EDUC_VOCATIONAL @"Vocational"
#define USER_EDUC_APPRENTICE @"Apprenticship"
#define USER_EDUC_TRADE @"Trade Certification"
#define USER_EDUC_COLLEGE @"College Diploma/Certificate"
#define USER_EDUC_HIGHERCERT @"Higher National Certificate"
#define USER_EDUC_HIGHERDIPL @"Higher National Diploma"
#define USER_EDUC_PASSBACHELORS @"Pass Bachelors"
#define USER_EDUC_CLASS3BACHELORS @"3rd Class Bachelors"
#define USER_EDUC_CLASS2LBACHERLORS @"Lower 2nd Class Bachelors"
#define USER_EDUC_CLASS2UBACHELORS @"Upper 2nd Class Bachelors"
#define USER_EDUC_CLASS1BACHELORS @"1st Class Bachelors"
#define USER_EDUC_DEGREEH @"Highest Degree"
#define USER_EDUC_DEGREEM @"Masters Degree"
#define USER_EDUC_PROFESSIONAL @"Professional/Chartered"
#define USER_EDUC_MBA @"MBA"
#define USER_EDUC_DOCTORATE @"Doctorate/PhD"

#define USER_GENDER_U @"Unknown"
#define USER_GENDER_M @"Male"
#define USER_GENDER_F @"Female"

#define USER_MS_UNKNOWN @"Unknown"
#define USER_MS_SINGLE @"Single "
#define USER_MS_MARRIED @"Married"
#define USER_MS_DIVORCED @"Divorced"
#define USER_MS_WIDOWED @"Widowed"
#define USER_MS_COHABITING @"Cohabiting"
#define USER_MS_CIVILUNION @"Civil Union"
#define USER_MS_PARTNERSHIP @"Domestic Partnership"

#define USER_NAT_NONE @""
#define USER_NAT_ALGERIAN @"Algerian" 
#define USER_NAT_AMERICAN @"American"
#define USER_NAT_ANGOLIAN @"Angolian"
#define USER_NAT_ARABIC @"Arabic"
#define USER_NAT_ARGENTINIAN @"Argentinean" 
#define USER_NAT_AUSTRALIAN @"Australian"
#define USER_NAT_BELGIAN @"Belgian"
#define USER_NAT_BOSNIAN @"Bosnian"
#define USER_NAT_BRITISH @"British"
#define USER_NAT_BULGARIAN @"Bulgarian"
#define USER_NAT_CANADIAN @"Canadian"
#define USER_NAT_CHILEAN @"Chilean"
#define USER_NAT_CHINESE @"Chinese"
#define USER_NAT_COLUMBIAN @"Columbian"
#define USER_NAT_CROATIAN @"Croatian"
#define USER_NAT_DANISH @"Danish"
#define USER_NAT_DUTCH @"Dutch"
#define USER_NAT_EGYPTIAN @"Egyptian"
#define USER_NAT_FILIPINO @"Filipino"
#define USER_NAT_FRENCH @"French"
#define USER_NAT_GERMAN @"German"
#define USER_NAT_GHANADIAN @"Ghanadian"
#define USER_NAT_GREEK @"Greek"
#define USER_NAT_INDIAN @"Indian"
#define USER_NAT_INDONESIAN @"Indonesian"
#define USER_NAT_IRANIAN @"Iranian"
#define USER_NAT_IRISH @"Irish"
#define USER_NAT_ITALIAN @"Italian"
#define USER_NAT_KAZAKH @"Kazakh"
#define USER_NAT_KOREAN @"Korean"
#define USER_NAT_KUWAITI @"Kuwaiti"
#define USER_NAT_KYRGYZSTANI @"Kyrgyzstani"
#define USER_NAT_LITHUANIAN @"Lithuanian"
#define USER_NAT_MALAYSIAN @"Malaysian"
#define USER_NAT_MAURITIAN @"Mauritian"
#define USER_NAT_MEXICAN @"Mexican"
#define USER_NAT_MONGOLIAN @"Mongolian"
#define USER_NAT_NEWZEALAND @"New Zealand"
#define USER_NAT_NIGERIAN @"Nigerian"
#define USER_NAT_NORWEGIAN @"Norwegian"
#define USER_NAT_OTHER @"Other"
#define USER_NAT_PAKISTANI @"Pakistani"
#define USER_NAT_PAPUANEWGUINEAN @"Papua New Guinean"
#define USER_NAT_PERUVIAN @"Peruvian"
#define USER_NAT_POLISH @"Polish"
#define USER_NAT_PORTUGUESE @"Portuguese"
#define USER_NAT_ROMANIAN @"Romanian"
#define USER_NAT_RUSSIAN @"Russian"
#define USER_NAT_SAUDIARABIAN @"Saudi Arabian"
#define USER_NAT_SCOTTISH @"Scottish"
#define USER_NAT_SERBIAN @"Serbian"
#define USER_NAT_SOUTHAFRICAN @"South African"
#define USER_NAT_SOUTHAMERICAN @"South American"
#define USER_NAT_SPANISH @"Spanish"
#define USER_NAT_SRILANKAN @"Sri Lankan"
#define USER_NAT_SWEDISH @"Swedish"
#define USER_NAT_SWISS @"Swiss"
#define USER_NAT_SYRIAN @"Syrian"
#define USER_NAT_THAI @"Thai"
#define USER_NAT_TURKISH @"Turkish"
#define USER_NAT_VENEZUELAN @"Venezuelan"
#define USER_NAT_WELSH @"Welsh"

#define USER_NO @"No"
#define USER_YES @"Yes"
#define USER_UNKNOWN @"Unknown"
#define USER_MAYBE @"Maybe"

#define USER_ETH_NONE @""
#define USER_ETH_WHITEENGLISH @"White English"
#define USER_ETH_WHITEIRISH @"White Irish"
#define USER_ETH_ANYOTHERWHITEBG @"Any Other White Background"
#define USER_ETH_WHITEANDBLACKCARIBBEAN @"White and Black Caribbean"
#define USER_ETH_WHITEANDBLACKAFRICAN @"White and Black African"
#define USER_ETH_WHITEANDASIAN @"White and Asian"
#define USER_ETH_ANYOTHERMIXEDBG @"Any Other Mixed Background"
#define USER_ETH_INDIAN @"Indian"
#define USER_ETH_PAKISTANI @"Pakistani"
#define USER_ETH_AFRICAN @"African"
#define USER_ETH_ANYOTHERBLACKBG @"Any Other Black Background"
#define USER_ETH_CHINESE @"Chinese"
#define USER_ETH_ANYOTHERETHNIC @"Any Other Ethnic Group"

#define USER_LANG_AFRIKAANS @"Afrikaans"
#define USER_LANG_ALGERIAN @"Algerian"
#define USER_LANG_ARABIC @"Arabic"
#define USER_LANG_AWADHI @"Awadhi"
#define USER_LANG_AZERBAIJANI @"Azerbaijani"
#define USER_LANG_BENGALI @"Bengali"
#define USER_LANG_BHOJPURI @"Bhojpuri"
#define USER_LANG_BOSNIAN @"Bosnian"
#define USER_LANG_BURMESE @"Burmese"
#define USER_LANG_CHILEAN @"Chilean"
#define USER_LANG_CHINESE @"Chinese"
#define USER_LANG_CROATIAN @"Croatian"
#define USER_LANG_DANISH @"Danish"
#define USER_LANG_DUTCH @"Dutch"
#define USER_LANG_ENGLISH @"English"
#define USER_LANG_FILIPINO @"Filipino"
#define USER_LANG_FRENCH @"French"
#define USER_LANG_GERMAN @"German"
#define USER_LANG_GREEK @"Greek"
#define USER_LANG_GUJARATI @"Gujarati"
#define USER_LANG_HAUSA @"Hausa"
#define USER_LANG_HINDI @"Hindi"
#define USER_LANG_INDONESIANBAHASA @"Indonesian Bahasa"
#define USER_LANG_ITALIAN @"Italian"
#define USER_LANG_JAPANESE @"Japanese"
#define USER_LANG_JAVANESE @"Javanese"
#define USER_LANG_KANNADA @"Kannada"
#define USER_LANG_KAZAKH @"Kazakh"
#define USER_LANG_KOREAN @"Korean"
#define USER_LANG_MAITHILI @"Maithili"
#define USER_LANG_MALAYALAM @"Malayalam"
#define USER_LANG_MALAYSIANBAHASA @"Malaysian Bahasa"
#define USER_LANG_MARATHI @"Marathi"
#define USER_LANG_MONGOLIAN @"Mongolian"
#define USER_LANG_ORIYA @"Oriya"
#define USER_LANG_PANJABI @"Panjabi"
#define USER_LANG_PAPUANLANGUAGES @"Papuan Languages"
#define USER_LANG_PERSIAN @"Persian"
#define USER_LANG_POLISH @"Polish"
#define USER_LANG_PORTUGUESE @"Portuguese"
#define USER_LANG_ROMANIAN @"Romanian"
#define USER_LANG_RUSSIAN @"Russian"
#define USER_LANG_SERBIAN @"Serbian"
#define USER_LANG_SINDHI @"Sindhi"
#define USER_LANG_SPANISH @"Spanishh"
#define USER_LANG_SUNDA @"Sunda"
#define USER_LANG_TAMIL @"Tamil"
#define USER_LANG_TELUGU @"Telugu"
#define USER_LANG_THAI @"Thai"
#define USER_LANG_TOKPISIN @"Tik Pisin"
#define USER_LANG_TURKISH @"Turkish"
#define USER_LANG_UKRAINIAN @"Ukrainian"
#define USER_LANG_URDU @"Urdu"
#define USER_LANG_VIETNAMESE @"Vietnamese"
#define USER_LANG_YORUBA @"Yoruba"

#import "UserChoicesFactory.h"

@implementation UserChoicesFactory

- (instancetype)init
{
    self = [super init];
    if (self) {
        _propListSalaryType = @[USER_SALARYTYPE_NOTSELECTED, USER_SALARYTYPE_ANNUALLY, USER_SALARYTYPE_MONTHLY, USER_SALARYTYPE_WEEKLY, USER_SALARYTYPE_DAILY, USER_SALARYTYPE_HOURLY];
        _propDictSalaryType = @{ USER_SALARYTYPE_NOTSELECTED : @0,
                                 USER_SALARYTYPE_ANNUALLY : @1,
                                 USER_SALARYTYPE_DAILY : @2,
                                 USER_SALARYTYPE_HOURLY: @3,
                                 USER_SALARYTYPE_WEEKLY: @4,
                                 USER_SALARYTYPE_MONTHLY: @5 };
        
        _propListAvailability = @[USER_AVAIL_NOTSELECTED, USER_AVAIL_NOW, USER_AVAIL_1W, USER_AVAIL_2W, USER_AVAIL_3W, USER_AVAIL_4W, USER_AVAIL_1M, USER_AVAIL_2M, USER_AVAIL_3MPLUS];
        _propDictAvailability = @{ USER_AVAIL_NOTSELECTED : @0,
                                   USER_AVAIL_1W : @1,
                                   USER_AVAIL_2W : @2,
                                   USER_AVAIL_3W : @3,
                                   USER_AVAIL_4W : @4,
                                   USER_AVAIL_1M : @11,
                                   USER_AVAIL_2M : @12,
                                   USER_AVAIL_3MPLUS : @13,
                                   USER_AVAIL_NOW : @99 };
        
        _propListEducation = @[USER_EDUC_NONE, USER_EDUC_NOFORMAL, USER_EDUC_ALEVEL, USER_EDUC_VOCATIONAL, USER_EDUC_APPRENTICE, USER_EDUC_TRADE, USER_EDUC_COLLEGE, USER_EDUC_HIGHERCERT, USER_EDUC_HIGHERDIPL, USER_EDUC_PASSBACHELORS, USER_EDUC_CLASS3BACHELORS, USER_EDUC_CLASS2LBACHERLORS, USER_EDUC_CLASS2UBACHELORS, USER_EDUC_CLASS1BACHELORS, USER_EDUC_DEGREEH, USER_EDUC_DEGREEM, USER_EDUC_PROFESSIONAL, USER_EDUC_MBA, USER_EDUC_DOCTORATE];
        _propDictEducation = @{ USER_EDUC_NONE : @0,
                                USER_EDUC_NOFORMAL : @1,
                                USER_EDUC_ALEVEL : @2,
                                USER_EDUC_VOCATIONAL : @3,
                                USER_EDUC_APPRENTICE : @4,
                                USER_EDUC_TRADE : @5,
                                USER_EDUC_COLLEGE : @6,
                                USER_EDUC_HIGHERCERT : @7,
                                USER_EDUC_HIGHERDIPL : @8,
                                USER_EDUC_PASSBACHELORS : @9,
                                USER_EDUC_CLASS3BACHELORS : @10,
                                USER_EDUC_CLASS2LBACHERLORS : @11,
                                USER_EDUC_CLASS2UBACHELORS : @12,
                                USER_EDUC_CLASS1BACHELORS : @13,
                                USER_EDUC_DEGREEH : @14,
                                USER_EDUC_DEGREEM : @15,
                                USER_EDUC_PROFESSIONAL : @16,
                                USER_EDUC_MBA : @17,
                                USER_EDUC_DOCTORATE : @18 };
        
        _propListGender = @[USER_GENDER_U, USER_GENDER_M, USER_GENDER_F];
        _propDictGender = @{ USER_GENDER_U : @9,
                             USER_GENDER_M : @1,
                             USER_GENDER_F : @2 };
        
        _propListMaritalStatus = @[USER_MS_UNKNOWN, USER_MS_SINGLE, USER_MS_MARRIED, USER_MS_DIVORCED, USER_MS_WIDOWED, USER_MS_COHABITING, USER_MS_CIVILUNION, USER_MS_PARTNERSHIP];
        _propDictMaritalStatus = @{ USER_MS_UNKNOWN : @0,
                                    USER_MS_SINGLE : @1,
                                    USER_MS_MARRIED : @2,
                                    USER_MS_DIVORCED : @3,
                                    USER_MS_WIDOWED : @4,
                                    USER_MS_COHABITING : @5,
                                    USER_MS_CIVILUNION : @6,
                                    USER_MS_PARTNERSHIP : @7 };
        
        NSMutableArray *mutableList = [NSMutableArray arrayWithObject:@"1940"];
        NSDateFormatter *yearFormatter = [[NSDateFormatter alloc] init];
        yearFormatter.dateFormat = @"yyyy";
        
        for(int i=1940; i<=[[yearFormatter stringFromDate:[NSDate date]] intValue]; i++)
            [mutableList addObject:[NSString stringWithFormat:@"%d",i]];
        
        _propListYearGraduated = [NSArray arrayWithArray:mutableList];
        
        _propListNationality = @[USER_NAT_NONE, USER_NAT_ALGERIAN, USER_NAT_AMERICAN, USER_NAT_ANGOLIAN, USER_NAT_ARABIC, USER_NAT_ARGENTINIAN, USER_NAT_AUSTRALIAN, USER_NAT_BELGIAN, USER_NAT_BOSNIAN, USER_NAT_BRITISH, USER_NAT_BULGARIAN, USER_NAT_CANADIAN, USER_NAT_CHILEAN, USER_NAT_CHINESE, USER_NAT_COLUMBIAN, USER_NAT_CROATIAN, USER_NAT_DANISH, USER_NAT_DUTCH, USER_NAT_EGYPTIAN, USER_NAT_FILIPINO, USER_NAT_FRENCH, USER_NAT_GERMAN, USER_NAT_GHANADIAN, USER_NAT_GREEK, USER_NAT_INDIAN, USER_NAT_INDONESIAN, USER_NAT_IRANIAN, USER_NAT_IRISH, USER_NAT_ITALIAN, USER_NAT_KAZAKH, USER_NAT_KOREAN, USER_NAT_KUWAITI, USER_NAT_KYRGYZSTANI, USER_NAT_LITHUANIAN, USER_NAT_MALAYSIAN, USER_NAT_MAURITIAN, USER_NAT_MEXICAN, USER_NAT_MONGOLIAN, USER_NAT_NEWZEALAND, USER_NAT_NIGERIAN, USER_NAT_NORWEGIAN, USER_NAT_OTHER, USER_NAT_PAKISTANI, USER_NAT_PAPUANEWGUINEAN, USER_NAT_PERUVIAN, USER_NAT_POLISH, USER_NAT_PORTUGUESE, USER_NAT_ROMANIAN, USER_NAT_RUSSIAN, USER_NAT_SAUDIARABIAN, USER_NAT_SCOTTISH, USER_NAT_SERBIAN, USER_NAT_SOUTHAFRICAN, USER_NAT_SOUTHAMERICAN, USER_NAT_SPANISH, USER_NAT_SRILANKAN, USER_NAT_SWEDISH, USER_NAT_SWISS, USER_NAT_SYRIAN, USER_NAT_THAI, USER_NAT_TURKISH, USER_NAT_VENEZUELAN, USER_NAT_WELSH];
        _propDictNationality = @{USER_NAT_NONE : @0,
                                 USER_NAT_ALGERIAN : @3,
                                 USER_NAT_AMERICAN : @4,
                                 USER_NAT_ANGOLIAN : @54,
                                 USER_NAT_ARABIC : @27,
                                 USER_NAT_ARGENTINIAN : @28,
                                 USER_NAT_AUSTRALIAN : @5,
                                 USER_NAT_BELGIAN : @6,
                                 USER_NAT_BOSNIAN : @58,
                                 USER_NAT_BRITISH : @7,
                                 USER_NAT_BULGARIAN : @43,
                                 USER_NAT_CANADIAN : @8,
                                 USER_NAT_CHILEAN : @56,
                                 USER_NAT_CHINESE : @9,
                                 USER_NAT_COLUMBIAN : @29,
                                 USER_NAT_CROATIAN : @54,
                                 USER_NAT_DANISH : @55,
                                 USER_NAT_DUTCH : @10,
                                 USER_NAT_EGYPTIAN : @11,
                                 USER_NAT_FILIPINO : @40,
                                 USER_NAT_FRENCH : @12,
                                 USER_NAT_GERMAN : @13,
                                 USER_NAT_GHANADIAN : @49,
                                 USER_NAT_GREEK : @14,
                                 USER_NAT_INDIAN : @15,
                                 USER_NAT_INDONESIAN : @50,
                                 USER_NAT_IRANIAN : @30,
                                 USER_NAT_IRISH : @16,
                                 USER_NAT_ITALIAN : @17,
                                 USER_NAT_KAZAKH : @60,
                                 USER_NAT_KOREAN : @64,
                                 USER_NAT_KUWAITI : @31,
                                 USER_NAT_KYRGYZSTANI : @63,
                                 USER_NAT_LITHUANIAN : @18,
                                 USER_NAT_MALAYSIAN : @32,
                                 USER_NAT_MAURITIAN : @39,
                                 USER_NAT_MEXICAN : @41,
                                 USER_NAT_MONGOLIAN : @61,
                                 USER_NAT_NEWZEALAND : @37,
                                 USER_NAT_NIGERIAN : @44,
                                 USER_NAT_NORWEGIAN : @19,
                                 USER_NAT_OTHER : @99,
                                 USER_NAT_PAKISTANI : @33,
                                 USER_NAT_PAPUANEWGUINEAN : @62,
                                 USER_NAT_PERUVIAN : @34,
                                 USER_NAT_POLISH : @20,
                                 USER_NAT_PORTUGUESE : @47,
                                 USER_NAT_ROMANIAN : @21,
                                 USER_NAT_RUSSIAN : @46,
                                 USER_NAT_SAUDIARABIAN : @52,
                                 USER_NAT_SCOTTISH : @22,
                                 USER_NAT_SERBIAN : @59,
                                 USER_NAT_SOUTHAFRICAN : @23,
                                 USER_NAT_SOUTHAMERICAN : @35,
                                 USER_NAT_SPANISH : @24,
                                 USER_NAT_SRILANKAN : @38,
                                 USER_NAT_SWEDISH : @36,
                                 USER_NAT_SWISS : @25,
                                 USER_NAT_SYRIAN : @48,
                                 USER_NAT_THAI : @45,
                                 USER_NAT_TURKISH : @51,
                                 USER_NAT_VENEZUELAN : @42,
                                 USER_NAT_WELSH : @26 };
        
        _propListLicense = @[USER_NO, USER_YES, USER_UNKNOWN];
        _propDictLicense = @{ USER_NO : @0,
                              USER_YES : @1,
                              USER_UNKNOWN : @9 };
        
        _propListRelocate = @[USER_NO, USER_YES, USER_MAYBE, USER_UNKNOWN];
        _propDictRelocate = @{ USER_NO : @0,
                               USER_YES : @1,
                               USER_MAYBE : @2,
                               USER_UNKNOWN : @9 };
        
        _propListEthnicity = @[USER_ETH_NONE, USER_ETH_WHITEENGLISH, USER_ETH_WHITEIRISH, USER_ETH_ANYOTHERWHITEBG, USER_ETH_WHITEANDBLACKCARIBBEAN, USER_ETH_WHITEANDBLACKAFRICAN, USER_ETH_WHITEANDASIAN, USER_ETH_ANYOTHERMIXEDBG, USER_ETH_INDIAN, USER_ETH_PAKISTANI, USER_ETH_AFRICAN, USER_ETH_ANYOTHERBLACKBG, USER_ETH_CHINESE, USER_ETH_ANYOTHERETHNIC];
        _propDictEtchnicity = @{USER_ETH_NONE : @0,
                                USER_ETH_WHITEENGLISH : @1,
                                USER_ETH_WHITEIRISH : @2,
                                USER_ETH_ANYOTHERWHITEBG : @3,
                                USER_ETH_WHITEANDBLACKCARIBBEAN : @4,
                                USER_ETH_WHITEANDBLACKAFRICAN : @5,
                                USER_ETH_WHITEANDASIAN : @6,
                                USER_ETH_ANYOTHERMIXEDBG : @7,
                                USER_ETH_INDIAN : @8,
                                USER_ETH_PAKISTANI : @9,
                                USER_ETH_AFRICAN : @13,
                                USER_ETH_ANYOTHERBLACKBG : @15,
                                USER_ETH_CHINESE : @14,
                                USER_ETH_ANYOTHERETHNIC : @16 };
        
        _propListLanguages = @[USER_LANG_AFRIKAANS, USER_LANG_ALGERIAN, USER_LANG_ARABIC, USER_LANG_AWADHI, USER_LANG_AZERBAIJANI, USER_LANG_BENGALI, USER_LANG_BHOJPURI, USER_LANG_BOSNIAN, USER_LANG_BURMESE, USER_LANG_CHILEAN, USER_LANG_CHINESE, USER_LANG_CROATIAN, USER_LANG_DANISH, USER_LANG_DUTCH, USER_LANG_ENGLISH, USER_LANG_FILIPINO, USER_LANG_FRENCH, USER_LANG_GERMAN, USER_LANG_GREEK, USER_LANG_GUJARATI, USER_LANG_HAUSA, USER_LANG_HINDI, USER_LANG_INDONESIANBAHASA, USER_LANG_ITALIAN, USER_LANG_JAPANESE, USER_LANG_JAVANESE, USER_LANG_KANNADA, USER_LANG_KAZAKH, USER_LANG_KOREAN, USER_LANG_MAITHILI, USER_LANG_MALAYALAM, USER_LANG_MALAYSIANBAHASA, USER_LANG_MARATHI, USER_LANG_MONGOLIAN, USER_LANG_ORIYA, USER_LANG_PANJABI, USER_LANG_PAPUANLANGUAGES, USER_LANG_PERSIAN, USER_LANG_POLISH, USER_LANG_PORTUGUESE, USER_LANG_ROMANIAN, USER_LANG_RUSSIAN, USER_LANG_SERBIAN, USER_LANG_SINDHI, USER_LANG_SPANISH, USER_LANG_SUNDA, USER_LANG_TAMIL, USER_LANG_TELUGU, USER_LANG_THAI, USER_LANG_TOKPISIN, USER_LANG_TURKISH, USER_LANG_UKRAINIAN, USER_LANG_URDU, USER_LANG_VIETNAMESE, USER_LANG_YORUBA];
        
        _propListDocumentTypes = @[@"Unknown", @"Photo", @"References", @"General", @"Form", @"Contract", @"CV", @"Certificate", @"Work Permit", @"Medicals", @"Identification", @"Empoloyment Auth", @"Security Clearance", @"Passport", @"Visa", @"Qoualification", @"Driving License", @"Criminal Convictions", @"Disability Information", @"CV Others"];
        
        _propDictDocumentTypes = @{@"Unknown" : @0,
                                   @"Photo" : @1,
                                   @"References" : @2,
                                   @"General" : @3,
                                   @"Form" : @4,
                                   @"Contract" : @5,
                                   @"CV" : @20,
                                   @"Certificate" : @21,
                                   @"Work Permit" : @26,
                                   @"Medicals" : @27,
                                   @"Identification" : @28,
                                   @"Empoloyment Auth" : @29,
                                   @"Security Clearance" : @30,
                                   @"Passport" : @32,
                                   @"Visa" : @33,
                                   @"Qoualification" : @35,
                                   @"Driving License" : @36,
                                   @"Criminal Convictions" : @40,
                                   @"Disability Information" : @41,
                                   @"CV Others" : @42 };
    }
    
    return self;
}

@end
