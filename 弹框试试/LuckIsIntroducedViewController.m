//
//  LuckIsIntroducedViewController.m
//  弹框试试
//
//  Created by 123 on 2017/10/30.
//  Copyright © 2017年 123. All rights reserved.
//

#import "LuckIsIntroducedViewController.h"
#import "ZLSwipeableView.h"
#import "CardView.h"
#import "UIColor+FlatColors.h"
#import "luckView.h"
@interface LuckIsIntroducedViewController ()<ZLSwipeableViewDataSource, ZLSwipeableViewDelegate>

@property (nonatomic) NSUInteger colorIndex;
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong)ZLSwipeableView *swipeableView;
@property(nonatomic,strong)NSArray *imgArray;

@end

@implementation LuckIsIntroducedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorIndex = 0;
    self.colors = @[
                    @"Turquoise",
                    @"Green Sea",
                    @"Emerald",
                    @"Nephritis",
                    @"Peter River",
                    @"Belize Hole",
                    @"Amethyst",
                    @"Wisteria",
                    @"Wet Asphalt",
                    @"Midnight Blue",
                    @"Sun Flower",
                    @"Orange",
                    @"Carrot",
                    @"Pumpkin",
                    @"Alizarin",
                    @"Pomegranate",
                    @"Clouds",
                    @"Silver",
                    @"Concrete",
                    @"Asbestos",
                    ];
    _imgArray=@[@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1256490087,3922751868&fm=27&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2212671164,2670527916&fm=27&gp=0.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1509962109&di=387bcd0096c3e48b2909eb7979ca3342&imgtype=jpg&er=1&src=http%3A%2F%2Fi2.hunantv.com%2Fp1%2F20110928%2F0756537556.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1509367397164&di=1788f27310b5f1c83d854912b3f23a2d&imgtype=jpg&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D3695669839%2C2917919783%26fm%3D214%26gp%3D0.jpg"];
    
    self.swipeableView = [[ZLSwipeableView alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, 400)];
    [self.view addSubview:self.swipeableView];
    
    [self.swipeableView setNeedsLayout];
    [self.swipeableView layoutIfNeeded];
    
    // required data source
    self.swipeableView.dataSource = self;
    
    // optional delegate
    self.swipeableView.delegate = self;

    // Do any additional setup after loading the view.
}




- (IBAction)swipeLeftButtonAction:(UIButton *)sender {
    [self.swipeableView swipeTopViewToLeft];
}
- (IBAction)swipeRightButtonAction:(UIButton *)sender {
    [self.swipeableView swipeTopViewToRight];
}
- (IBAction)reloadButtonAction:(UIButton *)sender {
    self.colorIndex = 0;
    [self.swipeableView discardAllSwipeableViews];
    [self.swipeableView loadNextSwipeableViewsIfNeeded];
}

#pragma mark - ZLSwipeableViewDelegate
- (void)swipeableView: (ZLSwipeableView *)swipeableView didSwipeLeft:(UIView *)view {
    NSLog(@"did swipe left");
}
- (void)swipeableView: (ZLSwipeableView *)swipeableView didSwipeRight:(UIView *)view {
    NSLog(@"did swipe right");
}
- (void)swipeableView: (ZLSwipeableView *)swipeableView swipingView:(UIView *)view atLocation:(CGPoint)location {
    NSLog(@"swiping at location: x %f, y%f", location.x, location.y);
}

#pragma mark - ZLSwipeableViewDataSource
- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {
    if (self.colorIndex<_imgArray.count) {
        luckView *view = [[luckView alloc] initWithFrame:swipeableView.bounds];
        view.backgroundImage.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_imgArray[self.colorIndex]]]];
        self.colorIndex++;
        return view;
    }
    return nil;
}

#pragma mark - ()
- (UIColor *)colorForName:(NSString *)name
{
    NSString *sanitizedName = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *selectorString = [NSString stringWithFormat:@"flat%@Color", sanitizedName];
    Class colorClass = [UIColor class];
    return [colorClass performSelector:NSSelectorFromString(selectorString)];
}





//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
