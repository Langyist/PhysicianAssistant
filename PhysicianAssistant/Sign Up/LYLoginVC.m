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
    
    UIImageView *userimageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 17, 20)];
    userimageView.image = [UIImage imageNamed:@"ic_username"];
    self.userText.leftView = userimageView;
    self.userText.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *pwdimageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    pwdimageView1.image = [UIImage imageNamed:@"ic_password"];
    self.passwordText.leftView = pwdimageView1;
    self.passwordText.leftViewMode = UITextFieldViewModeAlways;
    
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
    [self performSegueWithIdentifier:@"GomainVC" sender:self];
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

@end
