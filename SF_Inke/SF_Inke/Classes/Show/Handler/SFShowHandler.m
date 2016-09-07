//
//  SFShowHandler.m
//  SF_Inke
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFShowHandler.h"
#import "SFLiveItem.h"
#import "SFLocationManager.h"
#import "SFAdvertiseItem.h"

@implementation SFShowHandler

+ (void)excuteGetShowHotTaskWithSussess:(SuccessBlock)success failed:(FailedBlock)faile {

    [SFHttpTools getWithPath:API_HotLive params:nil success:^(id json) {
//        SFLog(@"%@", json);
        if ([json[@"dm_error"] integerValue]) {
            faile(json);
        } else {
            // mj_keyValuesArrayWithObjectArray 模型转字典
            NSArray *lives = [SFLiveItem mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(lives);
        }
            
    } failure:^(NSError *error) {
        faile(error);
    } ];
}

+ (void)excuteGetShowNearTaskWithSussess:(SuccessBlock)success failed:(FailedBlock)faile {
    
    SFLocationManager *locationManager = [SFLocationManager sharedManager];
    
    NSDictionary *params = @{
                             @"uid" : @"85149891",
                             @"latitude":@"40.090562",
                             @"longitude":@"116.413353"
                             };
    
    [SFHttpTools getWithPath:API_NearLive params:params success:^(id json) {
        if ([json[@"dm_error"] integerValue]) {
            faile(json);
        } else {
            NSArray *lives = [SFLiveItem mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(lives);
        }
    } failure:^(NSError *error) {
        faile(error);
    }];
}

+ (void)excuteGetAdverdiseTaskWithSussess:(SuccessBlock)success failed:(FailedBlock)faile {

    [SFHttpTools getWithPath:API_Advertise params:nil success:^(id json) {
        if ([json[@"dm_error"] integerValue]) {
            faile(json);
        } else {
            SFAdvertiseItem *adItem = [SFAdvertiseItem mj_objectWithKeyValues:json[@"resources"][0]];
            success(adItem);
        }
    } failure:^(NSError *error) {
        faile(error);
    }];
}
@end
