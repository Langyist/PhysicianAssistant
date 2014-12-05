//
//  LYHospitalList.m
//  PhysicianAssistant
//  医院列表
//  Created by langyi on 14/12/2.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "LYHospitalList.h"
#import "StoreOnlineNetworkEngine.h"
#import "BMKLocationService.h"
#import "SelectCity.h"
#import "CommonDefine.h"


@interface LYHospitalList ()<BMKLocationServiceDelegate>{
    UISearchBar *searchBar;
    NSMutableArray* _HospitalList;
    NSDictionary* _HospitalDic;
    BMKLocationService* _locService;
}
@property (weak, nonatomic) IBOutlet UIButton *titleBar;

@end

@implementation LYHospitalList

@synthesize Title;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.titleBar.frame.size.width, self.titleBar.frame.size.height - 20, 15, 15)];
    imageView.image = [UIImage imageNamed:@"down_dark0"];
    [self.titleBar addSubview:imageView];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 40)];
    self.tableView.tableHeaderView = searchBar;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIView *view = [[UIView alloc] init];
    self.tableView.tableFooterView = view;
    
    self.tableView.backgroundColor = [UIColor grayColor];

}
- (IBAction)SelectCityButton:(id)sender {
    [self performSegueWithIdentifier:@"GoselectCity" sender:self];
}

-(void)viewDidAppear:(BOOL)animated
{
    id city = [[NSUserDefaults standardUserDefaults] objectForKey:kLocalChoosCity];
    if (city == nil) {
        //初始化BMKLocationService
        _locService = [[BMKLocationService alloc]init];
        _locService.delegate = self;
        //启动LocationService
        [_locService startUserLocationService];
    }else{
        [self GetData:city];
    }
}

-(void)UpdateUI{
    id city = [[NSUserDefaults standardUserDefaults] objectForKey:kLocalChoosCity];
    [self.tabBarItem setTitle:city];
    [self.tableView reloadData];
}



#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"GoselectCity"])
    {
        SelectCity *detailViewController = (SelectCity*) segue.destinationViewController;
        detailViewController.Title = self.Title;
//        [detailViewController->TitleButton setTitle:[m_selectCityInfo objectForKey:@"name"]  forState:UIControlStateNormal];
    }
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

-(void)GetData:(NSString*)cityName{
    //      HName       医院名称
    //      CityName    城市名称
    //      HCity       城市ID
    //      PageSize
    //      PageIndex
    NSDictionary *dic = @{@"act" :@"list",
                          @"CityName": cityName,
                          @"PageSize": @"10",
                          @"PageIndex": @"1"};
    
    [[StoreOnlineNetworkEngine shareInstance] startNetWorkWithPath:kUrlCityList
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
                                                               [self UpdateUI];
                                                           }}];
}

//实现相关delegate 处理位置信息更新
//处理方向变更信息
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    //    NSLog(@"heading is %@",userLocation.heading);
}

//处理位置坐标更新
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"!latitude!!!  %f",userLocation.location.coordinate.latitude);//获取经度
    NSLog(@"!longtitude!!!  %f",userLocation.location.coordinate.longitude);//获取纬度
    
    CLGeocoder *Geocoder=[[CLGeocoder alloc]init];//CLGeocoder用法参加之前博客
    CLGeocodeCompletionHandler handler = ^(NSArray *place, NSError *error) {
        
        for (CLPlacemark *placemark in place) {
            NSString* cityStr=placemark.thoroughfare;
            NSString* cityName=placemark.locality;
            NSLog(@"city %@",cityStr);//获取街道地址
            NSLog(@"cityName %@",cityName);//获取城市名
            
            //如果已经有数据不用再定位获取数据
            if (_HospitalList.count > 0) {
                break;
            }
            //保证通信有效
            if(cityName.length-1 > 0){
                //服务器不能识别带“市”的标示
                cityName = [cityName substringToIndex:cityName.length-1];
                [[NSUserDefaults standardUserDefaults] setObject:cityName forKey:kLocalChoosCity];
                [self GetData:cityName];
                //结束定位
                [_locService stopUserLocationService];
            }
            break;
        }
        
    };
    
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:userLocation.location.coordinate.latitude longitude:userLocation.location.coordinate.longitude];
    [Geocoder reverseGeocodeLocation:loc completionHandler:handler];
}
@end






