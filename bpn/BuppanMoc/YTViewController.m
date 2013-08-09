//
//  YTViewController.m
//  BuppanMoc
//
//  Created by 手塚 俊之 on 2013/06/29.
//  Copyright (c) 2013年 TSUN. All rights reserved.
//

#import "YTViewController.h"

#import <QuartzCore/QuartzCore.h>
#import "YTTriangleView.h"
#import "YTMosaicView.h"

#define HEIGHT_ITEM_IMG     120.0f
#define HEIGHT_ITEM_BRIEF   40.0f
#define HEIGHT_ITEM_COUNTER 44.0f

#define UIColorWithRGB(r,g,b)       [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1.0f]
#define UIColorWithHEX(rgbValue)    [UIColor \
                                        colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                        green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                        blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface YTViewController ()

@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) UIView *navigationView;
@property (nonatomic,retain) UIView *toolView;

@end

@implementation YTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self initialize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialize
{
    self.tableView = [UITableView new];
    CGRect frame = [[UIScreen mainScreen] bounds];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.frame = CGRectMake(0, 44, 320, frame.size.height-20-44-44);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = UIColorWithRGB(178, 206, 214);
    
    _tableView.backgroundView = [[YTMosaicView alloc] initWithFrame:_tableView.bounds
                                               panelNumOfHorizontal:10
                                                             colors:@[UIColorWithHEX(0x86BBFD),UIColorWithHEX(0x86BBF5),UIColorWithHEX(0x86BBFF)]
                                                           isRandom:true];
    
    [self.view addSubview:_tableView];
    
    [self buildUI];
}

- (void)buildUI
{
    self.navigationView = [UIView new];
    _navigationView.frame = CGRectMake(0, 0, 320, 44);
    _navigationView.backgroundColor = UIColorWithRGB(244, 212, 206);
    _navigationView.clipsToBounds = false;
    _navigationView.layer.shadowColor = [UIColor blackColor].CGColor;
    _navigationView.layer.shadowOffset = CGSizeMake(0, 1);
    _navigationView.layer.shadowRadius = 2.0f;
    _navigationView.layer.shadowOpacity = 0.1f;
    _navigationView.layer.masksToBounds = false;
    _navigationView.layer.shadowPath = [UIBezierPath bezierPathWithRect:_navigationView.bounds].CGPath;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _navigationView.bounds.size.height-1, 320, 1)];
    line.backgroundColor = [UIColor lightGrayColor];
    [_navigationView addSubview:line];
    [self.view addSubview:_navigationView];
    
    self.toolView = [UIView new];
    CGRect frame = [UIScreen mainScreen].bounds;
    _toolView.frame = CGRectMake(0, frame.size.height-20, 320, 44);
    _toolView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:_toolView];
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    view.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    label.backgroundColor = [UIColor whiteColor];
    label.text = [NSString stringWithFormat:@" Section %d", section];
    [view addSubview:label];
    
    UIView *triangle = [[YTTriangleView alloc] initWithFrame:CGRectMake(320-40, 20-1, 20, 10) color:[UIColor whiteColor] angle:YTTriangleViewAngleDown];
    [view addSubview:triangle];
    
    return view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 10;
    // 1 1 2 1 3
    
    int numberOfRows = 0;
    switch (section) {
        case 0:
            numberOfRows = 1;
            break;
        case 1:
            numberOfRows = 1;
            break;
        case 2:
            numberOfRows = 2;
            break;
        case 3:
            numberOfRows = 1;
            break;
        case 4:
            numberOfRows = 3;
            break;
        default:
            break;
    }
    return numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self calcHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell%d", indexPath.row]];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"Cell%d", indexPath.row]];
        cell.frame = CGRectMake(0, 0, 320, [self calcHeight]);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildCell:cell indexPath:indexPath];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark

- (float)calcHeight
{
    float height = 0.0f;
    height = HEIGHT_ITEM_IMG + HEIGHT_ITEM_COUNTER + 10;
    return 80;
    
}

- (void)buildCell:(UITableViewCell*)cell indexPath:(NSIndexPath*)indexPath
{   
    UIView *view = nil;
    float heightMargin = 0.f;
    
    switch (indexPath.section) {
        case 2:
            if(indexPath.row == 1) heightMargin = 20.f;
            break;
        case 4:
            if(indexPath.row == 2) heightMargin = 20.f;
            break;
        default:
            heightMargin = 20.f;
            break;
    }
    
    view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 320-20, [self calcHeight]-10-heightMargin)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 5.0f;
    
    //shadow
    UIView *shadow = [[UIView alloc] initWithFrame:view.frame];
    shadow.backgroundColor = [UIColor whiteColor];
    shadow.layer.cornerRadius = 5.f;
    shadow.layer.shadowColor = [UIColor blackColor].CGColor;
    shadow.layer.shadowOpacity = 0.7f;
    shadow.layer.shadowRadius = 1.f;
    shadow.layer.shadowOffset = CGSizeMake(0, 0.75);
    shadow.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:shadow.bounds cornerRadius:5.0f].CGPath;
    shadow.layer.masksToBounds = false;
    [cell addSubview:shadow];
    
    [cell addSubview:view];
}

//仮のコード置き場
//- (void)commons
//{
//    //shadow
//    UIView *shadow = [[UIView alloc] initWithFrame:view.frame];
//    shadow.backgroundColor = [UIColor whiteColor];
//    shadow.layer.cornerRadius = 5.f;
//    shadow.layer.shadowColor = [UIColor blackColor].CGColor;
//    shadow.layer.shadowOpacity = 0.7f;
//    shadow.layer.shadowRadius = 1.f;
//    shadow.layer.shadowOffset = CGSizeMake(0, 0.75);
//    shadow.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:shadow.bounds cornerRadius:5.0f].CGPath;
//    shadow.layer.masksToBounds = false;
//    [cell addSubview:shadow];
//}

@end
