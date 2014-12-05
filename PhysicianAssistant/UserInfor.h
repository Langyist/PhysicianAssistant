//
//  UserInfor.h
//  PhysicianAssistant
//
//  Created by LANGYI on 14/12/4.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfor : NSObject



+(UserInfor*) shareInstance;

-(void)setPhoneNumber:(NSString *)number;
-(NSString*)PhoneNumber;

-(void)setCity:(NSString *)City;
-(NSString*)City;

-(void)setAccount:(NSString *)Account;
-(NSString*)Account;

@end
