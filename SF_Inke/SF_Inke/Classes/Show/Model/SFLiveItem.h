//
//  SFLiveItem.h
//  SF_Inke
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFCreatorItem.h"

@interface SFLiveItem : NSObject

@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) SFCreatorItem * creator;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * ID;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, assign) NSInteger version;

/**距离*/
@property (copy, nonatomic) NSString * distance;

@property (nonatomic, getter=isShow) BOOL show;

@end
