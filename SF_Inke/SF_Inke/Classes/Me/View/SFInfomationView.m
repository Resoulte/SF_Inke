//
//  SFInfomationView.m
//  SF_Inke
//
//  Created by ma c on 16/9/7.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFInfomationView.h"
#import "SFUserHelp.h"

@interface SFInfomationView ()

@property (weak, nonatomic) IBOutlet UIButton *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nickName;


@end


@implementation SFInfomationView


+ (instancetype)loadinfomationView {

    return [[[NSBundle mainBundle] loadNibNamed:@"SFInfomationView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {

    [self.iconImage setBackgroundImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[SFUserHelp sharedUser].iconUrl]]] forState:UIControlStateNormal];
    self.nickName.text = [SFUserHelp sharedUser].nickName;
//    SFLog(@"iconuSER:%@", [SFUserHelp sharedUser].iconUrl);
}
@end
