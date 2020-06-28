//
//  AppDelegate.m
//  AppleLogin
//
//  Created by tigerfly on 2020/5/23.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "AuthenticationServices.h"
#import "Web-BasedLogin.h"
#import <AuthenticationServices/AuthenticationServices.h>
#import <Security/Security.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark -- Check User Credentials at Launch

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    id appleIDProvider = [ASAuthorizationAppleIDProvider new];
//    appleIDProvider getCredentialStateForUserID: completion:<#^(ASAuthorizationAppleIDProviderCredentialState credentialState, NSError * _Nullable error)completion#>
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    Web_BasedLogin *vc = [Web_BasedLogin new];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end
