//
//
// Copyright 2013 Kii Corporation
// http://kii.com
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//

#import "ViewController.h"

#import <KiiSDK/Kii.h>
#import "KiiToolkit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) showLoginView
{
    // create the login view
    KTLoginViewController *loginView = [[KTLoginViewController alloc] init];
    
    // get the registration view
    KTRegistrationViewController *registrationView = loginView.registrationView;
    
    // and the forgot password view
    KTForgotPasswordViewController *forgotView = loginView.forgotPasswordView;
    
    // we want to ask the user for an email address and a username
    registrationView.displayFields = KTRegistrationFieldEmailAddress | KTRegistrationFieldLoginName;
    
    // update our title images
    loginView.titleImage.image = [UIImage imageNamed:@"title"];
    registrationView.titleImage.image = [UIImage imageNamed:@"title"];
    forgotView.titleImage.image = [UIImage imageNamed:@"title"];
    
    // update our background images
    loginView.backgroundImage.image = [UIImage imageNamed:@"bg"];
    registrationView.backgroundImage.image = [UIImage imageNamed:@"bg"];
    forgotView.backgroundImage.image = [UIImage imageNamed:@"bg"];
    
    // update the buttons
    [loginView.loginButton setGradientColors:[UIColor colorWithHex:@"8e8e8e"], [UIColor colorWithHex:@"4c4c4c"], nil];
    [loginView.registerButton setGradientColors:[UIColor colorWithHex:@"004614"], [UIColor colorWithHex:@"012700"], nil];
    [loginView.forgotButton setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.3f]];
    [registrationView.registerButton setGradientColors:[UIColor colorWithHex:@"8e8e8e"], [UIColor colorWithHex:@"4c4c4c"], nil];
    [forgotView.sendResetButton setGradientColors:[UIColor colorWithHex:@"8e8e8e"], [UIColor colorWithHex:@"4c4c4c"], nil];
    
    loginView.loginButton.borderColor = [UIColor blackColor];
    loginView.registerButton.borderColor = [UIColor blackColor];
    registrationView.registerButton.borderColor = [UIColor blackColor];
    forgotView.sendResetButton.borderColor = [UIColor blackColor];
    
    // show the view
    [self presentViewController:loginView animated:TRUE completion:nil];
}

- (void) viewDidAppear:(BOOL)animated
{
    // if there is no user logged in
    if(![KiiUser loggedIn]) {
        // show the login view
        [self showLoginView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
