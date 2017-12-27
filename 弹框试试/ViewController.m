//
//  ViewController.m
//  弹框试试
//
//  Created by 123 on 2017/10/24.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ViewController.h"
#import "FTIndicator.h"
#import "LuckIsIntroducedViewController.h"
#import "VideoListViewController.h"
#import "XHNetworkCache.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    UIImageView *img;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    
    
    img=[[UIImageView alloc]init];
    [self.view addSubview:img];
    img.frame=CGRectMake(100, 300, 100, 100);
    
    
   /*
    UIImageView *imgggggg=[[UIImageView alloc]init];
    imgggggg.frame=CGRectMake(100, 300, 200, 300);
    [self.view addSubview:imgggggg];
    imgggggg.image=[self captureScreenForView:self.view];
    */

    
    // Do any additional setup after loading the view, typically from a nib.
}
//获取截图
-(UIImage *)captureScreenForView:(UIView *)currentView {
    
    UIGraphicsBeginImageContext(currentView.frame.size);
    [currentView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  viewImage;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *string=@"indexPath";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    switch (indexPath.row) {
        case 0:
        {
        
            cell.textLabel.text=@"正在加载";
        }
            break;
        case 1:
        {
            cell.textLabel.text=@"正底部弹出";
        }
            break;
        case 2:
        {
            cell.textLabel.text=@"感叹号";
        }
            break;
        case 3:
        {
            cell.textLabel.text=@"正确";
        }
            break;
        case 4:
        {
            cell.textLabel.text=@"发生错误";
        }
            break;
        case 5:
        {
            cell.textLabel.text=@"顶部弹框标题";
        }
            break;
        case 6:
        {
            cell.textLabel.text=@"上面弹框并加载网络图片";
        }
            break;
        case 7:
        {
            cell.textLabel.text=@"取消弹框";
        }
            break;
        case 8:
        {
            cell.textLabel.text=@"生成二维码";
        }
            break;
        case 9:
        {
            cell.textLabel.text=@"卡片模式";
        }
            break;
        case 10:
        {
            cell.textLabel.text=@"视频列表";
        }
            break;
        case 11:
        {
            cell.textLabel.text=@"缓存数据";
        }
            break;
        case 12:
        {
            
        }
            break;
            
            
        default:
            break;
    }
    
    cell.textLabel.textColor=[UIColor blackColor];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
        {
            
            [FTIndicator showProgressWithmessage:@"正在加载"];
        }
            break;
        case 1:
        {
            
            [FTIndicator showToastMessage:@"底部弹出"];
        }
            break;
        case 2:
        {
            
            [FTIndicator showInfoWithMessage:@"感叹号"];
        }
            break;
        case 3:
        {
            
            [FTIndicator showSuccessWithMessage:@"正确(成功)"];
        }
            break;
        case 4:
        {
            
            [FTIndicator showErrorWithMessage:@"发生错误"];
        }
            break;
        case 5:
        {
            
            [FTIndicator showNotificationWithTitle:@"顶部弹框标题" message:@"顶部弹框提示信息"];
        }
            break;
        case 6:
        {
            
            [FTIndicator showNotificationWithImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1508903342875&di=692b8c7526b5432234c9f488b6b0d36f&imgtype=0&src=http%3A%2F%2Fimg1.3lian.com%2F2015%2Fa1%2F91%2Fd%2F58.jpg"]]] title:@"我是title" message:@"提示信息"];
        }
            break;
        case 7:
        {
            
            [FTIndicator dismissProgress];
            [FTIndicator dismissToast];
            [FTIndicator dismissNotification];
        }
            break;
        case 8:
        {
            
           img.image=[self encodeQRImageWithContent:@"http://www.baidu.com" size:CGSizeMake(100, 100)];
        }
            break;
        case 9:
        {
            
            LuckIsIntroducedViewController *HomepageBounced=[[LuckIsIntroducedViewController alloc]init];
            HomepageBounced.modalPresentationStyle = UIModalPresentationOverFullScreen;
            [HomepageBounced setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
            [self presentViewController:HomepageBounced animated:NO completion:^{
                HomepageBounced.view.backgroundColor = [UIColor whiteColor];
            }];
        }
            break;
        case 10:
        {
            //视频列表
            VideoListViewController *list=[[VideoListViewController alloc]init];
            [self presentViewController:list animated:YES completion:^{
                
            }];
        }
            break;
            
        case 11:{
            
            id cacheJson = [XHNetworkCache cacheJsonWithURL:@"1111" params:nil];//获取缓存数据
            if (cacheJson) {
                NSLog(@"cacheJson===%@",cacheJson);
            }else{
                NSLog(@"null?====%@",cacheJson);
            }
            
            break;
        }
            
            
        default:
            break;
    }
}
- (UIImage *)encodeQRImageWithContent:(NSString *)content size:(CGSize)size {
    UIImage *codeImage = nil;
    NSData *stringData = [content dataUsingEncoding: NSUTF8StringEncoding];
    
    //生成
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    
    UIColor *onColor = [UIColor blackColor];
    UIColor *offColor = [UIColor whiteColor];
    
    //上色
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"
                                       keysAndValues:
                             @"inputImage",qrFilter.outputImage,
                             @"inputColor0",[CIColor colorWithCGColor:onColor.CGColor],
                             @"inputColor1",[CIColor colorWithCGColor:offColor.CGColor],
                             nil];
    
    CIImage *qrImage = colorFilter.outputImage;
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:qrImage fromRect:qrImage.extent];
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    codeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGImageRelease(cgImage);
    return codeImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
