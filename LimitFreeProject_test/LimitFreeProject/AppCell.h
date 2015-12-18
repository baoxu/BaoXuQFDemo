//
//  AppCell.h
//  LimitFreeProject
//
//  Created by baoxu on 15/10/12.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"

@interface AppCell : UITableViewCell

@property(strong,nonatomic) UIImageView *iconImageView;
@property(strong,nonatomic) UILabel *nameLabel;
@property(strong,nonatomic) StarView *starView;
@property(strong,nonatomic) UILabel *priceLabel;
@property(strong,nonatomic) UILabel *categoryLabel;
@property(strong,nonatomic) UILabel *sharesLabel;
@property(strong,nonatomic) UILabel *favoriteLabel;
@property(strong,nonatomic) UILabel *downloadLabel;


@end
