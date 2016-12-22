//
//  DDDriverInfoView.h
//  DDTravel
//
//  Created by mac on 2016/12/23.
//  Copyright © 2016年 dongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDDriverInfoView : UIView

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UITextField *nameLabel;
@property (nonatomic, strong) UIImageView *fiveStarImageView;
@property (nonatomic, strong) UITextField *scoreLabel;
@property (nonatomic, strong) UITextField *usedTimeLabel;

@property (nonatomic, strong) UITextField *paiziLabel;
@property (nonatomic, strong) UITextField *receiveTimeLabel;

@end
