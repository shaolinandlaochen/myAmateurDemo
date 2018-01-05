//
//  CalendarViewController.m
//  弹框试试
//
//  Created by 123 on 2018/1/5.
//  Copyright © 2018年 123. All rights reserved.
//

#import "CalendarViewController.h"
#import "WHUCalendarPopView.h"
#import "WHUCalendarView.h"
@interface CalendarViewController ()
{
    WHUCalendarPopView* _pop;
}
@property (nonatomic,strong) WHUCalendarView *calview;
@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"日历";
    self.view.backgroundColor=[UIColor whiteColor];
    
    _calview=[[WHUCalendarView alloc]init];
    _calview.frame=CGRectMake(10, 100, 300, 300);
    [self.view addSubview:_calview];
    
    _calview.tagStringOfDate=^NSString*(NSArray* calm,NSArray* itemDateArray){
        NSLog(@"%@",calm);
        //如果当前日期中的天数,可以被5整除,显示 预约
        if([itemDateArray[2] integerValue]%5==0){
            return @"预约";
        }
        else{
            return nil;
        }
    };
    
    _calview.onDateSelectBlk=^(NSDate* date){
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy年MM月dd"];
        NSString *dateString = [format stringFromDate:date];
        NSLog(@"calview:%@",dateString);
    };
    
    _pop=[[WHUCalendarPopView alloc] init];
    _pop.onDateSelectBlk=^(NSDate* date){
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy年MM月dd"];
        NSString *dateString = [format stringFromDate:date];
        NSLog(@"%@",dateString);
    };

    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"查看弹框日期" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor=[UIColor redColor];
    [self.view addSubview:btn];
    btn.frame=CGRectMake(10, 450, 200, 20);
    // Do any additional setup after loading the view.
}
-(void)onButtonClick:(UIButton *)btn{

    [_pop show];
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
