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

@property (nonatomic, strong) UIImageView *locationImageView;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *fastCarLogo;
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
        [self buildLocationImageView];
        [self buildNameLabel];
        [self buildFastCarLogo];
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
    self.nameLabel.frame = CGRectMake(kOffset, OffsetY, kDateLabelWidth, kLabelHeight);
    self.fastCarLogo.frame = CGRectMake(kDateLabelWidth - 5, OffsetY + 1, 36, 22);
    
    self.locationImageView.frame = CGRectMake(0, CGRectGetMaxY(self.nameLabel.frame), kLocationIconWidth, kLabelHeight * 2);
    self.receiveTimeLabel.frame = CGRectMake(kLocationIconWidth, CGRectGetMaxY(self.nameLabel.frame), leftLabelW, kLabelHeight);
    self.usedTimeLabel.frame = CGRectMake(kLocationIconWidth,  CGRectGetMaxY(self.receiveTimeLabel.frame), leftLabelW, kLabelHeight);
    
    self.finishLabel.frame = CGRectMake(cellW - kFinishLabelWidth,  OffsetY, kFinishLabelWidth, kLabelHeight);
    self.sendMessageButton.frame = CGRectMake(cellW - 55,  (cellH - 25) / 2, 50, 25);
    self.separatorLine.frame = CGRectMake(0, cellH - 0.5, cellW, 0.5);
}

- (void)dealloc {
    self.nameLabel = nil;
    self.receiveTimeLabel = nil;
    self.usedTimeLabel = nil;
    self.sendMessageButton = nil;
    self.separatorLine = nil;
}

#pragma mark -
#pragma mark Public Methods
- (void)reloadCellWithCouponDistributeData:(DDTravelListModel *)data {
    self.nameLabel.text = data.nickname;
    self.receiveTimeLabel.text = data.receiveTime;
    self.usedTimeLabel.text = data.usedTime;
}

#pragma mark - Builder
- (void)buildNameLabel {
    self.nameLabel = [self buildCommonLabel];
    self.nameLabel.font =[UIFont boldSystemFontOfSize:14.f];
    self.nameLabel.textColor = [UIColor color255WithRed:84 green:84 blue:84];
    [self addSubview:self.nameLabel];
}

- (void)buildFastCarLogo {
    self.fastCarLogo = [[UIImageView alloc] init];
    self.fastCarLogo.image = [UIImage imageNamed:@"fast_car_logo"];
    [self addSubview:self.fastCarLogo];
}

- (void)buildLocationImageView {
    self.locationImageView = [[UIImageView alloc] init];
    self.locationImageView.image = [UIImage imageNamed:@"location_icon"];
    [self addSubview:self.locationImageView];
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
    self.separatorLine.backgroundColor = [UIColor whiteColorForAllLineColor];
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
