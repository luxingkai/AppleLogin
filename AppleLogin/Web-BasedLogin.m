//
//  Web-BasedLogin.m
//  AppleLogin
//
//  Created by tigerfly on 2020/6/28.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "Web-BasedLogin.h"
#import <AuthenticationServices/AuthenticationServices.h>

@interface Web_BasedLogin ()<ASWebAuthenticationPresentationContextProviding>

@end

@implementation Web_BasedLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark -- Authenticating a User Through a Web Service
    
    /* create a Web authentication Session */
    
    // Use the URL and callback scheme specified by the authorization provider.
    NSURL *authURL = [NSURL URLWithString:@"http://example.com/auth"];
    NSString *scheme = @"exampleauth";
    
    // Initialize the session.
    ASWebAuthenticationSession *session = [[ASWebAuthenticationSession alloc] initWithURL:authURL callbackURLScheme:scheme completionHandler:^(NSURL * _Nullable callbackURL, NSError * _Nullable error) {
        
        [session cancel];
        /* Handle the Callback */
        if (error || callbackURL == nil) {
            return;
        }
        
        NSArray *queryItems = [[[NSURLComponents alloc] initWithString:callbackURL.absoluteString] queryItems];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"$0.name == \"token\""];
        NSString *token = [queryItems filteredArrayUsingPredicate:predicate].firstObject;        
    }];
    session.presentationContextProvider = self;
    
    /* Optionally Request Ephemeral Browsing */
    session.prefersEphemeralWebBrowserSession = true;
    
    /* Start the Authentication Flow */
    [session start];
    
    
}

#pragma mark -- Provide a Presentation Context
- (ASPresentationAnchor)presentationAnchorForWebAuthenticationSession:(ASWebAuthenticationSession *)session {
    return self.view.window;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
