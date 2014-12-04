//
//  LYGetcodeVC.m
//  PhysicianAssistant
//  获取验证码
//  Created by langyi on 14/12/2.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "LYGetcodeVC.h"

@interface LYGetcodeVC ()<UITextFieldDelegate> {
    int m_dTime;
    NSTimer *m_timer;
}
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UIButton *getcodeButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (nonatomic,weak) NSString *phoneText;

@end

@implementation LYGetcodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    m_dTime = 60;
    
    self.nextButton.layer.cornerRadius = 5.0f;
    
    self.getcodeButton.layer.borderWidth = 0.2f;
    self.getcodeButton.layer.cornerRadius = 5.0f;
    
    self.phoneLabel.text = self.phoneText;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
}
//点击空白关闭键盘
- (void)closeKeyboard {
    
    [self.codeTextField resignFirstResponder];
}
//获取验证码Button
- (IBAction)getcodeButton:(id)sender {
    if (m_dTime<1) {
        [m_timer invalidate];
    }
    m_dTime --;
    [self.getcodeButton setTitle: [[NSString alloc] initWithFormat:@"%d",m_dTime] forState: UIControlStateNormal];
}
//下一步Button
- (IBAction)nextButton:(id)sender {
    [self performSegueWithIdentifier:@"GoPasswordVC" sender:self];
}

#pragma mark UITextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.codeTextField) {
        [self.codeTextField resignFirstResponder];
    }
    return YES;
}

@end
