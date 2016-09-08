//
//  AppDelegate.m
//  SF_Inke
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "AppDelegate.h"
#import "SFTabBarViewController.h"
#import "SFAdvertiseView.h"
#import "AppDelegate+SFUmeng.h"
#import "UMSocial.h"
#import "SFLoginViewController.h"
#import "SFUserHelp.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 初始化友盟
    [self setupUmeng];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIViewController *mainVC = nil;
    if ([SFUserHelp isAutoLogin]) {
        mainVC = [[SFTabBarViewController alloc] init];
    } else {
        mainVC = [[SFLoginViewController alloc] init];
    }
    
    self.window.rootViewController = mainVC;
    
    [self.window makeKeyAndVisible];
    
    SFAdvertiseView *adView = [SFAdvertiseView loadAdvertiseView];
    [self.window addSubview:adView];
    
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}

@end
