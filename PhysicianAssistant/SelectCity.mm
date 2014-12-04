//
//  SelectCity.m
//  PhysicianAssistant
//  选择城市
//  Created by langyi on 14/12/2.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "SelectCity.h"
#import "StoreOnlineNetworkEngine.h"

@interface SelectCity (){
    
    NSDictionary * _Section;
    NSMutableArray * _CellList;
    NSDictionary * _CellInfor;
    NSInteger index;
}
@end

@implementation SelectCity

@synthesize Title;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* view = [[UIView alloc] init];
    self.tableView.tableFooterView = view;
    
    UISearchBar *search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 40)];
    self.tableView.tableHeaderView = search;
    
    [self GetData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _Cities.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    _Section =[_Cities objectAtIndex:section];
    _CellList = [_Section objectForKey:@"Items"];
    return _CellList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"selectCityCell" forIndexPath:indexPath];
    _Section =[_Cities objectAtIndex:indexPath.section];
    _CellList = [_Section objectForKey:@"Items"];
    _CellInfor = [_CellList objectAtIndex:indexPath.row];
    cell.textLabel.text =[_CellInfor objectForKey:@"Name"];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    _Section =[_Cities objectAtIndex:section];
    return [_Section objectForKey:@"CityPy"];
}

-(void)GetData{
    NSDictionary *dic = @{@"act" :@"citylist"};
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
                                                               _Cities =result;
                                                               [self.tableView reloadData];
                                                           }}];
}
@end
