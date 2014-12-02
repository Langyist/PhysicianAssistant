//
//  LYPasswordVC.m
//  PhysicianAssistant
//
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
    
    UITapGestureRecognizer *Gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    [self.view addGestureRecognizer:Gesture];
}

- (void)closeKeyboard {
    
    [self.passwordText resignFirstResponder];
    [self.thirdText resignFirstResponder];
}
//完成注册Button
- (IBAction)signButton:(id)sender {
}

#pragma mark UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.passwordText) {
        [self.thirdText becomeFirstResponder];
    }else {
        
        [self.thirdText resignFirstResponder];
    }
    return YES;
}

@end
