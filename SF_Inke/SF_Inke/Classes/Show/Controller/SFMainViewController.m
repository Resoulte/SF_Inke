//
//  SFMainViewController.m
//  SF_Inke
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFMainViewController.h"
#import "SFFocusTableViewController.h"
#import "SFHotTableViewController.h"
#import "SFNearViewController.h"
#import "SFMainTopView.h"

@interface SFMainViewController () <UIScrollViewDelegate>

/**titile数据*/
@property (strong, nonatomic) NSArray *titlesArray;
/**标题view*/
@property (strong, nonatomic) SFMainTopView *topView;
/**scrollView*/
@property (strong, nonatomic) UIScrollView *contentScrollView;

@end

@implementation SFMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupAllChildViewController];
    
    [self setupContentScrollView];
}

- (void)setupNav {
    
    self.navigationItem.titleView = self.topView;

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStylePlain target:self action:@selector(message)];
}

- (void)search {
    SFLog(@"搜索");
}

- (void)message {
    SFLog(@"消息");
}

- (void)setupAllChildViewController {

    SFFocusTableViewController *focus = [[SFFocusTableViewController alloc] init];
    [self addChildViewController:focus];
    
    SFHotTableViewController *hot = [[SFHotTableViewController alloc] init];
    [self addChildViewController:hot];
    
    SFNearViewController *near = [[SFNearViewController alloc] init];
    [self addChildViewController:near];
}

- (void)setupContentScrollView {

    
    
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    self.contentScrollView = contentScrollView;
    contentScrollView.frame = self.view.bounds;
    contentScrollView.delegate = self;
    contentScrollView.pagingEnabled = YES;
    contentScrollView.contentSize = CGSizeMake(contentScrollView.sf_width * self.childViewControllers.count, 0);
    
    [self.view addSubview:contentScrollView];
    
    // 默认进入第二个界面
    contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    [self scrollViewDidEndScrollingAnimation:contentScrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {

    NSInteger index = scrollView.contentOffset.x / scrollView.sf_width;
    
    [self.topView scrollBegain:index];
    
    UIViewController *vc = self.childViewControllers[index];
    vc.view.sf_x = scrollView.contentOffset.x;
    vc.view.sf_y = 0;
    vc.view.sf_height = SCREEN_HEIGHT - 69;
    [scrollView addSubview:vc.view];
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter and getter
- (NSArray *)titlesArray {

    if (!_titlesArray) {
        _titlesArray = @[@"关注", @"热门", @"附近"];
    }
    
    return _titlesArray;
}

- (SFMainTopView *)topView {

    if (!_topView) {
        _topView = [[SFMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 50) titles:self.titlesArray];
        @weakify(self);
        _topView.returnBtnTagBlock = ^ (NSInteger btnTag) {
            @strongify(self);
            
            CGPoint offset = self.contentScrollView.contentOffset;
            offset.x = btnTag * self.contentScrollView.sf_width;
            
            [self.contentScrollView setContentOffset:offset animated:YES];
        };
    }
    
    return _topView;
    
}
@end
