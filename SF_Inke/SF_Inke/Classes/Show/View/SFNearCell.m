//
//  SFNearCell.m
//  SF_Inke
//
//  Created by ma c on 16/9/6.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFNearCell.h"

@interface SFNearCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *distanceLable;


@end

@implementation SFNearCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setLiveItem:(SFLiveItem *)liveItem {
    _liveItem = liveItem;
    [self.iconImage downloadImage:[NSString stringWithFormat:@"%@%@", IMAGE_HOST, liveItem.creator.portrait] placeholder:@"default_room"];
    self.distanceLable.text = liveItem.distance;
}

- (void)showAnimation {

    if (self.liveItem.isShow) {
        return;
    }
    
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    [UIView animateWithDuration:0.25 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
        self.liveItem.show = YES;
    }];
}

@end
