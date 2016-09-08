//
//  SFFocusTableViewController.m
//  SF_Inke
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFFocusTableViewController.h"
#import "SFLiveCell.h"
#import "SFPlayerViewController.h"


@interface SFFocusTableViewController ()

/**数据*/
@property (strong, nonatomic) NSArray *dataArray;

@end

static NSString *ID = @"livecell";


@implementation SFFocusTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    [self loadData];
}

- (void)initUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置内边距
    CGFloat bottom = self.tabBarController.tabBar.sf_height;
    // 控制上面
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, bottom, 0);
    //    // 控制右边指示条
    //    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SFLiveCell" bundle:nil] forCellReuseIdentifier:ID];
}

- (void)loadData {
    
    SFLiveItem *liveItem = [[SFLiveItem alloc] init];
    liveItem.city = @"北京";
    liveItem.onlineUsers = 100;
    liveItem.streamAddr = Live_ShiFei;
    
    SFCreatorItem * createItem = [[SFCreatorItem alloc] init];
    liveItem.creator = createItem;
    
    createItem.nick = @"大欢";
    createItem.portrait = @"dahuan";
    
    self.dataArray = @[liveItem];
    
    [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    SFLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.liveItem = self.dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70 + SCREEN_WIDTH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SFLiveItem *liveItem = self.dataArray[indexPath.row];
    
    SFPlayerViewController *play = [[SFPlayerViewController alloc] init];
    play.liveItem = liveItem;
    
    [self.navigationController pushViewController:play animated:YES];
    
    
    // 系统自带的播放器播放不了
    //    MPMoviePlayerViewController *mp = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:liveItem.streamAddr]];
    //    [self presentViewController:mp animated:YES completion:nil];
    
}


@end
