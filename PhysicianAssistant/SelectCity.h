//
//  SelectCity.h
//  PhysicianAssistant
//  选择城市
//  Created by langyi on 14/12/2.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectCity : UITableViewController
{
    NSMutableArray * _Cities;
}

@property (nonatomic,retain) UIButton* TitleButton;
@property (nonatomic, retain) NSString* Title;


@end
