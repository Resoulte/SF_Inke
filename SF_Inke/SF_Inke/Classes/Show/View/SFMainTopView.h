//
//  SFMainTopView.h
//  SF_Inke
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFMainTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

// 滚动时调用
- (void)scrollBegain:(NSInteger)btnTag;

/**返回点击那个btn的block*/
@property (copy, nonatomic) void(^returnBtnTagBlock)(NSInteger btnTag);

@end
