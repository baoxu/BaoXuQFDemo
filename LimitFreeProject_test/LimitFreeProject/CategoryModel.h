//
//  CategoryModel.h
//  LimitFreeProject
//
//  Created by baoxu on 15/10/13.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel :NSObject
@property (nonatomic,copy) NSString *categoryCname;
@property (nonatomic,copy) NSString *categoryCount;
@property (nonatomic,copy) NSString *up;
@property (nonatomic,copy) NSString *down;
@property (nonatomic,copy) NSString *same;
@property (nonatomic,copy) NSString *limited;
@property (nonatomic,copy) NSString *categoryId;
@property (nonatomic,copy) NSString *picUrl;
@property (nonatomic,copy) NSString *free;
@property (nonatomic,copy) NSString *categoryName;
@end
