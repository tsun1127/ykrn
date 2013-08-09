//
//  YTMosaicView.h
//  BuppanMoc
//
//  Created by 手塚 俊之 on 2013/07/07.
//  Copyright (c) 2013年 TSUN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTMosaicView : UIView

- (id)initWithFrame:(CGRect)frame panelNumOfHorizontal:(float)panelNumOfHorizontal colors:(NSArray *)colors isRandom:(BOOL)isRandom;

@end
