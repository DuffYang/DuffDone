//
//  DDTravelListCell.m
//  DDTravel
//
//  Created by 杨东正 on 2016/11/15.
//  Copyright © 2016年 dongzheng. All rights reserved.
//

#import "DDTravelListCell.h"

#import "DDTravelListModel.h"

#import "UIColor+RGBColor.h"

static const CGFloat kOffset = 10;
static const CGFloat kLabelHeight = 26.f;
static const CGFloat kFinishLabelWidth = 66.f;
static const CGFloat kLocationIconWidth = 33;
static const CGFloat kDateLabelWidth = 124.f;

@interface DDTravelListCell ()

@property (nonatomic, strong) UIImageView *fastCarLogo;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *receiveTimeLabel;
@property (nonatomic, strong) UILabel *usedTimeLabel;

@property (nonatomic, strong) UILabel *finishLabel;
@property (nonatomic, strong) UIButton *sendMessageButton;

@property (nonatomic, strong) UIImageView *separatorLine;

@end

@implementation DDTravelListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildFastCarLogo];
        [self buildNameLabel];
        [self buildDateLabel];
        [self buildReceiveLabel];
        [self buildUsedTimeLabel];
        [self buildFinishLabel];
        [self buildSendMessageButton];
        [self buildSeparatorLine];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat cellW = self.bounds.size.width;
    CGFloat cellH = self.bounds.size.height;
    int OffsetY = (cellH - kLabelHeight * 3) / 2;
    int leftLabelW = cellW - 100;
    
    self.fastCarLogo.frame = CGRectMake(0, 37, 31, 100);
    
    self.nameLabel.frame = CGRectMake(31, 19, kDateLabelWidth, 14);
    self.dateLabel.frame = CGRectMake(31, 37 + 5, kDateLabelWidth, kLabelHeight);
    self.receiveTimeLabel.frame = CGRectMake(31, CGRectGetMaxY(self.dateLabel.frame) + 2, leftLabelW, kLabelHeight);
    self.usedTimeLabel.frame = CGRectMake(31,  CGRectGetMaxY(self.receiveTimeLabel.frame) + 2, leftLabelW, kLabelHeight);
    
    self.finishLabel.frame = CGRectMake(cellW - 72,  19, 45, 14);
    self.sendMessageButton.frame = CGRectMake(CGRectGetMaxX(self.finishLabel.frame), 19, 14, 14);
    self.separatorLine.frame = CGRectMake(0, cellH - 5, cellW, 5);
}

- (void)dealloc {
    self.dateLabel = nil;
    self.receiveTimeLabel = nil;
    self.usedTimeLabel = nil;
    self.sendMessageButton = nil;
    self.separatorLine = nil;
}

#pragma mark -
#pragma mark Public Methods
- (void)reloadCellWithCouponDistributeData:(DDTravelListModel *)data {
    self.dateLabel.text = data.dateString;
    self.receiveTimeLabel.text = data.startPoint;
    self.usedTimeLabel.text = data.endPoint;
}

#pragma mark - Builder
- (void)buildNameLabel {
    self.nameLabel = [self buildCommonLabel];
    self.nameLabel.text = @"专车";
    self.nameLabel.textColor = [UIColor color255WithRed:51 green:51 blue:51];
    [self addSubview:self.nameLabel];
}

- (void)buildDateLabel {
    self.dateLabel = [self buildCommonLabel];
    [self addSubview:self.dateLabel];
}

- (void)buildFastCarLogo {
    self.fastCarLogo = [[UIImageView alloc] init];
    self.fastCarLogo.image = [UIImage imageNamed:@"travel_list_image"];
    [self addSubview:self.fastCarLogo];
}

- (void)buildReceiveLabel {
    self.receiveTimeLabel = [self buildCommonLabel];
    [self addSubview:self.receiveTimeLabel];
}

- (void)buildUsedTimeLabel {
    self.usedTimeLabel = [self buildCommonLabel];
    [self addSubview:self.usedTimeLabel];
}

- (void)buildFinishLabel {
    self.finishLabel = [self buildCommonLabel];
    self.finishLabel.textAlignment = NSTextAlignmentCenter;
    self.finishLabel.textColor = [UIColor color255WithRed:153 green:153 blue:153];
    self.finishLabel.text = @"已完成";
    [self addSubview:self.finishLabel];
}

- (void)buildSendMessageButton {
    self.sendMessageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sendMessageButton setImage:[UIImage imageNamed:@"content_arrow"] forState:UIControlStateNormal];
    [self.sendMessageButton.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    self.sendMessageButton.layer.cornerRadius = 4.f;
    self.sendMessageButton.clipsToBounds = YES;
    [self addSubview:self.sendMessageButton];
}

- (void)buildSeparatorLine {
    self.separatorLine = [[UIImageView alloc] init];
    self.separatorLine.backgroundColor = [UIColor whiteColorForDefaultBackgroundColor];
    [self addSubview:self.separatorLine];
}

- (UILabel *)buildCommonLabel {
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor grayColorOnLightColorForContent];
    label.font = [UIFont systemFontOfSize:14.0f];
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}


@end
