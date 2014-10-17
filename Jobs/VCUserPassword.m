//
//  VCUserPassword.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserPassword.h"

@implementation VCUserPassword

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _bottomNavigator.layer.shadowColor = [UIColor blackColor].CGColor;
    _bottomNavigator.layer.shadowOpacity = 1;
    _bottomNavigator.layer.shadowOffset = CGSizeMake(0, 0);

    _lvContainer.layer.shadowColor = [UIColor blackColor].CGColor;
    _lvContainer.layer.shadowOpacity = 1;
    _lvContainer.layer.shadowOffset = CGSizeMake(0, 0);
}

- (IBAction)showUserDetailPage:(id)sender {
    [self switchToDetailPage];
}

- (IBAction)showUserSearchesPage:(id)sender {
    [self switchToSearchPage];
}

- (IBAction)showUserDocumentPage:(id)sender {
    [self switchToDocumentPage];
}

- (IBAction)showUserEmploymentPage:(id)sender {
    [self switchToEmploymentPage];
}

- (IBAction)toggleActions:(id)sender {
    [[[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Submit", @"Logout", nil] showInView:self.view];
}

- (IBAction)showUserApplicationPage:(id)sender {
    [self switchToApplicationsPage];
}


- (IBAction)advanceSearch:(id)sender {
    [self switchToAdvanceSearchPage:sender];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            NSLog(@"Submit");
            break;
            
        case 1:
            NSLog(@"Logout");
            break;
            
        default:
            break;
    }
}
@end
