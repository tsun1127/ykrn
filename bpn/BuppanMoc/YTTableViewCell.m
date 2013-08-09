//
//  YTTableViewCell.m
//  BuppanMoc
//
//  Created by 手塚 俊之 on 2013/06/29.
//  Copyright (c) 2013年 TSUN. All rights reserved.
//

/*
    物販アイテムセル
 */

#import "YTTableViewCell.h"

@implementation YTTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
