//
//  VideoListViewController.m
//  弹框试试
//
//  Created by 123 on 2017/11/1.
//  Copyright © 2017年 123. All rights reserved.
//

#import "VideoListViewController.h"
#import "XLVideoPlayer.h"
#import "XLVideoItem.h"
#import "XLVideoCell.h"
#define videoListUrl @"http://c.3g.163.com/nc/video/list/VAP4BFR16/y/0-10.html"
@interface VideoListViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{

    UITableView *_tableView;
    NSIndexPath *_indexPath;
    XLVideoPlayer *_player;
    CGRect _currentPlayCellRect;
}
@property (nonatomic, strong) NSMutableArray *videoArray;
@end

@implementation VideoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor=[UIColor whiteColor];
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    _tableView.estimatedRowHeight = 100;
    
    [self fetchVideoListData];
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.videoArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XLVideoCell *cell = [XLVideoCell videoCellWithTableView:tableView];
    XLVideoItem *item = self.videoArray[indexPath.row];
    cell.videoItem = item;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showVideoPlayer:)];
    [cell.videoImageView addGestureRecognizer:tap];
    cell.videoImageView.tag = indexPath.row + 100;
    return cell;
}
- (XLVideoPlayer *)player {
    if (!_player) {
        _player = [[XLVideoPlayer alloc] init];
        _player.frame = CGRectMake(0, 64, self.view.frame.size.width, 250);
    }
    return _player;
}

- (NSMutableArray *)videoArray {
    if (!_videoArray) {
        _videoArray = [NSMutableArray array];
    }
    return _videoArray;
}



- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_player destroyPlayer];
    _player = nil;
}


#pragma mark - network

- (void)fetchVideoListData {

    for (int i=0; i<10; i++) {
        XLVideoItem *item=[[XLVideoItem alloc]init];
        item.cover=@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1510109310&di=85525d32445c5e11dcf1c4c52a06122c&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.33lc.com%2Farticle%2FUploadPic%2F2012-8%2F20128201349756210.jpg";
        item.title=@"我是标题";
        item.mp4_url=@"http://flv3.bn.netease.com/videolib3/1710/31/OJkni1239/SD/OJkni1239-mobile.mp4";
        [self.videoArray addObject:item];
    }
    [_tableView reloadData];
    
}

- (void)showVideoPlayer:(UITapGestureRecognizer *)tapGesture {
    NSLog(@"1111111");
    [_player destroyPlayer];
    _player = nil;
    
    UIView *view = tapGesture.view;
    XLVideoItem *item = self.videoArray[view.tag - 100];

    
    _indexPath = [NSIndexPath indexPathForRow:view.tag - 100 inSection:0];
    XLVideoCell *cell = [_tableView cellForRowAtIndexPath:_indexPath];
    
    _player = [[XLVideoPlayer alloc] init];
    _player.videoUrl = item.mp4_url;
    [_player playerBindTableView:_tableView currentIndexPath:_indexPath];
    _player.frame = view.bounds;
    
    [cell.contentView addSubview:_player];
    
    _player.completedPlayingBlock = ^(XLVideoPlayer *player) {
        [player destroyPlayer];
        _player = nil;
    };
}




#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isEqual:_tableView]) {
        
        [_player playerScrollIsSupportSmallWindowPlay:YES];
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
