//
//  SFLocationManager.h
//  SF_Inke
//
//  Created by ma c on 16/9/6.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LocationBlock)(NSString *lat, NSString *lon);

@interface SFLocationManager : NSObject

- (void)getGPS:(LocationBlock)locationBlock;

+ (instancetype)sharedManager;


/**经度*/
@property (copy, nonatomic) NSString * lat;
/**纬度*/
@property (copy, nonatomic) NSString * lon;
@end
