//
//  SFUserHelp.h
//  SF_Inke
//
//  Created by ma c on 16/9/8.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFUserHelp : NSObject

/**用户头像*/
@property (copy, nonatomic) NSString *iconUrl;
/**用户昵称*/
@property (copy, nonatomic) NSString *nickName;

+ (instancetype)sharedUser;

+ (BOOL)isAutoLogin;

+ (void)saveUser;
@end
