//
//  UIColor+OFColor.m
//  MStore
//
//  Created by MikeZhangpy on 16/7/1.
//  Copyright © 2016年 RoseVision. All rights reserved.
//

#import "UIColor+OFColor.h"

@implementation UIColor (OFColor)

+ (UIColor *)color255WithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [self colorWithRed:red / 255.f green:green / 255.f blue:blue / 255.f alpha:1.f];
}

+ (UIColor *)ofWhiteTextColor {
    return [UIColor color255WithRed:255.f green:255.f blue:255.f];
}

+ (UIColor *)ofOrangeTextColor {
    return [UIColor color255WithRed:255.f green:90.f blue:51.f];
}

+ (UIColor *)ofOrangeHighlightTextColor {
    return [UIColor color255WithRed:217.f green:93.f blue:0.f];
}

+ (UIColor *)ofBlackTextColor {
    return [UIColor color255WithRed:0.f green:0.f blue:0.f];
}

+ (UIColor *)ofPictureTitleColor {
    return [UIColor color255WithRed:255.f green:255.f blue:255.f];
}

+ (UIColor *)ofNormalBrifColor {
    return [UIColor color255WithRed:51.f green:51.f blue:51.f];
}

+ (UIColor *)ofNormalContentColor {
    return [UIColor color255WithRed:68.f green:68.f blue:68.f];
}

+ (UIColor *)ofLightGraySubContentColor {
    return [UIColor color255WithRed:153.f green:153.f blue:153.f];
}

+ (UIColor *)ofLightGrayContentColor {
    return [UIColor color255WithRed:102.f green:102.f blue:102.f];
}

+ (UIColor *)ofAssistanceColor {
    return [UIColor color255WithRed:126.f green:126.f blue:126.f];
}

+ (UIColor *)ofArialTextColor {
    return [UIColor color255WithRed:51.f green:51.f blue:51.f];
}

+ (UIColor *)ofSeparatedLineColor {
    return [UIColor color255WithRed:219.f green:219.f blue:219.f];
}

+ (UIColor *)ofBorderLineColor {
    return [UIColor color255WithRed:221.f green:221.f blue:221.f];
}

+ (UIColor *)ofLightGreyColor {
    return [UIColor color255WithRed:123.f green:123.f blue:123.f];
}

+ (UIColor *)whiteColorForDefaultBackgroundColor {
    return [UIColor color255WithRed:240.f green:240.f blue:240.f];
}

+ (UIColor *)ofGrayHoverColor {
    return [UIColor color255WithRed:217.f green:217.f blue:217.f];
}

+ (UIColor *)ofLightGrayHoverColor {
    return [UIColor color255WithRed:235.f green:235.f blue:235.f];
}

+ (UIColor *)ofOrangeHoverColor {
    return [self ofOrangeTextColor];
}

+ (UIColor *)ofDeepOrangeHoverColor {
    return [UIColor color255WithRed:217.f green:93.f blue:0.f];
}

@end
