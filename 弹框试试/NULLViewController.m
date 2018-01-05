//
//  NULLViewController.m
//  弹框试试
//
//  Created by 123 on 2018/1/4.
//  Copyright © 2018年 123. All rights reserved.
//

#import "NULLViewController.h"
#import "LYEmptyViewHeader.h"//空数据处理
#import "CYLTableViewPlaceHolder.h"//空数据自定义
/*
 *第三方适配
 */
#import "SDAutoLayout.h"
@interface NULLViewController ()<UITableViewDelegate,UITableViewDataSource,CYLTableViewPlaceHolderDelegate>
{
    NSInteger index;
    UITableView *_tableView;
}
@end

@implementation NULLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    //tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"img_nodata_oder"titleStr:@"暂无数据,请稍后再试"detailStr:nil];

    index=10;
    // Do any additional setup after loading the view.
}
- (UIView *)makePlaceHolderView{

    return [self NULLDataView_size:_tableView.frame.size topHeight:100 messageStr:nil imageName:nil];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return index;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *string=@"indexPath";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];

    
    cell.textLabel.textColor=[UIColor blackColor];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    index=0;
    //[tableView reloadData];
    [tableView cyl_reloadData];
}
-(UIView *)NULLDataView_size:(CGSize)size topHeight:(float)height messageStr:(NSString *)msgStr imageName:(NSString *)imgName{

    UIView *bbview=[[UIView alloc]init];
    bbview.backgroundColor=[UIColor whiteColor];
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"img_nodata_oder"];
    if (imgName!=nil) {
        img.image=[UIImage imageNamed:imgName];
    }
    img.frame=CGRectMake((size.width-147)/2, height, 147, 147);
    [bbview addSubview:img];
    
    UILabel *lbl=[[UILabel alloc]init];
    lbl.text=@"暂无数据,请稍后再试";
    if (msgStr!=nil) {
        lbl.text=msgStr;
    }
    lbl.textColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];
    lbl.font=[UIFont systemFontOfSize:12];
    lbl.textAlignment=NSTextAlignmentCenter;
    lbl.numberOfLines=0;
    [bbview addSubview:lbl];
    lbl.sd_layout.leftEqualToView(img).topSpaceToView(img, 20).widthIs(147).autoHeightRatio(0);
    return bbview;
    
    
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
