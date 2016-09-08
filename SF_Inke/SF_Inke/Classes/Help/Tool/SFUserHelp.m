//
//  SFUserHelp.m
//  SF_Inke
//
//  Created by ma c on 16/9/8.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFUserHelp.h"

@implementation SFUserHelp

+ (instancetype)sharedUser {

    static SFUserHelp *_user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _user = [[SFUserHelp alloc ]init];
    });
    
    return _user;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _iconUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconUrl"];
        _nickName = [[NSUserDefaults standardUserDefaults] objectForKey:@"nickName"];
    }
    return self;
}

+ (BOOL)isAutoLogin {

    if ([SFUserHelp sharedUser].nickName.length == 0) {
        return NO;
    }
    return YES;
}

+ (void)saveUser {
    
    SFUserHelp *user = [SFUserHelp sharedUser];
    if (user.nickName.length != 0) {
        [[NSUserDefaults standardUserDefaults] setObject:user.nickName forKey:@"nickName"];
        [[NSUserDefaults standardUserDefaults] setObject:user.iconUrl forKey:@"iconUrl"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
