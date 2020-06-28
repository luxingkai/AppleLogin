//
//  AuthenticationServices.m
//  AppleLogin
//
//  Created by tigerfly on 2020/6/28.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "AuthenticationServices.h"
#import <AuthenticationServices/AuthenticationServices.h>

@interface AuthenticationServices ()<ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding>

@end

@implementation AuthenticationServices {
    
    ASAuthorizationAppleIDProvider *_appleIDProvider;
    ASAuthorizationAppleIDRequest *_request;
}

/*
 Make it easy for users to log into apps and services.
 1. Give users the ability to sign into your services with their Apple ID.
 2. Enable users to look up their stored passwords from within the sign-in flow of an app.
 3. Share data between an app and a web browser using technologies like OAuth to leverage existing web-based logins in the app.
 4. Create a single sign-on (SSO) experience in an enterprise app.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark -- Sign In with Apple
    
    [self setupProviderLoginView];


    
}

#pragma mark -- Add a Sign in with Apple Button

- (void)setupProviderLoginView {
    
    ASAuthorizationAppleIDButton *authorizationButton = [[ASAuthorizationAppleIDButton alloc] initWithAuthorizationButtonType:ASAuthorizationAppleIDButtonTypeSignIn authorizationButtonStyle:ASAuthorizationAppleIDButtonStyleWhite];
    authorizationButton.frame = CGRectMake(20, 100, 120, 30);
    [authorizationButton addTarget:self action:@selector(handleAuthorizationAppleIDButtonPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:authorizationButton];
    
}

#pragma mark -- Request Authorization with Apple ID

- (void)handleAuthorizationAppleIDButtonPress {
    
    _appleIDProvider = [ASAuthorizationAppleIDProvider new];
    _request = [_appleIDProvider createRequest];
    _request.requestedScopes = @[ASAuthorizationScopeFullName,ASAuthorizationScopeEmail];
    
    ASAuthorizationController *authorizationController = [[ASAuthorizationController alloc] initWithAuthorizationRequests:@[_request]];
    authorizationController.delegate = self;
    authorizationController.presentationContextProvider = self;
    [authorizationController performRequests];
}

#pragma mark -- Handle User Credentials

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization {
    
    id credential = authorization.credential;
    if ([credential isKindOfClass:[ASAuthorizationAppleIDCredential class]]) {
        
        ASAuthorizationAppleIDCredential *appleIDCredential = (ASAuthorizationAppleIDCredential *)credential;
        //Create an account in your system.
        NSString *userIdentifier = appleIDCredential.user;
//        NSString *fullName = appleIDCredential.fullName;
        NSString *email = appleIDCredential.email;
        
        // For the purpose of this demo app, store the `userIdentifier` in the keychain.
        
        // For the purpose of this demo app, show the Apple ID credential information in the `ResultViewController`.
        
        
    }
    if ([credential isKindOfClass:[ASPasswordCredential class]]) {
        ASPasswordCredential *passwordCredential = (ASPasswordCredential *)credential;

        // Sign in using an existing iCloud Keychain credential.
        NSString *username = passwordCredential.user;
        NSString *password = passwordCredential.password;
        
        // for the purpose of this demo app, show the password credential as an alert.
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    }
    
}

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error {
    
}

#pragma mark -- Request Existing Credentials

- (void)performExistingAccountSetupFlows {
    
    //Prepare requests for both Apple ID and password providers.
    NSArray *requests = @[[[ASAuthorizationAppleIDProvider new] createRequest], [[ASAuthorizationPasswordProvider new] createRequest]];
    
    //Create an authorization controller with the given requests
    ASAuthorizationController *authorizationController = [[ASAuthorizationController alloc] initWithAuthorizationRequests:requests];
    authorizationController.delegate = self;
    authorizationController.presentationContextProvider = self;
    [authorizationController performRequests];
}


#pragma mark -- ASAuthorizationControllerPresentationContextProviding

- (ASPresentationAnchor)presentationAnchorForAuthorizationController:(ASAuthorizationController *)controller {
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
