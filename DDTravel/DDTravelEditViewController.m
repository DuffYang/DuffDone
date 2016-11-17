//
//  DDTravelEditViewController.m
//  DDTravel
//
//  Created by mac on 2016/11/18.
//  Copyright © 2016年 dongzheng. All rights reserved.
//

#import "DDTravelEditViewController.h"
#import "UIViewController+Custom.h"
#import "UIColor+RGBColor.h"
#import "UIFont+CustomFont.h"

static const CGFloat kPriceLabelHeight  = 60.f;
static const CGFloat kOffset = 15.f;
static const CGFloat kLabelHeight = 20.f;
static const CGFloat kImageHeight = 50.f;
static const CGFloat kProfileInfoHeight = 80.f;
static const CGFloat kConnectImageWIdth = 140;

static const CGFloat kCommentViewHeigth = 160.f;

@interface DDTravelEditViewController ()

@property (nonatomic, strong) UITextField *avatarImageView;
@property (nonatomic, strong) UITextField *nameLabel;
@property (nonatomic, strong) UITextField *receiveTimeLabel;

@property (nonatomic, strong) UITextField *scoreLabel;
@property (nonatomic, strong) UITextField *usedTimeLabel;

@property (nonatomic, strong) UITextField *priceLabel;

@end

@implementation DDTravelEditViewController

- (void)loadView {
    [super loadView];
    
    self.title = @"添加行程";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setCustomNavigationBackItem];
    [self setCustomNavigationRightButton:@"保存" action:@selector(didClickRightButton:)];
    
    [self buildViews];
}

- (void)buildViews {
    [self buildAvatorImageView];
    
    [self buildNameLabel];
    [self buildReceiveLabel];
    [self buildScoreLabel];
    [self buildUsedTimeLabel];
    
    [self buildPriceLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat cellW = CGRectGetWidth(self.view.bounds);
    CGFloat cellH = CGRectGetHeight(self.view.bounds);
    
    
    self.avatarImageView.frame = CGRectMake(kOffset, 100, cellW - kOffset * 2, kLabelHeight);
    self.nameLabel.frame = CGRectMake(kOffset, CGRectGetMaxY(self.avatarImageView.frame), cellW - kOffset * 2, kLabelHeight);
    self.receiveTimeLabel.frame = CGRectMake(kOffset, CGRectGetMaxY(self.nameLabel.frame), cellW - kOffset * 2, kLabelHeight);
    self.scoreLabel.frame = CGRectMake(kOffset, CGRectGetMaxY(self.receiveTimeLabel.frame), cellW - kOffset * 2, kLabelHeight);
    self.usedTimeLabel.frame = CGRectMake(kOffset, CGRectGetMaxY(self.scoreLabel.frame), cellW - kOffset * 2, kLabelHeight);
    self.priceLabel.frame = CGRectMake(kOffset, CGRectGetMaxY(self.usedTimeLabel.frame), cellW - kOffset * 2, kLabelHeight);
}

- (void)didClickRightButton:(id)sender {
    
}

#pragma mark - Builder
- (void)buildAvatorImageView {
    self.avatarImageView = [self buildCommonLabel];
    self.avatarImageView.text = @"tttp:www.baidu.com";
    [self.view addSubview:self.avatarImageView];
}

- (void)buildNameLabel {
    self.nameLabel = [self buildCommonLabel];
    self.nameLabel.text = @"宋师傅 · 京Q5GS79";
    [self.view addSubview:self.nameLabel];
}

- (void)buildReceiveLabel {
    self.receiveTimeLabel = [self buildCommonLabel];
    self.receiveTimeLabel.text = @"黑色·丰田凯美瑞";
    [self.view addSubview:self.receiveTimeLabel];
}

- (void)buildScoreLabel {
    self.scoreLabel = [self buildCommonLabel];
    self.scoreLabel.text = @"4.9";
    [self.view addSubview:self.scoreLabel];
}

- (void)buildUsedTimeLabel {
    self.usedTimeLabel = [self buildCommonLabel];
    self.usedTimeLabel.text = @"5272单";
    [self.view addSubview:self.usedTimeLabel];
}

- (void)buildPriceLabel {
    self.priceLabel = [self buildCommonLabel];
    self.priceLabel.text = @"41.7";
    [self.view addSubview:self.priceLabel];
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
