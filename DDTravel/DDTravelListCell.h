//
//  DDTravelListCell.h
//  DDTravel
//
//  Created by 杨东正 on 2016/11/15.
//  Copyright © 2016年 dongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDTravelListModel;
@interface DDTravelListCell : UITableViewCell

- (void)reloadCellWithCouponDistributeData:(DDTravelListModel *)data;

@end
