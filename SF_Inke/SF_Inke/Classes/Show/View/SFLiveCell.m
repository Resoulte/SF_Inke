//
//  SFLiveCell.m
//  SF_Inke
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFLiveCell.h"

@interface SFLiveCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *addressLable;
@property (weak, nonatomic) IBOutlet UILabel *watchLable;
@property (weak, nonatomic) IBOutlet UIImageView *bigImage;

@end

@implementation SFLiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setLiveItem:(SFLiveItem *)liveItem {

    _liveItem = liveItem;
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", IMAGE_HOST, liveItem.creator.portrait]] placeholderImage:[UIImage imageNamed:@"default_room"]];
    self.nameLable.text = liveItem.creator.nick;
    self.addressLable.text = liveItem.city;
    self.watchLable.text = [@(liveItem.onlineUsers) stringValue];
    [self.bigImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", IMAGE_HOST, liveItem.creator.portrait]] placeholderImage:[UIImage imageNamed:@"default_room"]];
    
}

@end
