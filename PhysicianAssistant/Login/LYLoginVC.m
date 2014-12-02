//
//  LYLoginVC.m
//  PhysicianAssistant
//  登陆
//  Created by langyi on 14/12/2.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "LYLoginVC.h"

@interface LYLoginVC ()

@end

@implementation LYLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
}
//用户注册Button
- (IBAction)SignUpButton:(id)sender {
    [self performSegueWithIdentifier:@"GoSignUpVC" sender:self];
}
//忘记密码Button
- (IBAction)ForgetButton:(id)sender {
}

@end
