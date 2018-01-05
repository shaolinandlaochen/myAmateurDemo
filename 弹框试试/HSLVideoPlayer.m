//
//  HSLVideoPlayer.m
//  弹框试试
//
//  Created by 123 on 2018/1/3.
//  Copyright © 2018年 123. All rights reserved.
//

#import "HSLVideoPlayer.h"
#import <AVFoundation/AVFoundation.h>
@interface HSLVideoPlayer ()
/**播放器*/
@property (nonatomic, strong) AVPlayer         *player;
/**playerLayer*/
@property (nonatomic, strong) AVPlayerLayer    *playerLayer;
/**播放器item*/
@property (nonatomic, strong) AVPlayerItem     *playerItem;

@end

@implementation HSLVideoPlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    //self.player=[[AVPlayer alloc]init];
    
    
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://bos.nj.bpc.baidu.com/tieba-smallvideo/11772_3c435014fb2dd9a5fd56a57cc369f6a0.mp4"]];
    //添加监听
    [playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    self.player = [AVPlayer playerWithPlayerItem:playerItem];
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    //设置模式
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    playerLayer.contentsScale = [UIScreen mainScreen].scale;
    playerLayer.frame = CGRectMake(0, 100, self.view.bounds.size.width, 200);
    [self.view.layer addSublayer:playerLayer];

    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.player=nil;
    
}
//监听回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    
    if ([keyPath isEqualToString:@"loadedTimeRanges"]){
        
    }else if ([keyPath isEqualToString:@"status"]){
        if (playerItem.status == AVPlayerItemStatusReadyToPlay){
            NSLog(@"playerItem is ready");
            [self.player play];
        } else{
            NSLog(@"load break");
        }
    }
}

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
