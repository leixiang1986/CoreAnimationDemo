//
//  ReDrawView.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/2.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "ReDrawView.h"

@implementation ReDrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 5);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextStrokePath(ctx);
  
}


@end
