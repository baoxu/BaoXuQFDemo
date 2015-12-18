//
//  AppModel.h
//  LimitFreeProject
//
//  Created by baoxu on 15/10/12.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel :NSObject

@property (nonatomic,copy) NSString *itunesUrl;
@property (nonatomic,copy) NSString *slug;
@property (nonatomic,copy) NSString *lastPrice;
@property (nonatomic,copy) NSString *ratingOverall;
@property (nonatomic,copy) NSString *applicationId;
@property (nonatomic,copy) NSString *fileSize;
@property (nonatomic,copy) NSString *releaseNotes;
@property (nonatomic,copy) NSString *ipa;
@property (nonatomic,copy) NSString *releaseDate;
@property (nonatomic,copy) NSString *categoryName;
@property (nonatomic,copy) NSString *downloads;
@property (nonatomic,copy) NSString *updateDate;
@property (nonatomic,copy) NSString *shares;
@property (nonatomic,copy) NSString *favorites;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *version;
@property (nonatomic,copy) NSString *iconUrl;
@property (nonatomic,copy) NSString *starCurrent;
@property (nonatomic,copy) NSString *starOverall;
@property (nonatomic,copy) NSString *priceTrend;
@property (nonatomic,copy) NSString *expireDatetime;
@property (nonatomic,copy) NSString *currentPrice;
@property (nonatomic,copy) NSNumber *categoryId;
@property (nonatomic,copy) NSString *desc;

@end
