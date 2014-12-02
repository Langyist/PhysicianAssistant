//
//  LYLoginVC.m
//  PhysicianAssistant
//  登陆
//  Created by langyi on 14/12/2.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "LYLoginVC.h"

@interface LYLoginVC () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *userText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@end

@implementation LYLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userText.delegate = self;
    self.passwordText.delegate = self;
    self.passwordText.secureTextEntry = YES;
    self.passwordText.clearsOnBeginEditing = YES;
    
    self.loginButton.layer.cornerRadius = 5.0f;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)closeKeyboard {
    
    [self.userText resignFirstResponder];
    [self.passwordText resignFirstResponder];
}
//登陆Button
- (IBAction)loginButton:(id)sender {
    
}

//用户注册Button
- (IBAction)SignUpButton:(id)sender {
    [self performSegueWithIdentifier:@"GoSignUpVC" sender:self];
}
//忘记密码Button
- (IBAction)ForgetButton:(id)sender {
}

#pragma mark UITextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.userText) {
        [self.passwordText becomeFirstResponder];
    }else {
        
        [self.passwordText resignFirstResponder];
    }
    return YES;
}

////开始编辑输入框
//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    if (textField==self.userText) {
//        NSTimeInterval animationDuration = 0.30f;
//        CGRect frame = self.view.frame;
//        frame.origin.y -=60;
//        //frame.size.height +=60;
//        self.view.frame = frame;
//        [UIView beginAnimations:@"ResizeView" context:nil];
//        [UIView setAnimationDuration:animationDuration];
//        [UIView commitAnimations];
//    }else if (textField==self.passwordText)
//    {
//        NSTimeInterval animationDuration = 0.30f;
//        CGRect frame = self.view.frame;
//        frame.origin.y -=100;
//        //frame.size.height +=100;
//        self.view.frame = frame;
//        [UIView beginAnimations:@"ResizeView" context:nil];
//        [UIView setAnimationDuration:animationDuration];
//        [UIView commitAnimations];
//    }
//}
////结束编辑输入框
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    if (textField==self.userText)
//    {
//        NSTimeInterval animationDuration = 0.30f;
//        CGRect frame = self.view.frame;
//        frame.origin.y +=60;
//        //frame.size.height -=60;
//        self.view.frame = frame;
//        [UIView beginAnimations:@"ResizeView" context:nil];
//        [UIView setAnimationDuration:animationDuration];
//        self.view.frame = frame;
//        [UIView commitAnimations];
//    }else if (textField == self.passwordText)
//    {
//        NSTimeInterval animationDuration = 0.30f;
//        CGRect frame = self.view.frame;
//        frame.origin.y +=100;
//        //frame.size.height -=100;
//        self.view.frame = frame;
//        [UIView beginAnimations:@"ResizeView" context:nil];
//        [UIView setAnimationDuration:animationDuration];
//        self.view.frame = frame;
//        [UIView commitAnimations];
//    }
//}

@end
