//
//  AppCell.m
//  LimitFreeProject
//
//  Created by baoxu on 15/10/12.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import "AppCell.h"
#import "ZTQuickControl.h"
#import "ZJScreenAdaptation.h"
#import "ZJScreenAdaptaionMacro.h"

/*
 界面布局
	cate_list_bg1.png	0, 0, 320, 100
	_iconImageView		14, 10, 60, 60		圆角10
	_titleLabel		80, 5, 200, 30		font:17
	_infoLabel		80, 25, 200, 30	font:14
	_starView			80, 50, 100, 30	font:14
	_priceLabel		240, 25, 200, 30	font:14
	_categoryLabel		240, 45, 200, 30	font:14
	_shareLabel		10, 70, 200, 30	font:14
	_favoriteLabel		110, 70, 200, 30	font:14
	_downloadLabel		210, 70, 200, 30	font:14
 */
@implementation AppCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addImageViewWithFrame:CGRectMake(0, 0, 320, 100) image:@"cate_list_bg1.png"];
    //
    _iconImageView = [self.contentView addImageViewWithFrame:CGRectMake(14, 10, 60, 60) image:nil];
    _iconImageView.layer.cornerRadius = 10;
    _iconImageView.clipsToBounds = YES;
    //
    _nameLabel = [self.contentView addLabelWithFrame:CGRectMake(80, 5, 200, 30) title:nil];
    _nameLabel.font = [UIFont boldSystemFontOfSize:17];
    //
    _starView = [[StarView alloc]initWithFrame:CGRectMake(80, 50, 100, 30)];
    [self.contentView addSubview:_starView];
    //
    _priceLabel = [self.contentView addLabelWithFrame:CGRectMake(240, 25, 200, 30) title:nil];
    UILabel *label = [_priceLabel addLabelWithFrame:CGRectMake(0, 14, 45, 2) title:nil];
    label.backgroundColor = [UIColor grayColor];
    //
    _categoryLabel = [self.contentView addLabelWithFrame:CGRectMake(240, 45, 200, 30) title:nil];
    //
    _sharesLabel = [self.contentView addLabelWithFrame:CGRectMake(10, 70, 200, 30) title:nil];
    _sharesLabel.font = [UIFont systemFontOfSize:14];
    //
    _favoriteLabel = [self.contentView addLabelWithFrame:CGRectMake(110, 70, 200, 30) title:nil];
    _favoriteLabel.font = [UIFont systemFontOfSize:14];
    //
    _downloadLabel = [self.contentView addLabelWithFrame:CGRectMake(210, 70, 200, 30) title:nil];
    _downloadLabel.font = [UIFont systemFontOfSize:14];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
