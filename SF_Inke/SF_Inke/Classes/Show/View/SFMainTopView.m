//
//  SFMainTopView.m
//  SF_Inke
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFMainTopView.h"

@interface SFMainTopView ()

/**button数组*/
@property (strong, nonatomic) NSMutableArray *btnArray;
/**线*/
@property (strong, nonatomic) UIView *lineView;

@end

@implementation SFMainTopView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        CGFloat y = 0;
        CGFloat w = self.sf_width / titles.count;
        CGFloat h = self.sf_height;
        
        for (NSInteger i = 0; i < titles.count; i ++) {
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            titleBtn.tag = i;
            [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
            [titleBtn.titleLabel sizeToFit];
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titleBtn.frame = CGRectMake(i * w, y, w, h);
            [titleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:titleBtn];
            
            if (i == 1) {
                UIView *lineView = [[UIView alloc] init];
                self.lineView = lineView;
                lineView.backgroundColor = [UIColor whiteColor];
                lineView.centerX = titleBtn.titleLabel.centerX;
                lineView.height = 2;
                lineView.sf_y = 40;
                lineView.width = titleBtn.titleLabel.width;
                
                [self addSubview:lineView];
              
            }
            
            [self.btnArray addObject:titleBtn];
        }
    }
    return self;
}

- (void)btnClick:(UIButton *)btn {

    if (_returnBtnTagBlock) {
        _returnBtnTagBlock(btn.tag);
    }
    
}

- (void)scrollBegain:(NSInteger)btnTag {

    UIButton *btn = self.btnArray[btnTag];
    
    [UIView animateWithDuration:0.25 animations:^{
       
        self.lineView.centerX = btn.centerX;
    }];
}


#pragma mark - setter and getter
- (NSMutableArray *)btnArray {

    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    
    return _btnArray;
}

@end
