//
//  Application.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "Application.h"
#import "Job.h"
#import "User.h"

@interface Application(){
    NSMutableDictionary *_dictionary;
}
@end

@implementation Application

- (id)initWithDictionary:(NSDictionary *)d{
    self = [super init];
    
    if(self){
        _dictionary = [d mutableCopy];
    }
    
    return self;
}

- (NSString *)getJobApplicationID{
    return [_dictionary objectForKey:@"ApplicationID"];
}

- (NSString *)getVacancyTitle{
    return [_dictionary objectForKey:@"VacancyTitle"];
}

- (NSString *)getVacancyID{
    return [_dictionary objectForKey:@"VacancyID"];
}

- (NSString *)getVacancyRef{
    return [_dictionary objectForKey:@"VacancyRef"];
}

- (NSString *)getAppStatus{
    return [_dictionary objectForKey:@"AppStatus"];
}

- (NSString *)getStatusName{
    return [[_dictionary objectForKey:@"AppStatus"] objectForKey:@"StatusName"];
}

- (NSString *)getDateCreated{
    return [((AppDelegate *)[[UIApplication sharedApplication] delegate]).propGatewayOnline deserializeJsonDateString:[_dictionary objectForKey:@"DateCreated"]];
}

+ (NSString *)jsonFromNewApplicationForJob:(Job *)job fromThisUser:(User *)user coverLetter:(NSString *)coverLetter dateFormatter:(NSDateFormatter *)dateFormatter{
    NSString *defaultDate = @"\/Date(-2179180800000+0000)\/";
    NSMutableDictionary *jobApplicationDict = [NSMutableDictionary dictionary];
    
    [jobApplicationDict setValue:[job getDateTo] forKey:@"ActualFinishDate"];
    [jobApplicationDict setValue:[job getDateFrom] forKey:@"ActualStartDate"];
    [jobApplicationDict setValue:@{@"Status":@2, @"StatusID":@2, @"StatusName":@"Applied Online"} forKey:@"AppStatus"];
    [jobApplicationDict setValue:@0 forKey:@"AppStatusID"];
    [jobApplicationDict setValue:@0 forKey:@"ApplicationID"];
    [jobApplicationDict setValue:[NSString stringWithFormat:@"\/Date(%@-0100)\/",[dateFormatter stringFromDate:[NSDate date]]]  forKey:@"AppliedOnline"];
    [jobApplicationDict setValue:defaultDate forKey:@"CVSubmitted"];
    [jobApplicationDict setValue:[user propEmail] forKey:@"CandidateEmail"];
    [jobApplicationDict setValue:[user propID] forKey:@"CandidateID"];
    [jobApplicationDict setValue:[NSString stringWithFormat:@"%@ %@",[user propFirstName],[user propLastName]] forKey:@"CandidateName"];
    [jobApplicationDict setValue:defaultDate forKey:@"ClientAccepted"];
    [jobApplicationDict setValue:@([job getCLientGroupID]) forKey:@"ClientGroupID"];
    [jobApplicationDict setValue:@([job getClientID]) forKey:@"ClientID"];
    [jobApplicationDict setValue:[job getClientName] forKey:@"ClientName"];
    [jobApplicationDict setValue:defaultDate forKey:@"ClientRejected"];
    [jobApplicationDict setValue:coverLetter forKey:@"CoverLetter"];
    [jobApplicationDict setValue:[job getDateFrom] forKey:@"DateFrom"];
    [jobApplicationDict setValue:[NSString stringWithFormat:@"\/Date(%@-0100)\/",[dateFormatter stringFromDate:[NSDate date]]]  forKey:@"DateModified"];
    [jobApplicationDict setValue:[job getDateTo] forKey:@"DateTo"];
    [jobApplicationDict setValue:[job getDateTo] forKey:@"EstimatedFinishDate"];
    [jobApplicationDict setValue:[job getDateFrom] forKey:@"EstimatedStartDate"];
    [jobApplicationDict setValue:defaultDate forKey:@"Interested"];
    [jobApplicationDict setValue:defaultDate forKey:@"InterviewDate"];
    [jobApplicationDict setValue:defaultDate forKey:@"InterviewDate2"];
    [jobApplicationDict setValue:defaultDate forKey:@"NotInterested"];
    [jobApplicationDict setValue:@"" forKey:@"Notes"];
    [jobApplicationDict setValue:[NSNumber numberWithBool:NO] forKey:@"Notified"];
    [jobApplicationDict setValue:@{@"Status":@0, @"StatusID":@0, @"StatusName":@"Unknown"} forKey:@"OBStatus"];
    [jobApplicationDict setValue:0 forKey:@"OBStatusID"];
    [jobApplicationDict setValue:defaultDate forKey:@"OfferRejected"];
    [jobApplicationDict setValue:@([job getOfficeID]) forKey:@"OfficeID"];
    [jobApplicationDict setValue:@0 forKey:@"OnBoardList"];
    [jobApplicationDict setValue:@([[user propReferrerID] intValue]) forKey:@"ReferrerID"];
    [jobApplicationDict setValue:defaultDate forKey:@"Resourced"];
    [jobApplicationDict setValue:defaultDate forKey:@"Shortlisted"];
    [jobApplicationDict setValue:@([[user propID] intValue]) forKey:@"StaffID"];
    [jobApplicationDict setValue:defaultDate forKey:@"Unsuitable"];
    [jobApplicationDict setValue:@([job getJobID]) forKey:@"VacancyID"];
    [jobApplicationDict setValue:[job getReference] forKey:@"VacancyRef"];
    [jobApplicationDict setValue:@([[user propID] intValue]) forKey:@"VacancyStaffID"];
    [jobApplicationDict setValue:[job getTitle] forKey:@"VacancyTitle"];
    
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:jobApplicationDict options:0 error:nil] encoding:NSUTF8StringEncoding];
}



@end
