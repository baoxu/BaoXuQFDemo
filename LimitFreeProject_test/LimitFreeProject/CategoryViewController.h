//
//  CategoryViewController.h
//  LimitFreeProject
//
//  Created by baoxu on 15/10/13.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UITableViewController

//保存AppListController传入的block，点击分类cell，执行block，来改变Applist显示的app列表对应响应的分类

@property(nonatomic,copy) void (^changeCategory)(NSString *categoryId);

-(void)setChangeCategory:(void (^)(NSString *categoryId))changeCategory;

@end
