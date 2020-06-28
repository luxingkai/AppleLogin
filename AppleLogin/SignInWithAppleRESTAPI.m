//
//  SignInWithAppleRESTAPI.m
//  AppleLogin
//
//  Created by tigerfly on 2020/6/28.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "SignInWithAppleRESTAPI.h"
#import <AuthenticationServices/AuthenticationServices.h>

@interface SignInWithAppleRESTAPI ()

@end

@implementation SignInWithAppleRESTAPI {
    
}

/*
 Communicate between your app servers and Apple’s authentication servers.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark -- Authentication and Verification of Users
    
    /* Authenticating Users with Sign in with Apple,
     Securely authenticate users and create accounts for them in your app. */
    
    //Authenticate the User and Request Information
    
    //Retrieve the User's information from Apple ID Servers
    
    //Send information to App Servers and Vertify Tokens
    
    //Prevent Duplicate Accounts
    
    
    /* Verifying a User, Check the validity and integrity of a user’s identity token.*/
    
    //Verify the Identity Token
    
    //Obtain a Refresh Token
    
    //Manage the User Session
     
     
#pragma mark -- Endpoints
    
    /* Fetch Apple's public key for verifying token signature */
    // GET https://appleid.apple.com/auth/keys
    
    /* Generate and Validate Tokens, Validate an authorization grant code delivered to your app to obtain tokens, or validate an existing refresh token. */
    // POST https://appleid.apple.com/auth/token
    // HTTP Header form-data Content-Type: application/x-www-form-urlencoded
    // Parts
    // client_id(Required)string  The identifier (App ID or Services ID) for your app
    // client_secret(Required)
    // code
    // grant_type (Required)
    // refresh_token
    // redirect_uri
    
    /* Validate the Authorization Grant Code */
    // client_id
    // client_secret
    // code
    // grant_type
    // redirect_uri
    
    /* Validate an Existing Refresh Token */
    // client_id
    // client_secret
    // grant_type
    // refresh_token
    
    /* Creating the Client Secret */
    
    
    
    
#pragma mark -- Common Objects
    
    
    
    
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
