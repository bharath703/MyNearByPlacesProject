//
//  LoginView.h
//  MyFirstProject
//
//  Created by Java Guru IOS on 03/12/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *myUserName;
@property (weak, nonatomic) IBOutlet UITextField *myPassword;
@property (weak, nonatomic) IBOutlet UIButton *mLoginButton;

@property (weak, nonatomic) IBOutlet UITextField *mNewUserName;
@property (weak, nonatomic) IBOutlet UITextField *mNewPassword;
@property (weak, nonatomic) IBOutlet UIButton *mNewSignUpbutton;
- (IBAction)mNewSignUpAction:(id)sender;
- (IBAction)mLoginButtonAction:(id)sender;

@end
