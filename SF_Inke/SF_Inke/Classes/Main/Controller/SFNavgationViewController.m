//
//  SFNavgationViewController.m
//  SF_Inke
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFNavgationViewController.h"

@interface SFNavgationViewController ()

@end

@implementation SFNavgationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.tintColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"global_tittle_bg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.barTintColor = RGB(36, 215, 200);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;

    }
    
    [super pushViewController:viewController animated:animated];
}

@end
