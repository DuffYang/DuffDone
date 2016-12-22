
//
//  DDDriverInfoView.m
//  DDTravel
//
//  Created by mac on 2016/12/23.
//  Copyright © 2016年 dongzheng. All rights reserved.
//

#import "DDDriverInfoView.h"

#import "UIColor+RGBColor.h"
#import "UIColor+OFColor.h"

static const CGFloat kSpace = 10;
static const CGFloat kOffset = 20;
static const CGFloat kLabelHeight = 20.f;
static const CGFloat kImageHeight = 60.f;
static const CGFloat kProfileInfoHeight = 80.f;
static const CGFloat kConnectImageWIdth = 140;

static const CGFloat kCommentViewHeigth = 160.f;

@interface DDDriverInfoView ()

@end

@implementation DDDriverInfoView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self buildAvatorImageView];
        
        [self buildNameLabel];
        [self buildReceiveLabel];
        [self buildFiveStarImageView];
        [self buildScoreLabel];
        
        [self buildPaiziLabel];
        [self buildUsedTimeLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat cellW = CGRectGetWidth(self.bounds);
    
    self.avatarImageView.frame = CGRectMake(15, kOffset, kImageHeight, kImageHeight);
    
    CGFloat labelX = CGRectGetMaxX(self.avatarImageView.frame) + kSpace;
    self.nameLabel.frame = CGRectMake(labelX, kOffset, 50, kLabelHeight);
    self.fiveStarImageView.frame = CGRectMake(CGRectGetMaxX(self.nameLabel.frame) + 2, kOffset + 2.5, 15, 15);
    self.scoreLabel.frame = CGRectMake(CGRectGetMaxX(self.fiveStarImageView.frame),  kOffset + 1, 20, kLabelHeight);
    self.usedTimeLabel.frame = CGRectMake(CGRectGetMaxX(self.scoreLabel.frame) + 3,  kOffset + 1, 60, kLabelHeight);
    
    [self.paiziLabel sizeToFit];
    self.paiziLabel.frame = CGRectMake(labelX, CGRectGetMaxY(self.nameLabel.frame) + 3, CGRectGetWidth(self.paiziLabel.frame), 15);
    self.receiveTimeLabel.frame = CGRectMake(labelX, CGRectGetMaxY(self.paiziLabel.frame) + 3, cellW, kLabelHeight);
}

- (void)dealloc {
    self.nameLabel = nil;
}

#pragma mark - Builder
- (void)buildAvatorImageView {
    self.avatarImageView = [[UIImageView alloc] init];
    self.avatarImageView.image = [UIImage imageNamed:@"avatar_placeholder_large"];
    self.avatarImageView.layer.cornerRadius = kImageHeight / 2;
    self.avatarImageView.clipsToBounds = YES;
    [self addSubview:self.avatarImageView];
}

- (void)buildNameLabel {
    self.nameLabel = [self buildCommonLabel];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.text = @"宋师傅";
    self.nameLabel.font = [UIFont systemFontOfSize:16.0f];
    [self addSubview:self.nameLabel];
}

- (void)buildPaiziLabel {
    self.paiziLabel = [self buildCommonLabel];
    self.paiziLabel.backgroundColor = [UIColor color255WithRed:226 green:226 blue:226];
    self.paiziLabel.textColor = [UIColor blackColor];
    self.paiziLabel.text = @" 京Q482ZG ";
    self.paiziLabel.textAlignment = NSTextAlignmentCenter;
    self.paiziLabel.layer.cornerRadius = 1.5;
    self.paiziLabel.clipsToBounds = YES;
    self.paiziLabel.font = [UIFont systemFontOfSize:12.0f];
    [self addSubview:self.paiziLabel];
}

- (void)buildReceiveLabel {
    self.receiveTimeLabel = [self buildCommonLabel];
    self.receiveTimeLabel.font = [UIFont systemFontOfSize:12.0f];
    self.receiveTimeLabel.textColor = [UIColor color255WithRed:104 green:104 blue:104];
    self.receiveTimeLabel.text = @"黑色 • 丰田凯美瑞";
    [self addSubview:self.receiveTimeLabel];
}

- (void)buildFiveStarImageView {
    self.fiveStarImageView = [[UIImageView alloc] init];
    self.fiveStarImageView.image = [UIImage imageNamed:@"driver_star_icon"];
    [self addSubview:self.fiveStarImageView];
}

- (void)buildScoreLabel {
    self.scoreLabel = [self buildCommonLabel];
    self.scoreLabel.font = [UIFont systemFontOfSize:12.f];
    self.scoreLabel.textColor = [UIColor color255WithRed:104 green:104 blue:104];
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    self.scoreLabel.text = @"4.9";
    [self addSubview:self.scoreLabel];
}

- (void)buildUsedTimeLabel {
    self.usedTimeLabel = [self buildCommonLabel];
    self.usedTimeLabel.font = [UIFont systemFontOfSize:12.0f];
    self.usedTimeLabel.textColor = [UIColor color255WithRed:104 green:104 blue:104];
    self.usedTimeLabel.text = @"5272单";
    [self addSubview:self.usedTimeLabel];
}

- (UITextField *)buildCommonLabel {
    UITextField *label = [[UITextField alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor grayColorOnLightColorForContent];
    label.font = [UIFont systemFontOfSize:14.0f];
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}


@end
