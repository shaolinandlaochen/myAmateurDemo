//
//  luckView.m
//  弹框试试
//
//  Created by 123 on 2017/10/30.
//  Copyright © 2017年 123. All rights reserved.
//

#import "luckView.h"

@implementation luckView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        
        //// Color Declarations
        UIColor* shadowColor2 = [UIColor colorWithRed: 0.209 green: 0.209 blue: 0.209 alpha: 1];
        
        //// Shadow Declarations
        UIColor* shadow = [shadowColor2 colorWithAlphaComponent: 0.73];
        CGSize shadowOffset = CGSizeMake(3.1/2.0, -0.1/2.0);
        CGFloat shadowBlurRadius = 12/2.0;
        self.layer.shadowColor = [shadow CGColor];
        self.layer.shadowOpacity = 0.73;
        self.layer.shadowOffset = shadowOffset;
        self.layer.shadowRadius = shadowBlurRadius;
        self.layer.shouldRasterize = YES;
        
        
        
        self.backgroundImage=[[UIImageView alloc]init];
        self.backgroundImage.frame=self.bounds;
        [self addSubview:self.backgroundImage];
    }
    return self;
}
-(void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];

    self.backgroundImage=[[UIImageView alloc]init];
    self.backgroundImage.frame=CGRectMake(10, 10, 100, 150);
    [self addSubview:self.backgroundImage];
}
@end
