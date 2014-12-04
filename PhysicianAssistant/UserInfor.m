//
//  UserInfor.m
//  PhysicianAssistant
//
//  Created by LANGYI on 14/12/4.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "UserInfor.h"

@interface UserInfor () {
    NSUserDefaults *defaults;
    NSString* _City;
    NSString* _Account;
    NSString* _PhoneNumber;
}

@end



@implementation UserInfor


+(UserInfor*) shareInstance{
    static UserInfor *instance = nil;
    if (instance == nil) {
        instance = [[UserInfor alloc] init];
        [instance initData];
    }
    return instance;
}

-(void)initData{
    defaults = [NSUserDefaults standardUserDefaults];
}

-(void)setPhoneNumber:(NSString *)number{
    [defaults setObject:@"PhoneNumber" forKey:number];
}

-(NSString*)PhoneNumber{
    return [defaults objectForKey:@"PhoneNumber"];
}

-(void)setCity:(NSString *)City{
    [defaults setObject:@"City" forKey:City];
}
-(NSString*)City{
    return [defaults objectForKey:@"City"];
}

-(void)setAccount:(NSString *)Account{
    [defaults setObject:@"Account" forKey:Account];
}
-(NSString*)Account{
    return [defaults objectForKey:@"Account"];
}
@end



