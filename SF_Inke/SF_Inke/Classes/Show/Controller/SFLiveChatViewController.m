//
//  SFLiveChatViewController.m
//  SF_Inke
//
//  Created by ma c on 16/9/5.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFLiveChatViewController.h"

@interface SFLiveChatViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *peoplecountLable;

@end

@implementation SFLiveChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.iconImageView.layer.cornerRadius = 15;
    self.iconImageView.layer.masksToBounds = YES;
    
    [NSTimer scheduledTimerWithTimeInterval:0.25 block:^(NSTimer * _Nonnull timer) {
        self.peoplecountLable.text = [NSString stringWithFormat:@"%u人", arc4random_uniform(10000)];
    } repeats:YES];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter and getter
- (void)setLiveItem:(SFLiveItem *)liveItem {
    _liveItem = liveItem;
    [self.iconImageView downloadImage:[NSString stringWithFormat:@"%@%@", IMAGE_HOST, liveItem.creator.portrait] placeholder:@"default_room"];
}



@end
