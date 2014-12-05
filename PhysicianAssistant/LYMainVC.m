//
//  LYMainVC.m
//  PhysicianAssistant
//  主页
//  Created by langyi on 14/12/4.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "LYMainVC.h"

@interface LYMainVC ()

@end

@implementation LYMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (IBAction)gomedicalButton:(id)sender {
    [self performSegueWithIdentifier:@"GoMedicalVC" sender:self];
}

- (IBAction)GoCircleButton:(id)sender {
    [self performSegueWithIdentifier:@"GoCircleVC" sender:self];
}

- (IBAction)CommunicateButton:(id)sender {
    [self performSegueWithIdentifier:@"GoCommunicateVC" sender:self];
}

@end
