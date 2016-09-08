//
//  AppDelegate+SFUmeng.m
//  SF_Inke
//
//  Created by ma c on 16/9/8.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "AppDelegate+SFUmeng.h"
#import "UMSocial.h"
#import "UMSocialSinaSSOHandler.h"

@implementation AppDelegate (SFUmeng)

- (void)setupUmeng {

    //设置umengkey
    [UMSocialData setAppKey:@"57a5581267e58e2557001639"];
    
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"2904714091"
                                              secret:@"7849eb7a9922c4318b1a0cff9a215ff3"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
}

@end
