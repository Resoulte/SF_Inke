//
//  SFTabBar.h
//  SF_Inke
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SFItemType) {
    SFItemTypeLaunch = 10,
    SFItemTypeLive = 100,
    SFItemTypeMe,
};
@class SFTabBar;
@protocol SFTabBarDelegate <NSObject>

- (void)tabBar:(SFTabBar *)tabBar clickIndex:(SFItemType)index;

@end

@interface SFTabBar : UIView

/**点击itemBtn传给控制器index的代理方法*/
@property (weak, nonatomic) id<SFTabBarDelegate> delegate;

/**点击itemBtn传给控制器index的block方法*/
@property (copy, nonatomic) void(^cliclItemBtnBlock)(SFTabBar *tabBar, SFItemType index);
@end
