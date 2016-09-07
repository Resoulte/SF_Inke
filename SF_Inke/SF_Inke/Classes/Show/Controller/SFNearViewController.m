//
//  SFNearViewController.m
//  SF_Inke
//
//  Created by ma c on 16/9/6.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFNearViewController.h"
#import "SFShowHandler.h"
#import "SFNearCell.h"
#import "SFPlayerViewController.h"

#define kMargin 5
#define kItemWidth 100

@interface SFNearViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/**附近的数据*/
@property (strong, nonatomic) NSArray *dataList;
@property (weak, nonatomic) IBOutlet UICollectionView *nearCollectionView;

@end

static NSString * const ID = @"nearcell";
@implementation SFNearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initUI];
    
    [self loadData];
}

- (void)initUI {

    [self.nearCollectionView registerNib:[UINib nibWithNibName:@"SFNearCell" bundle:nil] forCellWithReuseIdentifier:ID];
}

- (void)loadData {

    [SFShowHandler excuteGetShowNearTaskWithSussess:^(id obj) {
        
        self.dataList = obj;
        [self.nearCollectionView reloadData];
        
    } failed:^(id obj) {
        
    }];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    SFNearCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.liveItem = self.dataList[indexPath.row];
    
    return cell;
}

/**控制item大小*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

//    NSInteger count = collectionView.width / kItemWidth;
//    CGFloat itemWidth = (collectionView.width - (count + 1) * kMargain) / count;
//    return CGSizeMake(itemWidth, itemWidth + 20);
//    SFLog(@"count%ld, %f", count, itemWidth);
    NSInteger count = self.nearCollectionView.width / kItemWidth;
    
    CGFloat etraWidth = (self.nearCollectionView.width - kMargin * (count + 1)) / count;
    
    return CGSizeMake(etraWidth, etraWidth + 20);
    
}

/**item显示的时候调用*/
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    SFNearCell *c = (SFNearCell *)cell;
    [c showAnimation];
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    SFLiveItem *liveItem = self.dataList[indexPath.row];
    
    SFPlayerViewController *play = [[SFPlayerViewController alloc] init];
    play.liveItem = liveItem;
    
    [self.navigationController pushViewController:play animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}



@end
