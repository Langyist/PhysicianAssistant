//
//  LYHospitalList.m
//  PhysicianAssistant
//  医院列表
//  Created by langyi on 14/12/2.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "LYHospitalList.h"

@interface LYHospitalList ()

@end

@implementation LYHospitalList

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)SelectCityButton:(id)sender {
    [self performSegueWithIdentifier:@"GoselectCity" sender:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hospitalCell" forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"GoLoginVC" sender:self];
}

@end
