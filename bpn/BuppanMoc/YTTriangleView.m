//
//  YTTriangleView.m
//  BuppanMoc
//
//  Created by 手塚 俊之 on 2013/07/07.
//  Copyright (c) 2013年 TSUN. All rights reserved.
//

#import "YTTriangleView.h"


@interface YTTriangleView()

@property (nonatomic,retain) UIColor *color;
@property (nonatomic,assign) YTTriangleViewAngle angle;

@end

@implementation YTTriangleView

- (id)initWithFrame:(CGRect)frame color:(UIColor*)color angle:(YTTriangleViewAngle)angle
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.color = color;
        self.angle = angle;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // 塗りつぶす色を設定する。
    [_color setFill];
    
    // 三角形のパスを書く　（３点でオープンパスにした。）
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    float width = self.bounds.size.width;
    float height = self.bounds.size.height;
    if(_angle == YTTriangleViewAngleUp)
    {
        CGContextMoveToPoint(ctx, width/2.f, 0);
        CGContextAddLineToPoint(ctx, width, height);
        CGContextAddLineToPoint(ctx, 0, height);
    }
    else
    {
        CGContextMoveToPoint(ctx, width/2.f, height);
        CGContextAddLineToPoint(ctx, width, 0);
        CGContextAddLineToPoint(ctx, 0, 0);
    }
    
    // 塗りつぶす
    CGContextFillPath(ctx);
}

@end
