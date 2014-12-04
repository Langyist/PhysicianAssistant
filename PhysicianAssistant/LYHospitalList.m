//
//  LYHospitalList.m
//  PhysicianAssistant
//  医院列表
//  Created by langyi on 14/12/2.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "LYHospitalList.h"
#import "StoreOnlineNetworkEngine.h"

@interface LYHospitalList () {
    UISearchBar *searchBar;
    NSMutableArray* _HospitalList;
    NSDictionary* _HospitalDic;
}

@end

@implementation LYHospitalList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 40)];
    self.tableView.tableHeaderView = searchBar;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIView *view = [[UIView alloc] init];
    self.tableView.tableFooterView = view;
    
    self.tableView.backgroundColor = [UIColor grayColor];
    
    [self GetData];
}
- (IBAction)SelectCityButton:(id)sender {
    [self performSegueWithIdentifier:@"GoselectCity" sender:self];
}
//定位
- (IBAction)locationBarButton:(UIBarButtonItem *)sender {
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _HospitalList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hospitalCell" forIndexPath:indexPath];
    
    _HospitalDic = [_HospitalList objectAtIndex:indexPath.row];
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel = (UILabel *)[cell viewWithTag:1];
    nameLabel.text = [_HospitalDic objectForKey:@"HName"];
    
    UILabel *addressLabel = [[UILabel alloc] init];
    addressLabel = (UILabel*)[cell viewWithTag:4];
    addressLabel.text = [_HospitalDic objectForKey:@"HAddress"];
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"GoLoginVC" sender:self];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == self.tableView) {
        [searchBar resignFirstResponder];
    }
}

-(void)GetData{
    //      HName       医院名称
    //      CityName    城市名称
    //      HCity       城市ID
    //      PageSize
    //      PageIndex
    NSDictionary *dic = @{@"act" :@"list",
                          @"CityName": @"成都",
                          @"PageSize": @"10",
                          @"PageIndex": @"1"};
    
    [[StoreOnlineNetworkEngine shareInstance] startNetWorkWithPath:@"hospital/hospital.ashx"
                                                            params:dic
                                                            repeat:YES
                                                             isGet:YES
                                                       resultBlock:^(BOOL bValidJSON, NSString *errorMsg, id result) {
                                                           if(!bValidJSON)
                                                           {
                                                               UIAlertView * mslaView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"" delegate:errorMsg cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                                                               [mslaView show];
                                                           }else
                                                           {
                                                               _HospitalList =result;
                                                               [self.tableView reloadData];
                                                           }}];
}
@end






