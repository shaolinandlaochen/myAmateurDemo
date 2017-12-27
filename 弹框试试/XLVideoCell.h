//
//  XLVideoCell.h
//  弹框试试
//
//  Created by 123 on 2017/11/1.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLVideoItem.h"
@interface XLVideoCell : UITableViewCell
@property (nonatomic, strong) XLVideoItem *videoItem;
@property (nonatomic, strong) UIImageView *videoImageView;
+ (XLVideoCell *)videoCellWithTableView:(UITableView *)tableview;
@end
