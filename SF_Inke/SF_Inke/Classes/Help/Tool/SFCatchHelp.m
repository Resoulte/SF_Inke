//
//  SFCatchHelp.m
//  SF_Inke
//
//  Created by ma c on 16/9/7.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFCatchHelp.h"

@implementation SFCatchHelp

+ (NSString *)getAdvertise {

    return [[NSUserDefaults standardUserDefaults] objectForKey:advertiseImage];
}

+ (void)setAdvertise:(NSString *)adImage {
    
    [[NSUserDefaults standardUserDefaults] setObject:adImage forKey:advertiseImage];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end
