//
//  YTMosaicView.m
//  BuppanMoc
//
//  Created by 手塚 俊之 on 2013/07/07.
//  Copyright (c) 2013年 TSUN. All rights reserved.
//

#import "YTMosaicView.h"


@interface YTMosaicView()

@property (nonatomic,retain) NSArray *colors;
@property (nonatomic,assign) float panelNumOfHorizontal;
@property (nonatomic,assign) BOOL isRandom;

@end

@implementation YTMosaicView

- (id)initWithFrame:(CGRect)frame panelNumOfHorizontal:(float)panelNumOfHorizontal colors:(NSArray *)colors isRandom:(BOOL)isRandom
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.colors = colors;
        self.panelNumOfHorizontal = panelNumOfHorizontal;
        self.isRandom = true; //強制ランダム配置
        self.clipsToBounds = true;
        [self buildMosaicView];
    }
    return self;
}

- (void)buildMosaicView
{
    if(!_colors.count) return;
    
    float panelWidth = self.frame.size.width / _panelNumOfHorizontal;
    float panelHeight = panelWidth;
    int panelNumOfVertical = (int)(ceil(self.frame.size.height / panelHeight));
    
    float pointOfX, pointOfY;
    for(int i=0; i<_panelNumOfHorizontal; i++)
    {
        pointOfX = panelWidth * i;
        for(int j=0; j<panelNumOfVertical; j++)
        {
            pointOfY = panelHeight * j;
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(pointOfX, pointOfY, panelWidth, panelHeight)];
            view.backgroundColor = _colors[(rand()%_colors.count)];
            [self addSubview:view];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
