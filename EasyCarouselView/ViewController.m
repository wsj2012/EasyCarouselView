//
//  ViewController.m
//  EasyCarouselView
//
//  Created by 王树军 on 2019/1/2.
//  Copyright © 2019 王树军. All rights reserved.
//

#import "ViewController.h"
#import "EasyCarouselView.h"

@interface ViewController () <EasyCarouselViewDelegate>

@property (nonnull, strong) EasyCarouselView *carouselView;
@property (nonatomic, strong) NSMutableArray *modelArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self mockData];
    
    UIImage *image = [UIImage imageNamed:@"home_banner"];
    self.carouselView = [[EasyCarouselView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    self.carouselView.center = self.view.center;
    self.carouselView.backgroundColor = [UIColor whiteColor];
    self.carouselView.delegate = self;
    self.carouselView.pageView.pageControl.pageIndicatorTintColor = [UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1];
    self.carouselView.pageView.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1];
    self.carouselView.pageView.autoScrollInterval = 1;
    self.carouselView.layer.cornerRadius = 4.0f;
    self.carouselView.models = self.modelArr;
    [self.view addSubview:self.carouselView];
}

- (void)mockData {
    self.modelArr = [NSMutableArray array];
    {
        EasyCarouselModel *model = [[EasyCarouselModel alloc] init];
        model.imageUrl = @"http://pajk-adps-static-stg.yztcdn.com:41080/plugin/phpkLQpoG_5bd0133b4b12d.png";
        model.href = @"https://www.baidu.com";
        [self.modelArr addObject:model];
    }
    
    {
        EasyCarouselModel *model = [[EasyCarouselModel alloc] init];
        model.imageUrl = @"http://pajk-adps-static-stg.yztcdn.com:41080/plugin/phpkLQpoG_5bd0133b4b12d.png";
        model.href = @"https://www.baidu.com";
        [self.modelArr addObject:model];
    }
    
    {
        EasyCarouselModel *model = [[EasyCarouselModel alloc] init];
        model.imageUrl = @"http://pajk-adps-static-stg.yztcdn.com:41080/plugin/phpkLQpoG_5bd0133b4b12d.png";
        model.href = @"https://www.baidu.com";
        [self.modelArr addObject:model];
    }
    
    {
        EasyCarouselModel *model = [[EasyCarouselModel alloc] init];
        model.imageUrl = @"http://pajk-adps-static-stg.yztcdn.com:41080/plugin/phpkLQpoG_5bd0133b4b12d.png";
        model.href = @"https://www.baidu.com";
        [self.modelArr addObject:model];
    }
}

#pragma mark - EasyCarouselViewDelegate

- (void)carouselView:(EasyCarouselView *)carouselView didSelectItemAtIndex:(NSInteger)index {
    EasyCarouselModel *model = carouselView.models[index];
    NSLog(@"href is %@", model.href);
}

@end
