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

@interface VCSlider(){
    UIPanGestureRecognizer *_panGestureRecognizer;
    CGFloat _mainPageX;
    VCPage *_currMainController;
    BOOL _isSidebarShowing;
    int _prevSelectedCell, _selectedCell;
    
    NSArray *_profileItemTitles, *_profileItemImages, *_profileItemHiglightedImages, *_linkItemTitles, *_linkItemHighlightedImages, *_linkItemImages;
}
@end

@implementation VCSlider

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _prevSelectedCell = 0;
    _selectedCell = 0;
    _mainPageX = 0;
    _isSidebarShowing = NO;
    _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:_panGestureRecognizer];
    
    _mainPage.layer.shadowColor = [UIColor blackColor].CGColor;
    _mainPage.layer.shadowOpacity = 1;
    _mainPage.layer.shadowOffset = CGSizeMake(0, 0);
    
    _profileItemTitles = @[@"My Details", @"My Documents", @"My Employments", @"My Applications", @"My Saved Searches", @"Change Password", @"Delete this Account", @"Logout"];
    _profileItemImages = @[@"icon_user_details", @"icon_user_documents", @"icon_user_employment", @"icon_user_applications", @"icon_user_searches", @"icon_user_password", @"icon_user_deleteaccount", @"icon_user_logout"];
    _profileItemHiglightedImages = @[@"icon_user_details_sel", @"icon_user_documents_sel", @"icon_user_employment_sel", @"icon_user_applications_sel", @"icon_user_searches_sel", @"icon_user_password_sel", @"icon_user_deleteaccount_sel", @"icon_user_logout_sel"];
    _linkItemTitles = @[@"About Us", @"CV Help", @"News", @"Terms", @"Privacy", @"Copyright", @"Disclaimer", @"Security Policy"];
    
    self.sidebarLv.delegate = self;
    self.sidebarLv.dataSource = self;
    
    [self changePage:[self.appDelegate.userPageNavigators getVCLogin]];
}

- (void)changePage:(VCPage *)controller{
    if([controller isKindOfClass:[UINavigationController class]])
        [(UINavigationController *)controller setDelegate:self];
    
    if (_currMainController == nil) {
        controller.view.frame = _mainPage.bounds;
        _currMainController = controller;
        [self addChildViewController:_currMainController];
        [_mainPage addSubview:_currMainController.view];
        [_currMainController didMoveToParentViewController:self];
    } else if (_currMainController != controller && controller !=nil) {
        controller.view.frame = _mainPage.bounds;
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
                                }
         ];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0: return 2;
        case 1: return ![self.appDelegate.offlineGateway isLoggedIn]?8:1;
        case 2: return 8;
        case 3: return 1;
            
        default: return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellSidebar *cell = [self.sidebarLv dequeueReusableCellWithIdentifier:@"cell"];
    UILabel *selBgView = [[UILabel alloc] initWithFrame:cell.backgroundView.frame];
    selBgView.backgroundColor = [VelosiColors blackSidebarSelectedCellBG];
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
            cell.cellIImage.image = [UIImage imageNamed:[_profileItemImages objectAtIndex:indexPath.row]];
            cell.cellIImage.highlightedImage = [UIImage imageNamed:[_profileItemHiglightedImages objectAtIndex:indexPath.row]];
            cell.cellTitle.text = [_profileItemTitles objectAtIndex:indexPath.row];
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
    
    cell.tag = [[NSString stringWithFormat:@"%d%d",indexPath.section,indexPath.row] integerValue];
    cell.cellTitle.textColor = (cell.tag == _selectedCell)?[VelosiColors orangeVelosi]:[VelosiColors blackSidebarFont];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 1: return @"Profile";
        case 2: return @"Links";
        default: return @"";
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_prevSelectedCell >= 0){
        NSString *s = [NSString stringWithFormat:@"%d",_prevSelectedCell];
        ((CellSidebar *)[_sidebarLv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:[s characterAtIndex:(_prevSelectedCell<10)?0:1]-48 inSection:(_prevSelectedCell<10)?0:[s characterAtIndex:0]-48]]).cellTitle.textColor = [VelosiColors blackSidebarFont];
    }
    
    _selectedCell = [[NSString stringWithFormat:@"%d%d",indexPath.section,indexPath.row] integerValue];
    ((CellSidebar *)[_sidebarLv cellForRowAtIndexPath:indexPath]).cellTitle.textColor = [VelosiColors orangeVelosi];
    
    _prevSelectedCell = _selectedCell;
    
    return indexPath;
}

- (void)pan:(UIPanGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateChanged){
        //update the foreview's horizontal  placement while panning
        CGFloat pannedDistance = [recognizer translationInView:_mainPage].x;
        
        if(_mainPageX+pannedDistance > 0)
            _mainPage.transform = CGAffineTransformMakeTranslation(pannedDistance+_mainPageX, 0);
        
    } else if (recognizer.state == UIGestureRecognizerStateEnded){
        //decide wether which view will be shown after panning
        _mainPageX = _mainPage.transform.tx;
        
        if(_mainPageX > 0)
            [self updateSidebarWillShow:(_mainPageX>MINPANTOSHOWMAINPAGE && !_isSidebarShowing)?YES:NO];
    }
}

- (void)updateSidebarWillShow:(BOOL)willShow{
    _mainPage.userInteractionEnabled = NO;
    _sidebarLv.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:ANIMATIONDURATION animations:^{
                                                      _mainPage.transform = CGAffineTransformMakeTranslation((willShow)?MAXPANNING:0, 0);
                                                  } completion:^(BOOL finished){
                                                      _mainPage.userInteractionEnabled = YES;
                                                      _sidebarLv.userInteractionEnabled = YES;
                                                      _isSidebarShowing = willShow;
                                                      _mainPageX = 0;
                                                  }];
}

@end
