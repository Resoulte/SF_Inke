//
//  SFLiveCell.h
//  SF_Inke
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFLiveItem.h"


@interface SFLiveCell : UITableViewCell

/**live模型*/
@property (strong, nonatomic) SFLiveItem *liveItem;

@end
