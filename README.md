# EasyCarouselView
===
OC版轮播广告、图片视图，带指示器视图。

# Features
- 支持图片和指示器
- 使用非系统的自定制指示器
- 可调整指示器当前和正常各状态下的色值

# Installation

### CocoaPods

```
pod 'EasyCarouselView'
```

### Old-fashioned way

- 下载github项目到本地 
- 添加Libs文件夹到自己的工程中
- 添加依赖第三方库Masonry、SDWebImage

# Usage

### 使用demo

```
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


```

### 有疑问可参考Demo

# License

EasyCarouselView is licensed under the terms of the MIT License. Please see the [LICENSE](LICENSE) file for full details.

If this code was helpful, I would love to hear from you.
