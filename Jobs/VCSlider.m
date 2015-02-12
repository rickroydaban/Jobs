//
//  VCSlider.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#define MAXPANNING 250
#define MINPANTOSHOWMAINPAGE 100
#define ANIMATIONDURATION 0.3f

#import "VCSlider.h"
#import "CellSidebar.h"
#import "VelosiColors.h"
#import "DAKeyboardControl.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface VCSlider(){
    CGFloat _mainPageX;
    UIViewController *_currMainController;
    BOOL _isSidebarShowing;
    AppDelegate *_appDelegate;
    NSIndexPath *_currIndexPath;
    UIAlertView *_alertViewDeactivateAccout, *_alertViewSendEmail;
    
    NSArray *_profileItemTitles, *_profileItemImages, *_profileItemHiglightedImages, *_linkItemTitles, *_linkItemHighlightedImages, *_linkItemImages;
}
@end

@implementation VCSlider

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //set swipe down gesture on views to close opened keyboards
    [_propMainPage addKeyboardPanningWithActionHandler:nil];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [_appDelegate setupOnSliderOnLoad:self];
    _mainPageX = 0;
    _isSidebarShowing = NO;
    
    _propMainPage.layer.shadowColor = [UIColor blackColor].CGColor;
    _propMainPage.layer.shadowOpacity = 1;
    _propMainPage.layer.shadowOffset = CGSizeMake(0, 0);
    
    _profileItemTitles = @[@"My Details", @"My Documents", @"My Employments", @"My Applications", @"My Saved Searches", @"Change Password", @"Delete this Account", @"Logout"];
    _profileItemImages = @[@"icon_user_details", @"icon_user_documents", @"icon_user_employment", @"icon_user_applications", @"icon_user_searches", @"icon_user_password", @"icon_user_deleteaccount", @"icon_user_logout"];
    _profileItemHiglightedImages = @[@"icon_user_details_sel", @"icon_user_documents_sel", @"icon_user_employment_sel", @"icon_user_applications_sel", @"icon_user_searches_sel", @"icon_user_password_sel", @"icon_user_deleteaccount_sel", @"icon_user_logout_sel"];
    _linkItemTitles = @[@"About Us", @"CV Help", @"News", @"Terms", @"Privacy", @"Copyright", @"Disclaimer", @"Security Policy"];
    
    self.propLvSidebar.delegate = self;
    self.propLvSidebar.dataSource = self;
    
    //initial selection requires to steps: hightlight selected then switch to selected
    [_propLvSidebar selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionBottom];
    [_propLvSidebar.delegate tableView:_propLvSidebar didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

#pragma mark private methods
- (void)changePage:(UIViewController *)controller{
    if([controller isKindOfClass:[UINavigationController class]])
        [(UINavigationController *)controller setDelegate:self];
    
    if (_currMainController == nil) {
        controller.view.frame = _propMainPage.bounds;
        _currMainController = controller;
        [self addChildViewController:_currMainController];
        [_propMainPage addSubview:_currMainController.view];
        [_currMainController didMoveToParentViewController:self];
    } else if (_currMainController != controller && controller !=nil) {
        controller.view.frame = _propMainPage.bounds;
        [_currMainController willMoveToParentViewController:nil];
        [self addChildViewController:controller];
        self.view.userInteractionEnabled = NO;
        [self transitionFromViewController:_currMainController
                          toViewController:controller
                                  duration:0
                                   options:UIViewAnimationOptionTransitionNone
                                animations:^{}
                                completion:^(BOOL finished){
                                    self.view.userInteractionEnabled = YES;
                                    [_currMainController removeFromParentViewController];
                                    [controller didMoveToParentViewController:self];
                                    _currMainController = controller;
                                    
                                    [self updateSidebarWillShow:NO];
                                }
         ];
    }
}

- (void)updateSidebarWillShow:(BOOL)willShow{
    _propMainPage.userInteractionEnabled = NO;
    _propLvSidebar.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:ANIMATIONDURATION animations:^{
        _propMainPage.transform = CGAffineTransformMakeTranslation((willShow)?MAXPANNING:0, 0);
    } completion:^(BOOL finished){
        _propMainPage.userInteractionEnabled = YES;
        _propLvSidebar.userInteractionEnabled = YES;
        _isSidebarShowing = willShow;
        _mainPageX = 0;
    }];
}

#pragma mark default methods
- (void)reloadSidebarItems{
    [_propLvSidebar reloadData];
}

- (void)toggleSidebar{
    if(!_isSidebarShowing)
        [self.view endEditing:YES];
    
    [self updateSidebarWillShow:!_isSidebarShowing];
}

#pragma mark implemented methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0: return 2;
        case 1: return [_appDelegate.propGatewayOffline isLoggedIn]?8:1;
        case 2: return 8;
        case 3: return 1;
            
        default: return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellSidebar *cell = [self.propLvSidebar dequeueReusableCellWithIdentifier:@"cell"];
    UILabel *selBgView = [[UILabel alloc] initWithFrame:cell.backgroundView.frame];
    selBgView.backgroundColor = [VelosiColors orangeVelosi];
    cell.selectedBackgroundView = selBgView;
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell.cellIImage.image = [UIImage imageNamed:@"icon_user_home"];
                    cell.cellIImage.highlightedImage = [UIImage imageNamed:@"icon_user_home_sel"];
                    cell.cellTitle.text = @"Home";
                    break;
                    
                case 1:
                    cell.cellIImage.image = [UIImage imageNamed:@"icon_user_search"];
                    cell.cellIImage.highlightedImage = [UIImage imageNamed:@"icon_user_search_sel"];
                    cell.cellTitle.text = @"Advance Search";
                    
                default:
                    break;
            }
            break;

        case 1:
            if([_appDelegate.propGatewayOffline isLoggedIn]){
                cell.cellIImage.image = [UIImage imageNamed:[_profileItemImages objectAtIndex:indexPath.row]];
                cell.cellIImage.highlightedImage = [UIImage imageNamed:[_profileItemHiglightedImages objectAtIndex:indexPath.row]];
                cell.cellTitle.text = [_profileItemTitles objectAtIndex:indexPath.row];
            }else{
                cell.cellIImage.image = [UIImage imageNamed:@"icon_login"];
                cell.cellIImage.highlightedImage = [UIImage imageNamed:@"icon_login_sel"];
                cell.cellTitle.text = @"Login";
            }
            break;
            
        case 2:
            cell.cellIImage.image = [UIImage imageNamed:@"icon_user_link"];
            cell.cellIImage.highlightedImage = [UIImage imageNamed:@"icon_user_link_sel"];
            cell.cellTitle.text = [_linkItemTitles objectAtIndex:indexPath.row];
            break;
            
        case 3:
            cell.cellIImage.image = [UIImage imageNamed:@"icon_user_reportbug"];
            cell.cellIImage.highlightedImage = [UIImage imageNamed:@"icon_user_reportbug_sel"];
            cell.cellTitle.text = @"Report Bug";
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSIndexPath *temp = indexPath;
    if(_currIndexPath!=nil && _currIndexPath.section == indexPath.section && _currIndexPath.row == indexPath.row)
        [self updateSidebarWillShow:NO];
    else{
        switch (indexPath.section) {
            case 0:
                [self changePage:(indexPath.row == 0)?[_appDelegate.propPageNavigator getVCHome]:[_appDelegate.propPageNavigator getVCSearchPage]];
                break;
                
            case 1:
                if ([_appDelegate.propGatewayOffline isLoggedIn]) {
                    switch (indexPath.row) {
                        case 0: [self changePage:[_appDelegate.propPageNavigator getUserDetailNavigator]]; break;
                        case 1: [self changePage:[_appDelegate.propPageNavigator getUserDocumentsNavigator]]; break;
                        case 2: [self changePage:[_appDelegate.propPageNavigator getUserEmploymentsNavigator]]; break;
                        case 3: [self changePage:[_appDelegate.propPageNavigator getUSerApplicationsNavigator]]; break;
                        case 4: [self changePage:[_appDelegate.propPageNavigator getUserSearchesNavigator]]; break;
                        case 5: [self changePage:[_appDelegate.propPageNavigator getUSerPasswordNavigator]]; break;
                            
                        case 6:
                            if(!_alertViewDeactivateAccout)
                                _alertViewDeactivateAccout = [[UIAlertView alloc] initWithTitle:@"Delete Account" message:@"Are you sure you want to delete this account?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Delete", nil];
                            [_alertViewDeactivateAccout show];
                            temp = _currIndexPath;
                            break;
                        case 7:
                            [_appDelegate.propGatewayOffline logout];
                            [_appDelegate.propPageNavigator logout];
                            temp = _currIndexPath;
                            [self changePage:[_appDelegate.propPageNavigator getLoginNavigator]];
                            [self reloadSidebarItems];
                            break;
                            
                        default:
                            break;
                    }
                }else
                    [self changePage:[_appDelegate.propPageNavigator getLoginNavigator]];
                break;
                
            case 2:
                switch (indexPath.row) {
                    case 0: [self changePage:[_appDelegate.propPageNavigator getVCAboutUs]]; break;
                    case 1: [self changePage:[_appDelegate.propPageNavigator getVCCVHelp]]; break;
                    case 2: [self changePage:[_appDelegate.propPageNavigator getVCNews]]; break;
                    case 3: [self changePage:[_appDelegate.propPageNavigator getVCTerms]]; break;
                    case 4: [self changePage:[_appDelegate.propPageNavigator getVCPrivacy]]; break;
                    case 5: [self changePage:[_appDelegate.propPageNavigator getVCCopyRight]]; break;
                    case 6: [self changePage:[_appDelegate.propPageNavigator getVCDisclaimer]]; break;
                    case 7: [self changePage:[_appDelegate.propPageNavigator getVCSecurityPolicy]]; break;
                        
                    default: break;
                }
                
                break;
                
            case 3:{
                temp = _currIndexPath;
                MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
                controller.mailComposeDelegate = self;
                [controller setSubject:@"ARC iOS Issue"];
                [controller setToRecipients:@[@"martin.coles@applusvelosi.com"]];
                [controller setMessageBody:@"" isHTML:NO];
                if (controller)
                    [self presentViewController:controller animated:YES completion:nil];
            }
                break;
                
            default:
                break;
        }
    }
    
    _currIndexPath = temp;
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error{
    if(result == MFMailComposeResultSent)
        [[[UIAlertView alloc] initWithTitle:@"" message:@"The issue has been submitted. Thank you for helping us improve our system" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
    else if(result == MFMailComposeResultFailed)
        [[[UIAlertView alloc] initWithTitle:@"" message:error.localizedFailureReason delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 1: return @"Profile";
        case 2: return @"Links";
        default: return @"";
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView==_alertViewDeactivateAccout && buttonIndex == 1) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSString *result = [_appDelegate.propGatewayOnline closeAccount];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                if([result isEqualToString:@"OK"]){
                    [_appDelegate.propGatewayOffline logout];
                    [_appDelegate.propPageNavigator logout];
                    [self changePage:[_appDelegate.propPageNavigator getLoginNavigator]];
                    [self reloadSidebarItems];
                }else
                    [[[UIAlertView alloc] initWithTitle:@"" message:result delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
            });
        });
    }else{
        NSLog(@"deletion cancelled");
        [_propLvSidebar.delegate tableView:_propLvSidebar didSelectRowAtIndexPath:_currIndexPath];
        [_propLvSidebar selectRowAtIndexPath:_currIndexPath animated:NO scrollPosition:UITableViewScrollPositionBottom];
    }
    
}

#pragma mark custom methods
- (void)changeToProfileSidebarItemsAfterLoginSuccess{
    if([_appDelegate.propGatewayOffline isLoggedIn])
        [self changePage:[_appDelegate.propPageNavigator getUserDetailNavigator]];
}

@end
