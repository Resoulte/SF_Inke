//
//  SFNearCell.h
//  SF_Inke
//
//  Created by ma c on 16/9/6.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFLiveItem.h"

@interface SFNearCell : UICollectionViewCell

/**live模型*/
@property (strong, nonatomic) SFLiveItem *liveItem;

- (void)showAnimation;
@end
