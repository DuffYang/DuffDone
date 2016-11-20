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
#import "DDTravelListModel.h"

static const CGFloat kOffset = 15.f;
static const CGFloat kLabelHeight = 40.f;

@interface DDTravelEditViewController ()

@property (nonatomic, strong) UITextField *dateLabel;
@property (nonatomic, strong) UITextField *startPointLabel;
@property (nonatomic, strong) UITextField *endPointLabel;

@property (nonatomic, strong) UITextField *avatarImageView;
@property (nonatomic, strong) UITextField *nameLabel;
@property (nonatomic, strong) UITextField *receiveTimeLabel;

@property (nonatomic, strong) UITextField *scoreLabel;
@property (nonatomic, strong) UITextField *usedTimeLabel;

@property (nonatomic, strong) UITextField *priceLabel;

@property (nonatomic, strong) DDTravelListModel *model;
@property (nonatomic, assign) BOOL editModel;

@end

@implementation DDTravelEditViewController

- (id)initWithModel:(DDTravelListModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
        self.editModel = YES;
    }
    return self;
}

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
    [self buildDateLabel];
    [self buildStartPointLabel];
    [self buildEndPointLabel];
    
    [self buildAvatorImageView];
    
    [self buildNameLabel];
    [self buildReceiveLabel];
    [self buildScoreLabel];
    [self buildUsedTimeLabel];
    
    [self buildPriceLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.editModel) {
        self.dateLabel.text = self.model.dateString;
        self.startPointLabel.text = self.model.startPoint;
        self.endPointLabel.text = self.model.endPoint;
        self.avatarImageView.text = self.model.avatarURL;
        self.nameLabel.text = self.model.owner;
        self.receiveTimeLabel.text = self.model.carType;
        self.scoreLabel.text = self.model.commentScore;
        self.usedTimeLabel.text = self.model.orderCount;
        self.priceLabel.text = self.model.price;
        self.scoreLabel.text = self.model.commentScore;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat cellW = CGRectGetWidth(self.view.bounds);
    
    self.dateLabel.frame = CGRectMake(kOffset, 20, cellW - kOffset * 2, kLabelHeight);
    self.startPointLabel.frame = CGRectMake(kOffset, CGRectGetMaxY(self.dateLabel.frame), cellW - kOffset * 2, kLabelHeight);
    self.endPointLabel.frame = CGRectMake(kOffset, CGRectGetMaxY(self.startPointLabel.frame), cellW - kOffset * 2, kLabelHeight);
    self.avatarImageView.frame = CGRectMake(kOffset, CGRectGetMaxY(self.endPointLabel.frame), cellW - kOffset * 2, kLabelHeight);
    self.nameLabel.frame = CGRectMake(kOffset, CGRectGetMaxY(self.avatarImageView.frame), cellW - kOffset * 2, kLabelHeight);
    self.receiveTimeLabel.frame = CGRectMake(kOffset, CGRectGetMaxY(self.nameLabel.frame), cellW - kOffset * 2, kLabelHeight);
    self.scoreLabel.frame = CGRectMake(kOffset, CGRectGetMaxY(self.receiveTimeLabel.frame), cellW - kOffset * 2, kLabelHeight);
    self.usedTimeLabel.frame = CGRectMake(kOffset, CGRectGetMaxY(self.scoreLabel.frame), cellW - kOffset * 2, kLabelHeight);
    self.priceLabel.frame = CGRectMake(kOffset, CGRectGetMaxY(self.usedTimeLabel.frame), cellW - kOffset * 2, kLabelHeight);
}

- (void)didClickRightButton:(id)sender {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSMutableArray *dataArray = [NSMutableArray arrayWithArray:[ud objectForKey:@"data"]];
    if (self.editModel) {
        NSMutableArray *saveArray = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *info in dataArray) {
            NSMutableDictionary *saveInfo = [NSMutableDictionary dictionaryWithDictionary:info];
            NSString *keyID = [info objectForKey:@"keyID"];
            if ([keyID isEqualToString:self.model.keyID]) {
                [saveInfo setValue:self.model.keyID forKey:@"keyID"];
                [self setCarInfo:saveInfo];
            }
            [saveArray addObject:saveInfo];
        }
        [ud setObject:saveArray forKey:@"data"];
    } else {
        int count = (int)dataArray.count;
        NSString *keyID = [NSString stringWithFormat:@"%d", count++];
        NSMutableDictionary *dataInfo = [NSMutableDictionary dictionaryWithCapacity:0];
        [dataInfo setValue:keyID forKey:@"keyID"];
        [self setCarInfo:dataInfo];
        [dataArray addObject:dataInfo];
        [ud setObject:dataArray forKey:@"data"];
    }
    [ud synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setCarInfo:(NSMutableDictionary *)dataInfo {
    [dataInfo setValue:self.dateLabel.text forKey:@"dateString"];
    [dataInfo setValue:self.startPointLabel.text forKey:@"startPoint"];
    [dataInfo setValue:self.endPointLabel.text forKey:@"endPoint"];
    [dataInfo setValue:self.avatarImageView.text forKey:@"avatarURL"];
    [dataInfo setValue:self.self.nameLabel.text forKey:@"owner"];
    [dataInfo setValue:self.receiveTimeLabel.text forKey:@"carType"];
    [dataInfo setValue:self.scoreLabel.text forKey:@"commentScore"];
    [dataInfo setValue:self.usedTimeLabel.text forKey:@"orderCount"];
    [dataInfo setValue:self.priceLabel.text forKey:@"price"];
}

#pragma mark - Builder
- (void)buildDateLabel {
    self.dateLabel = [self buildCommonLabel];
    self.dateLabel.text = @"11月15日 11:20";
    [self.view addSubview:self.dateLabel];
}

- (void)buildStartPointLabel {
    self.startPointLabel = [self buildCommonLabel];
    self.startPointLabel.text = @"朝阳区望京街10号望京SOHO";
    [self.view addSubview:self.startPointLabel];
}

- (void)buildEndPointLabel {
    self.endPointLabel = [self buildCommonLabel];
    self.endPointLabel.text = @"朝阳区康营中路康营家园17期";
    [self.view addSubview:self.endPointLabel];
}

- (void)buildAvatorImageView {
    self.avatarImageView = [self buildCommonLabel];
    self.avatarImageView.text = @"http://mstore.b0.upaiyun.com/avatar/20150513/97947/453182934.96659.jpg";
    [self.view addSubview:self.avatarImageView];
}

- (void)buildNameLabel {
    self.nameLabel = [self buildCommonLabel];
    self.nameLabel.text = @"宋师傅 • 京Q5GS79";
    [self.view addSubview:self.nameLabel];
}

- (void)buildReceiveLabel {
    self.receiveTimeLabel = [self buildCommonLabel];
    self.receiveTimeLabel.text = @"黑色 • 丰田凯美瑞";
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
