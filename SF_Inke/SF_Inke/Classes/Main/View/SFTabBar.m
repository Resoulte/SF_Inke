//
//  SFTabBar.m
//  SF_Inke
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFTabBar.h"

@interface SFTabBar ()

/**tabBar背景*/
@property (strong, nonatomic) UIImageView *tabBarbgImage;
/**中间的按钮*/
@property (strong, nonatomic) UIButton *cameraBtn;
/**item数组*/
@property (strong, nonatomic) NSArray *itemArray;
/**记录上一个itemBtn*/
@property (strong, nonatomic) UIButton *lastItemBtn;

@end

@implementation SFTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.tabBarbgImage];
        
        // 加载item
        for (NSInteger i = 0; i < self.itemArray.count; i ++) {
            UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [itemBtn setImage:[UIImage imageNamed:_itemArray[i]] forState:UIControlStateNormal];
            [itemBtn setImage:[UIImage imageNamed:[_itemArray[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            [itemBtn addTarget:self action:@selector(itemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            // 不让图片高亮状态下子显示
            itemBtn.adjustsImageWhenHighlighted = NO;
            
            [self addSubview:itemBtn];
            
            itemBtn.tag = SFItemTypeLive + i;
            
            if (i == 0) {
                itemBtn.selected = YES;
                _lastItemBtn = itemBtn;
            }
        }
        [self addSubview:self.cameraBtn];
    }
    return self;
}

/**item点击事件*/
- (void)itemBtnClick:(UIButton *)itemBtn {
    
    if ([self.delegate respondsToSelector:@selector(tabBar:clickIndex:)]) {
        [self.delegate tabBar:self clickIndex:itemBtn.tag];
    }
    
    if (_cliclItemBtnBlock) {
        _cliclItemBtnBlock(self, itemBtn.tag);
    }
    
    if (itemBtn.tag == SFItemTypeLaunch) return;
    

    _lastItemBtn.selected = NO;
    itemBtn.selected = YES;
    _lastItemBtn = itemBtn;
    
    // 设置选中的时候scale变大的动画
    [UIView animateWithDuration:0.25 animations:^{
        itemBtn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }completion:^(BOOL finished) {
       [UIView animateWithDuration:0.25 animations:^{
           itemBtn.transform = CGAffineTransformIdentity;
       }];
    }];
}

/**控件布局*/
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat itemW = SCREEN_WIDTH / _itemArray.count;
    for (UIView *btn in self.subviews) {
        if (btn.tag >= SFItemTypeLive) {
            btn.frame = CGRectMake((btn.tag - SFItemTypeLive) * itemW, 0, itemW, self.height);
        }
    }
    
    self.tabBarbgImage.frame = self.frame;
    self.cameraBtn.center = CGPointMake(self.width * 0.5, self.height * 0.5 - 20);
    
}

#pragma mark - setter and getter
- (UIImageView *)tabBarbgImage {

    if (!_tabBarbgImage) {
        _tabBarbgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    
    return _tabBarbgImage;
}

- (NSArray *)itemArray {

    if (!_itemArray) {
        _itemArray = @[@"tab_live", @"tab_me"];
    }
    return _itemArray;
}

- (UIButton *)cameraBtn {

    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraBtn sizeToFit];
        
        [_cameraBtn addTarget:self action:@selector(itemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _cameraBtn.tag = SFItemTypeLaunch;
    }
    return _cameraBtn;
}

@end
