//
//  SPCouponDistributeData.h
//  DDTravel
//
//  Created by 杨东正 on 2016/11/15.
//  Copyright © 2016年 dongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDTravelListModel : NSObject

@property (nonatomic, strong) NSString *keyID;

@property (nonatomic, strong) NSString *avatarURL;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *carType;
@property (nonatomic, strong) NSString *commentScore;
@property (nonatomic, strong) NSString *orderCount;
@property (nonatomic, strong) NSString *price;

@property (nonatomic, strong) NSString *startPoint;
@property (nonatomic, strong) NSString *endPoint;
@property (nonatomic, strong) NSString *dateString;

@end
