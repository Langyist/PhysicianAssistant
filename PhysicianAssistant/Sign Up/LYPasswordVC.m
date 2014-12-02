//
//  LYPasswordVC.m
//  PhysicianAssistant
//  完成注册
//  Created by langyi on 14/12/2.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "LYPasswordVC.h"

@interface LYPasswordVC () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *thirdText;
@property (weak, nonatomic) IBOutlet UIButton *signButton;

@end

@implementation LYPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.signButton.layer.cornerRadius = 5.0f;
    
    self.passwordText.secureTextEntry = YES;
    self.passwordText.clearsOnBeginEditing = YES;
    
    self.thirdText.secureTextEntry = YES;
    self.thirdText.clearsOnBeginEditing = YES;
    
    UITapGestureRecognizer *Gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    [self.view addGestureRecognizer:Gesture];
}

- (void)closeKeyboard {
    
    [self.passwordText resignFirstResponder];
    [self.thirdText resignFirstResponder];
}
//完成注册Button
- (IBAction)signButton:(id)sender {
    if (self.passwordText.text != self.thirdText.text) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"两次输入密码不相同！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alert show];
    }
}

#pragma mark UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.passwordText) {
        [self.thirdText becomeFirstResponder];
    }else if (textField == self.thirdText){
        
        [self.thirdText resignFirstResponder];
    }
    return YES;
}

@end
