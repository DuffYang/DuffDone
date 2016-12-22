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
#import "UIImageView+WebCache.h"
#import "DDDriverInfoView.h"

static const CGFloat kPriceLabelHeight  = 60.f;

@interface DDTravelDetailViewController ()


@property (nonatomic, strong) UIImageView *backgroundImage;

@property (nonatomic, strong) DDDriverInfoView *driverInfoView;

@property (nonatomic, strong) UITextField *priceLabel;

@property (nonatomic, strong) DDTravelListModel *model;

@end

@implementation DDTravelDetailViewController

- (id)initWithModel:(DDTravelListModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.title = @"行程结束";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setCustomNavigationBackItem];
//    [self setCustomNavigationRightButton:@"更多" action:@selector(didClickRightButton:)];
    
    [self buildViews];
}

- (void)buildViews {
    [self buildBackgroundImage];
    
    [self buildDriverInfoView];
    
    [self buildPriceLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self.driverInfoView.avatarImageView sd_setImageWithURL:[NSURL URLWithString:self.model.avatarURL]];
    self.driverInfoView.nameLabel.text = self.model.owner;
    self.driverInfoView.receiveTimeLabel.text = self.model.carType;
    self.driverInfoView.scoreLabel.text = self.model.commentScore;
    self.driverInfoView.usedTimeLabel.text = self.model.orderCount;
    self.priceLabel.attributedText = [self getPrice:self.model.price];
    self.driverInfoView.scoreLabel.text = self.model.commentScore;
    self.driverInfoView.paiziLabel.text = self.model.paiziString;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat cellW = CGRectGetWidth(self.view.bounds);

    self.backgroundImage.frame = self.view.bounds;
    
    self.driverInfoView.frame = CGRectMake(10, 263, 280, 100);
    
    self.priceLabel.frame = CGRectMake(10, 440, cellW - 20, kPriceLabelHeight);
}

- (void)didClickRightButton:(id)sender {
    
    
//    NSMutableArray *saveArray = [NSMutableArray arrayWithCapacity:0];
//    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    NSMutableArray *dataArray = [NSMutableArray arrayWithArray:[ud objectForKey:@"data"]];
//    for (NSDictionary *info in dataArray) {
//        NSMutableDictionary *saveInfo = [NSMutableDictionary dictionaryWithDictionary:info];
//        NSString *keyID = [info objectForKey:@"keyID"];
//        if ([keyID isEqualToString:self.model.keyID]) {
//            [saveInfo setValue:self.nameLabel.text forKey:@"owner"];
//            [saveInfo setValue:self.receiveTimeLabel.text forKey:@"carType"];
//            [saveInfo setValue:self.scoreLabel.text forKey:@"commentScore"];
//            [saveInfo setValue:self.usedTimeLabel.text forKey:@"orderCount"];
//            [saveInfo setValue:[NSString stringWithFormat:@"%.2f", [self.priceLabel.text floatValue]] forKey:@"price"];
//        }
//        [saveArray addObject:saveInfo];
//    }
//    [ud setObject:saveArray forKey:@"data"];
//    [ud synchronize];
//    
//    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Builder
- (void)buildBackgroundImage {
    self.backgroundImage = [[UIImageView alloc] init];
    self.backgroundImage.image = [UIImage imageNamed:@"travel_edit_bg_image"];
    [self.view addSubview:self.backgroundImage];
}

- (void)buildDriverInfoView {
    self.driverInfoView = [DDDriverInfoView new];
    self.driverInfoView.frame = CGRectMake(0, 0, 0, 0);
    [self.view addSubview:self.driverInfoView];
}

- (UITextField *)buildCommonLabel {
    UITextField *label = [[UITextField alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor grayColorOnLightColorForContent];
    label.font = [UIFont systemFontOfSize:14.0f];
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

- (void)buildPriceLabel {
    self.priceLabel = [self buildCommonLabel];
    self.priceLabel.backgroundColor = [UIColor whiteColor];
    self.priceLabel.textAlignment = NSTextAlignmentCenter;
    self.priceLabel.textColor = [UIColor blackColor];
    self.priceLabel.attributedText = [self getPrice:@"65.5"];
    [self.view addSubview:self.priceLabel];
}

- (NSAttributedString *)getPrice:(NSString *)price {
    
    
        NSArray *familyNames = [UIFont familyNames];
        for( NSString *familyName in familyNames ){
            printf("Family: %s \n", [familyName UTF8String] );
            NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
            for( NSString *fontName in fontNames ){
                printf("\tFont: %s \n", [fontName UTF8String] );
            }
        }
    
    NSMutableAttributedString *resultString = [[NSMutableAttributedString alloc] init];
    NSAttributedString *totalString = [[NSAttributedString alloc] initWithString:@"共" attributes:@{
                                                                                                   NSFontAttributeName:[UIFont systemFontOfSize:12.f],
                                                                                                   NSForegroundColorAttributeName:[UIColor color255WithRed:153 green:153 blue:153]}];
    [resultString appendAttributedString:totalString];
//    NSAttributedString *priceString = [[NSAttributedString alloc] initWithString:price attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:36.f]}];
//    NSAttributedString *priceString = [[NSAttributedString alloc] initWithString:price attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Thin" size:40.f]}];
    NSAttributedString *priceString = [[NSAttributedString alloc] initWithString:price attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:36]}];
    
    [resultString appendAttributedString:priceString];
    NSAttributedString *yuanString = [[NSAttributedString alloc] initWithString:@"元" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.f],NSForegroundColorAttributeName:[UIColor color255WithRed:153 green:153 blue:153]}];
    [resultString appendAttributedString:yuanString];
    return resultString;
}

@end
