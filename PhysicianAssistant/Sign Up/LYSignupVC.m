//
//  LYSignupVC.m
//  PhysicianAssistant
//  注册界面
//  Created by langyi on 14/12/2.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "LYSignupVC.h"

@interface LYSignupVC () <UITextFieldDelegate> {
    
}
@property (weak, nonatomic) IBOutlet UITextField *numberText;
@property (weak, nonatomic) IBOutlet UITextField *phoneText;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;


@end

@implementation LYSignupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.signupButton.layer.cornerRadius = 5.0f;
    self.phoneText.delegate = self;
    //添加关闭键盘手势
    UITapGestureRecognizer *closeGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    [self.view addGestureRecognizer:closeGesture];
}
//关闭键盘
- (void)closeKeyboard {
    
    [self.phoneText resignFirstResponder];
}
//注册button
- (IBAction)signupButton:(id)sender {
    [self performSegueWithIdentifier:@"GoGetcedeVC" sender:self];
}
//医生助手服务协议
- (IBAction)AgreementButton:(id)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.phoneText) {
        [self.phoneText resignFirstResponder];
    }
    return YES;
}
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"GoGetcedeVC"]){
        id theSegue = segue.destinationViewController;
        [theSegue setValue:self.phoneText.text forKey:@"phoneText"];
        
    }
}

@end
