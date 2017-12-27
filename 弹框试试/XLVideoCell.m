//
//  XLVideoCell.m
//  弹框试试
//
//  Created by 123 on 2017/11/1.
//  Copyright © 2017年 123. All rights reserved.
//

#import "XLVideoCell.h"

@implementation XLVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (XLVideoCell *)videoCellWithTableView:(UITableView *)tableview {
    static NSString *ID = @"XLVideoCell";
    XLVideoCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[XLVideoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    
    
    
    return cell;
}

- (void)setVideoItem:(XLVideoItem *)videoItem {
    _videoItem = videoItem;

    _videoImageView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:videoItem.cover]]];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _videoImageView=[[UIImageView alloc]init];
        _videoImageView.userInteractionEnabled=YES;
        [self.contentView addSubview:_videoImageView];
        _videoImageView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
