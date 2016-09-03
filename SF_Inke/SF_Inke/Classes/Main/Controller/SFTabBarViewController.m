//
//  SFTabBarViewController.m
//  SF_Inke
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFTabBarViewController.h"
#import "SFNavgationViewController.h"
#import "SFLaunchViewController.h"
#import "SFTabBar.h"

@interface SFTabBarViewController () <SFTabBarDelegate>

/**自定义tabBar*/
@property (strong, nonatomic) SFTabBar *sfTabBar;

@end

@implementation SFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
}


- (void)initUI {

    // 自定义tabbar
    // 1.加载控制器
    [self configerViewControllers];
    
    // 2. 加载tabbar
    [self.tabBar addSubview:self.sfTabBar];
    
    // 消除tabbar的阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/**加载控制器*/
- (void)configerViewControllers {
    
    NSMutableArray *viewControllerNames = [NSMutableArray arrayWithArray:@[@"SFMainViewController", @"SFMeViewController"]];
    
    for (NSUInteger i = 0; i < viewControllerNames.count; i ++) {
        NSString *controllerName = viewControllerNames[i];
        UIViewController *vc = [[NSClassFromString(controllerName) alloc]init];
        SFNavgationViewController *nav = [[SFNavgationViewController alloc] initWithRootViewController:vc];
        
        [viewControllerNames replaceObjectAtIndex:i withObject:nav];
    }
    
    self.viewControllers = viewControllerNames;
    
}

#pragma mark - SFTabBarDelegate
- (void)tabBar:(SFTabBar *)tabBar clickIndex:(SFItemType)index {

    if (index != SFItemTypeLaunch) {
        // 当前tabbar的索引
        self.selectedIndex = index - SFItemTypeLive;
        return ;
    }
    
    SFLaunchViewController *launch = [[SFLaunchViewController alloc] init];
    [self presentViewController:launch animated:YES completion:nil];
    
    
}


#pragma mark - setter and getter 
- (SFTabBar *)sfTabBar {
    if (!_sfTabBar) {
        _sfTabBar = [[SFTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _sfTabBar.delegate = self;
    }
    return _sfTabBar;
}

@end
