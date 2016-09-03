//
//  SFShowHandler.m
//  SF_Inke
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFShowHandler.h"
#import "SFLiveItem.h"

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

@end
