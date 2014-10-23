//
//  UserDetails.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/13/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//
#define USER_SALARYTYPE_NOTSELECTED @"Not Selected"
#define USER_SALARYTYPE_ANNUALLY @"Annually"
#define USER_SALARYTYPE_MONTHLY @"Monthly"
#define USER_SALARYTYPE_WEEKLY @"Weekly"
#define USER_SALARYTYPE_DAILY @"Daily"
#define USER_SALARYTYPE_HOURLY @"Hourly"

#define USER_AVAIL_NOTSELECTED @"Not Selected"
#define USER_AVAIL_1W @"1 Week Notice"
#define USER_AVAIL_2W @"2 Weeks Notice"
#define USER_AVAIL_3W @"3 Weeks Notice"
#define USER_AVAIL_4W @"4 Weeks Notice"
#define USER_AVAIL_1M @"1 Month Notice"
#define USER_AVAIL_2M @"2 Months Notice"
#define USER_AVAIL_3MPLUS @"3+ Months Notice"
#define USER_AVAIL_NOW @"Available Now"

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

#define USER_MS_SINGLE @"Single "
#define USER_MS_MARRIED @"Married"
#define USER_MS_DIVORCED @"Divorced"
#define USER_MS_WIDOWED @"Widowed"
#define USER_MS_COHABITING @"Cohabiting"
#define USER_MS_CIVILUNION @"Civil Union"
#define USER_MS_PARTNERSHIP @"Domestic Partnership"

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
#import "UserDetails.h"

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

@implementation UserDetails

- (instancetype)init
{
    self = [super init];
    if (self) {
        _propListSalaryType = @[USER_SALARYTYPE_NOTSELECTED, USER_SALARYTYPE_ANNUALLY, USER_SALARYTYPE_MONTHLY, USER_SALARYTYPE_WEEKLY, USER_SALARYTYPE_DAILY, USER_SALARYTYPE_HOURLY];
        _propDictSalaryType = [NSDictionary dictionaryWithObjects:@[USER_SALARYTYPE_NOTSELECTED, USER_SALARYTYPE_ANNUALLY, USER_SALARYTYPE_DAILY, USER_SALARYTYPE_HOURLY,USER_SALARYTYPE_WEEKLY, USER_SALARYTYPE_MONTHLY] forKeys:@[[self s:0], [self s:1], [self s:2], [self s:3], [self s:4], [self s:5]]];
        
        _propListAvailability = @[USER_AVAIL_NOTSELECTED, USER_AVAIL_NOW, USER_AVAIL_1W, USER_AVAIL_2W, USER_AVAIL_3W, USER_AVAIL_4W, USER_AVAIL_1M, USER_AVAIL_2M, USER_AVAIL_3MPLUS];
        _propDictAvailability = [NSDictionary dictionaryWithObjects:@[USER_AVAIL_NOTSELECTED, USER_AVAIL_1W, USER_AVAIL_2W, USER_AVAIL_3W, USER_AVAIL_4W, USER_AVAIL_1M, USER_AVAIL_2M, USER_AVAIL_3MPLUS,USER_AVAIL_NOW] forKeys:@[[self s:0], [self s:1], [self s:2], [self s:3], [self s:4], [self s:11], [self s:12], [self s:13], [self s:99]]];
        
        _propListEducation = @[USER_EDUC_NOFORMAL, USER_EDUC_ALEVEL, USER_EDUC_VOCATIONAL, USER_EDUC_APPRENTICE, USER_EDUC_TRADE, USER_EDUC_COLLEGE, USER_EDUC_HIGHERCERT, USER_EDUC_HIGHERDIPL, USER_EDUC_PASSBACHELORS, USER_EDUC_CLASS3BACHELORS, USER_EDUC_CLASS2LBACHERLORS, USER_EDUC_CLASS2UBACHELORS, USER_EDUC_CLASS1BACHELORS, USER_EDUC_DEGREEH, USER_EDUC_DEGREEM, USER_EDUC_PROFESSIONAL, USER_EDUC_MBA, USER_EDUC_DOCTORATE];
        _propDictEducation = [NSDictionary dictionaryWithObjects:_propListEducation forKeys:@[[self s:1], [self s:2], [self s:3], [self s:4], [self s:5], [self s:6], [self s:7], [self s:8], [self s:9], [self s:10], [self s:11], [self s:12], [self s:13], [self s:14], [self s:15], [self s:16], [self s:17], [self s:18]]];
        
        _propListGender = @[USER_GENDER_U, USER_GENDER_F, USER_GENDER_M];
        _propDictGender = [NSDictionary dictionaryWithObjects:@[USER_GENDER_F, USER_GENDER_M, USER_GENDER_U] forKeys:@[[self s:0], [self s:1], [self s:9]]];
        
        _propListMaritalStatus = @[USER_MS_SINGLE, USER_MS_MARRIED, USER_MS_DIVORCED, USER_MS_WIDOWED, USER_MS_COHABITING, USER_MS_CIVILUNION, USER_MS_PARTNERSHIP];
        _propDictMaritalStatus = [NSDictionary dictionaryWithObjects:_propListMaritalStatus forKeys:@[[self s:1], [self s:2], [self s:3], [self s:4], [self s:5], [self s:6], [self s:7]]];
        
        NSMutableArray *mutableList = [NSMutableArray arrayWithObject:@"1940"];
        NSDateFormatter *yearFormatter = [[NSDateFormatter alloc] init];
        yearFormatter.dateFormat = @"yyyy";
        
        for(int i=1940; i<=[[yearFormatter stringFromDate:[NSDate date]] intValue]; i++)
            [mutableList addObject:[NSString stringWithFormat:@"%d",i]];
        
        _propListYearGraduated = [NSArray arrayWithArray:mutableList];
        
        _propListNationality = @[USER_NAT_ALGERIAN, USER_NAT_AMERICAN, USER_NAT_ANGOLIAN, USER_NAT_ARABIC, USER_NAT_ARGENTINIAN, USER_NAT_AUSTRALIAN, USER_NAT_BELGIAN, USER_NAT_BOSNIAN, USER_NAT_BRITISH, USER_NAT_BULGARIAN, USER_NAT_CANADIAN, USER_NAT_CHILEAN, USER_NAT_CHINESE, USER_NAT_COLUMBIAN, USER_NAT_CROATIAN, USER_NAT_DANISH, USER_NAT_DUTCH, USER_NAT_EGYPTIAN, USER_NAT_FILIPINO, USER_NAT_FRENCH, USER_NAT_GERMAN, USER_NAT_GHANADIAN, USER_NAT_GREEK, USER_NAT_INDIAN, USER_NAT_INDONESIAN, USER_NAT_IRANIAN, USER_NAT_IRISH, USER_NAT_ITALIAN, USER_NAT_KAZAKH, USER_NAT_KOREAN, USER_NAT_KUWAITI, USER_NAT_KYRGYZSTANI, USER_NAT_LITHUANIAN, USER_NAT_MALAYSIAN, USER_NAT_MAURITIAN, USER_NAT_MEXICAN, USER_NAT_MONGOLIAN, USER_NAT_NEWZEALAND, USER_NAT_NIGERIAN, USER_NAT_NORWEGIAN, USER_NAT_OTHER, USER_NAT_PAKISTANI, USER_NAT_PAPUANEWGUINEAN, USER_NAT_PERUVIAN, USER_NAT_POLISH, USER_NAT_PORTUGUESE, USER_NAT_ROMANIAN, USER_NAT_RUSSIAN, USER_NAT_SAUDIARABIAN, USER_NAT_SCOTTISH, USER_NAT_SERBIAN, USER_NAT_SOUTHAFRICAN, USER_NAT_SOUTHAMERICAN, USER_NAT_SPANISH, USER_NAT_SRILANKAN, USER_NAT_SWEDISH, USER_NAT_SWISS, USER_NAT_SYRIAN, USER_NAT_THAI, USER_NAT_TURKISH, USER_NAT_VENEZUELAN, USER_NAT_WELSH];
        _propDictNationality = [NSDictionary dictionaryWithObjects:_propListNationality forKeys:@[[self s:3], [self s:4], [self s:54], [self s:27], [self s:28], [self s:5], [self s:6], [self s:58], [self s:7], [self s:43], [self s:8], [self s:56], [self s:9], [self s:29], [self s:54], [self s:55], [self s:10], [self s:11], [self s:40], [self s:12], [self s:13], [self s:49], [self s:14], [self s:15], [self s:50], [self s:30], [self s:16], [self s:17], [self s:60], [self s:64], [self s:31], [self s:63], [self s:18], [self s:32], [self s:39], [self s:41], [self s:61], [self s:37], [self s:44], [self s:19], [self s:99], [self s:33], [self s:62], [self s:34], [self s:20], [self s:47], [self s:21], [self s:46], [self s:52], [self s:22], [self s:59], [self s:23], [self s:35], [self s:24], [self s:38], [self s:36], [self s:25], [self s:48], [self s:45], [self s:51], [self s:42], [self s:26]]];
        
        _propListLicense = @[USER_NO, USER_YES, USER_UNKNOWN];
        _propDictLicense = [NSDictionary dictionaryWithObjects:_propListLicense forKeys:@[[self s:0],[self s:1],[self s:9]]];
        
        _propListRelocate = @[USER_NO, USER_YES, USER_MAYBE, USER_UNKNOWN];
        _propDictRelocate = [NSDictionary dictionaryWithObjects:_propListRelocate forKeys:@[[self s:0], [self s:1], [self s:2], [self s:9]]];
        
        _propListEthnicity = @[USER_ETH_WHITEENGLISH, USER_ETH_WHITEIRISH, USER_ETH_ANYOTHERWHITEBG, USER_ETH_WHITEANDBLACKCARIBBEAN, USER_ETH_WHITEANDBLACKAFRICAN, USER_ETH_WHITEANDASIAN, USER_ETH_ANYOTHERMIXEDBG, USER_ETH_INDIAN, USER_ETH_PAKISTANI, USER_ETH_AFRICAN, USER_ETH_ANYOTHERBLACKBG, USER_ETH_CHINESE, USER_ETH_ANYOTHERETHNIC];
        _propDictEtchnicity = [NSDictionary dictionaryWithObjects:_propListEthnicity forKeys:@[[self s:1], [self s:2], [self s:3], [self s:4], [self s:5], [self s:6], [self s:7], [self s:8], [self s:9], [self s:13], [self s:15], [self s:14], [self s:16]]];
        
        _propListLanguages = @[USER_LANG_AFRIKAANS, USER_LANG_ALGERIAN, USER_LANG_ARABIC, USER_LANG_AWADHI, USER_LANG_AZERBAIJANI, USER_LANG_BENGALI, USER_LANG_BHOJPURI, USER_LANG_BOSNIAN, USER_LANG_BURMESE, USER_LANG_CHILEAN, USER_LANG_CHINESE, USER_LANG_CROATIAN, USER_LANG_DANISH, USER_LANG_DUTCH, USER_LANG_ENGLISH, USER_LANG_FILIPINO, USER_LANG_FRENCH, USER_LANG_GERMAN, USER_LANG_GREEK, USER_LANG_GUJARATI, USER_LANG_HAUSA, USER_LANG_HINDI, USER_LANG_INDONESIANBAHASA, USER_LANG_ITALIAN, USER_LANG_JAPANESE, USER_LANG_JAVANESE, USER_LANG_KANNADA, USER_LANG_KAZAKH, USER_LANG_KOREAN, USER_LANG_MAITHILI, USER_LANG_MALAYALAM, USER_LANG_MALAYSIANBAHASA, USER_LANG_MARATHI, USER_LANG_MONGOLIAN, USER_LANG_ORIYA, USER_LANG_PANJABI, USER_LANG_PAPUANLANGUAGES, USER_LANG_PERSIAN, USER_LANG_POLISH, USER_LANG_PORTUGUESE, USER_LANG_ROMANIAN, USER_LANG_RUSSIAN, USER_LANG_SERBIAN, USER_LANG_SINDHI, USER_LANG_SPANISH, USER_LANG_SUNDA, USER_LANG_TAMIL, USER_LANG_TELUGU, USER_LANG_THAI, USER_LANG_TOKPISIN, USER_LANG_TURKISH, USER_LANG_UKRAINIAN, USER_LANG_URDU, USER_LANG_VIETNAMESE, USER_LANG_YORUBA];
    }
    return self;
}

- (NSString *)s:(int)i{
    return [NSString stringWithFormat:@"%d",i];
}

@end
