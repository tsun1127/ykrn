//
//  YTTriangleView.h
//  BuppanMoc
//
//  Created by 手塚 俊之 on 2013/07/07.
//  Copyright (c) 2013年 TSUN. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    YTTriangleViewAngleUp = 0,
    YTTriangleViewAngleDown
} YTTriangleViewAngle;

@interface YTTriangleView : UIView

- (id)initWithFrame:(CGRect)frame color:(UIColor*)color angle:(YTTriangleViewAngle)angle;

@end
