//
//  SFAdvertiseView.m
//  SF_Inke
//
//  Created by ma c on 16/9/7.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFAdvertiseView.h"
#import "SFShowHandler.h"
#import "SFAdvertiseItem.h"
#import "SDWebImageManager.h"
#import "SFCatchHelp.h"

static NSInteger showTime = 3;
@interface SFAdvertiseView ()
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;

@property (weak, nonatomic) IBOutlet UILabel *timeLable;

/**时间计时器*/
@property (strong, nonatomic) dispatch_source_t timer;

@end

@implementation SFAdvertiseView

+ (instancetype)loadAdvertiseView {

    return [[[NSBundle mainBundle] loadNibNamed:@"SFAdvertiseView" owner:self options:nil] lastObject];
}

// 广告页初始化
- (void)awakeFromNib {
    
    self.frame = [UIScreen mainScreen].bounds;

    // 展示广告
    [self showAd];
    
    // 下载广告
    [self downAd];
    
    // 倒计时
    [self startTimer];
}

- (void)showAd {
    
    NSString *fileName = [SFCatchHelp getAdvertise];
    NSString *filePath = [NSString stringWithFormat:@"%@%@", IMAGE_HOST, fileName];
    UIImage *lastImageCatch = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:filePath];
    if (lastImageCatch) {
        self.adImageView.image = lastImageCatch;
    } else {
        self.hidden = YES;
    }

}

- (void)downAd {
    
    // 获取最新广告数据
    [SFShowHandler excuteGetAdverdiseTaskWithSussess:^(id obj) {
        SFAdvertiseItem *adItem = obj;

        NSURL *imageUrl = [NSURL URLWithString:  [NSString stringWithFormat:@"%@%@", IMAGE_HOST, adItem.image]];

        // SDWebImageAvoidAutoSetImage 下载完后不给imageView赋值
        [[SDWebImageManager sharedManager] downloadImageWithURL:imageUrl options:SDWebImageAvoidAutoSetImage progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            
            [SFCatchHelp setAdvertise:adItem.image];
            SFLog(@"图片下载成功");
        }];
        
    } failed:^(id obj) {
        
    }];
}

- (void)startTimer {
    
    __block NSUInteger timeout = showTime + 1;
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    self.timer = timer;
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, timeout * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (timeout <= 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismiss];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.timeLable.text = [NSString stringWithFormat:@"跳过 %ld", timeout];
            });
        }
        
        timeout --;
    });
    dispatch_resume(timer);
}

- (void)dismiss {

    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.f;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
