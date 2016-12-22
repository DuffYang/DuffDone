
//
//  DDTravelListHeader.m
//  DDTravel
//
//  Created by mac on 2016/12/22.
//  Copyright © 2016年 dongzheng. All rights reserved.
//

#import "DDTravelListHeader.h"
#import "UIColor+RGBColor.h"

@interface DDTravelListHeader ()

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation DDTravelListHeader

- (instancetype)init {
    self = [super init];
    if (self) {
        [self buildNameLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.nameLabel.frame = CGRectMake(10, 16, 100, 14);
}

- (void)dealloc {
    self.nameLabel = nil;
}

#pragma mark - Builder
- (void)buildNameLabel {
    self.nameLabel = [UILabel new];
    self.nameLabel.text = @"已完成订单";
    self.nameLabel.textColor =[UIColor grayColorOnLightColorForSubcontent];
    self.nameLabel.font = [UIFont systemFontOfSize:12.f];
    [self addSubview:self.nameLabel];
}

@end
