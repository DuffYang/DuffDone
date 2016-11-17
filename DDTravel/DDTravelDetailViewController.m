//
//  DDTravelDetailViewController.m
//  DDTravel
//
//  Created by 杨东正 on 2016/11/15.
//  Copyright © 2016年 dongzheng. All rights reserved.
//

#import "DDTravelDetailViewController.h"

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

@interface DDTravelDetailViewController ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *receiveTimeLabel;

@property (nonatomic, strong) UIImageView *fiveStarImageView;
@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) UILabel *usedTimeLabel;

@property (nonatomic, strong) UIImageView *messageImageView;

@property (nonatomic, strong) UIImageView *paySuccessImageView;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIImageView *commentView;

@end

@implementation DDTravelDetailViewController

- (void)loadView {
    [super loadView];
    
    self.title = @"匿名评价";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setCustomNavigationBackItem];
    [self setCustomNavigationRightButton:@"更多" action:@selector(didClickRightButton:)];
    
    [self buildViews];
}

- (void)buildViews {
    [self buildAvatorImageView];
    
    [self buildNameLabel];
    [self buildReceiveLabel];
    [self buildFiveStarImageView];
    [self buildScoreLabel];
    [self buildUsedTimeLabel];
    
    [self buildessageImageView];
    
    [self buildPaySuccessImageView];
    [self buildPriceLabel];
    [self buildCommentView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat cellW = CGRectGetWidth(self.view.bounds);
    CGFloat cellH = CGRectGetHeight(self.view.bounds);

    
    self.avatarImageView.frame = CGRectMake(kOffset, kOffset, kImageHeight, kImageHeight);
    
    int leftLabelW = cellW - kProfileInfoHeight - kConnectImageWIdth;
    int topY = (kProfileInfoHeight - kLabelHeight * 3) / 2.f;
    
    self.nameLabel.frame = CGRectMake(kProfileInfoHeight, topY, leftLabelW, kLabelHeight);
    self.receiveTimeLabel.frame = CGRectMake(kProfileInfoHeight, CGRectGetMaxY(self.nameLabel.frame), leftLabelW, kLabelHeight);
    
    self.fiveStarImageView.frame = CGRectMake(kProfileInfoHeight, CGRectGetMaxY(self.receiveTimeLabel.frame) + 2, 55, 16);
    CGFloat labelX = CGRectGetMaxX(self.fiveStarImageView.frame) + 5;
    self.scoreLabel.frame = CGRectMake(labelX,  CGRectGetMaxY(self.receiveTimeLabel.frame) + 5, 18, 10);
    labelX = CGRectGetMaxX(self.scoreLabel.frame) + 10;
    self.usedTimeLabel.frame = CGRectMake(labelX,  CGRectGetMaxY(self.receiveTimeLabel.frame), leftLabelW, kLabelHeight);
    
    self.messageImageView.frame = CGRectMake(cellW - kConnectImageWIdth, 0, kConnectImageWIdth, kProfileInfoHeight);
    
    self.paySuccessImageView.frame = CGRectMake(0, kProfileInfoHeight, cellW, 100/3);
    self.priceLabel.frame = CGRectMake(0, CGRectGetMaxY(self.paySuccessImageView.frame), cellW, kPriceLabelHeight);
    self.commentView.frame = CGRectMake(0, CGRectGetMaxY(self.priceLabel.frame), cellW, kCommentViewHeigth);
}

- (void)didClickRightButton:(id)sender {
    
}

#pragma mark - Builder
- (void)buildAvatorImageView {
    self.avatarImageView = [[UIImageView alloc] init];
    self.avatarImageView.image = [UIImage imageNamed:@"avatar_placeholder_large"];
    self.avatarImageView.layer.cornerRadius = kImageHeight / 2;
    self.avatarImageView.clipsToBounds = YES;
    [self.view addSubview:self.avatarImageView];
}

- (void)buildNameLabel {
    self.nameLabel = [self buildCommonLabel];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.text = @"宋师傅 · 京Q5GS79";
    self.nameLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.view addSubview:self.nameLabel];
}

- (void)buildReceiveLabel {
    self.receiveTimeLabel = [self buildCommonLabel];
    self.receiveTimeLabel.font = [UIFont systemFontOfSize:12.0f];
    self.receiveTimeLabel.textColor = [UIColor color255WithRed:104 green:104 blue:104];
    self.receiveTimeLabel.text = @"黑色·丰田凯美瑞";
    [self.view addSubview:self.receiveTimeLabel];
}

- (void)buildFiveStarImageView {
    self.fiveStarImageView = [[UIImageView alloc] init];
    self.fiveStarImageView.image = [UIImage imageNamed:@"five_star"];
    [self.view addSubview:self.fiveStarImageView];
}

- (void)buildScoreLabel {
    self.scoreLabel = [self buildCommonLabel];
    self.scoreLabel.font = [UIFont systemFontOfSize:10.f];
    self.scoreLabel.textColor = [UIColor whiteColor];
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    self.scoreLabel.text = @"4.9";
    self.scoreLabel.layer.cornerRadius = 2;
    self.scoreLabel.backgroundColor = [UIColor ofashionOrangeColor];
    self.scoreLabel.clipsToBounds = YES;
    [self.view addSubview:self.scoreLabel];
}

- (void)buildUsedTimeLabel {
    self.usedTimeLabel = [self buildCommonLabel];
    self.usedTimeLabel.font = [UIFont systemFontOfSize:12.0f];
    self.usedTimeLabel.textColor = [UIColor color255WithRed:104 green:104 blue:104];
    self.usedTimeLabel.text = @"5272单";
    [self.view addSubview:self.usedTimeLabel];
}

- (UILabel *)buildCommonLabel {
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor grayColorOnLightColorForContent];
    label.font = [UIFont systemFontOfSize:14.0f];
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

- (void)buildessageImageView {
    self.messageImageView = [[UIImageView alloc] init];
    self.messageImageView.image = [UIImage imageNamed:@"connect_image"];
    [self.view addSubview:self.messageImageView];
}

- (void)buildPaySuccessImageView {
    self.paySuccessImageView = [[UIImageView alloc] init];
    self.paySuccessImageView.image = [UIImage imageNamed:@"pay_success_image"];
    [self.view addSubview:self.paySuccessImageView];
}

- (void)buildPriceLabel {
    self.priceLabel = [self buildCommonLabel];
    self.priceLabel.backgroundColor = [UIColor whiteColor];
    self.priceLabel.textAlignment = NSTextAlignmentCenter;
    self.priceLabel.textColor = [UIColor blackColor];
    self.priceLabel.attributedText = [self getPrice];
    [self.view addSubview:self.priceLabel];
}

- (NSAttributedString *)getPrice {
    NSMutableAttributedString *resultString = [[NSMutableAttributedString alloc] init];
    NSAttributedString *priceString = [[NSAttributedString alloc] initWithString:@"65.5" attributes:@{NSFontAttributeName:[UIFont LTXHFontWithSize:40.f]}];
    [resultString appendAttributedString:priceString];
    NSAttributedString *yuanString = [[NSAttributedString alloc] initWithString:@"元" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f]}];
    [resultString appendAttributedString:yuanString];
    return resultString;
}

- (void)buildCommentView {
    self.commentView = [[UIImageView alloc] init];
    self.commentView.image = [UIImage imageNamed:@"comment_image"];
    [self.view addSubview:self.commentView];
}

@end
