//
//  SFMeViewController.m
//  SF_Inke
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFMeViewController.h"
#import "SFInfomationView.h"
#import "SFSettingItem.h"

@interface SFMeViewController ()

/**我的详细信息*/
@property (strong, nonatomic) SFInfomationView *infomationView;

/**数据源*/
@property (strong, nonatomic) NSMutableArray *dataList;

@end

@implementation SFMeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = RGB(2, 255, 254);
    
    [self initUI];
    
    [self loadData];
    
}

- (void)initUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.sectionFooterHeight = 5;
    self.tableView.rowHeight = 60;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
}

- (void)loadData {
    
    SFSettingItem * set1 = [[SFSettingItem alloc] init];
    set1.title = @"映客贡献榜";
    set1.subtitle = @"";
    set1.vcName = @"";
    
    SFSettingItem * set2 = [[SFSettingItem alloc] init];
    set2.title = @"收益";
    set2.subtitle = @"0映票";
    set2.vcName = @"";
    
    SFSettingItem * set3 = [[SFSettingItem alloc] init];
    set3.title = @"账户";
    set3.subtitle = @"0钻石";
    set3.vcName = @"";
    
    SFSettingItem * set4 = [[SFSettingItem alloc] init];
    set4.title = @"等级";
    set4.subtitle = @"3级";
    set4.vcName = @"";
    
    SFSettingItem * set5 = [[SFSettingItem alloc] init];
    set5.title = @"实名认证";
    set5.subtitle = @"";
    set5.vcName = @"";
    
    SFSettingItem * set6 = [[SFSettingItem alloc] init];
    set6.title = @"设置";
    set6.subtitle = @"";
    set6.vcName = @"";
    
    NSArray *array1 = @[set1, set2, set3];
    NSArray *array2 = @[set4, set5];
    NSArray *array3 = @[set6];
    [self.dataList addObjectsFromArray:@[array1, array2, array3]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *array = self.dataList[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    SFSettingItem *settingItem = self.dataList[indexPath
                                               .section][indexPath.row];
    cell.textLabel.text = settingItem.title;
    cell.textLabel.textColor = [UIColor grayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];

    cell.detailTextLabel.text = settingItem.subtitle;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    if (section == 0) {
        return self.infomationView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    if (section == 0) {
        return SCREEN_HEIGHT / 2;
    }
    return 0.1;
}

#pragma mark - setter and getter
- (SFInfomationView *)infomationView {

    if (!_infomationView) {
        _infomationView = [SFInfomationView loadinfomationView];
        _infomationView.frame = CGRectMake(0, 0, 0, SCREEN_HEIGHT * 0.3);
    }
    return _infomationView;
}

- (NSMutableArray *)dataList {

    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    
    return _dataList;
}
@end
