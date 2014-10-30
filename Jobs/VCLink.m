//
//  VCLink.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCLink.h"
#import "MBProgressHUD.h"

@interface VCLink(){
    MBProgressHUD *_hud;
}
@end

@implementation VCLink

- (void)webViewDidStartLoad:(UIWebView *)webView{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.mode = MBProgressHUDModeIndeterminate;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_hud hide:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [_hud hide:YES];
    [[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
}

@end
