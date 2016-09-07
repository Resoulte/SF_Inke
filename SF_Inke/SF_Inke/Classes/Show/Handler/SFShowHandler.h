//
//  SFShowHandler.h
//  SF_Inke
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFBaseHandler.h"

@interface SFShowHandler : SFBaseHandler

/**获取热门的网络请求*/
+ (void)excuteGetShowHotTaskWithSussess:(SuccessBlock)success failed:(FailedBlock)faile;

/**获取附近的网络请求*/
+ (void)excuteGetShowNearTaskWithSussess:(SuccessBlock)success failed:(FailedBlock)faile;
@end
