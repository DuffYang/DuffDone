//
//  UIColor+OFColor.h
//  MStore
//
//  Created by MikeZhangpy on 16/7/1.
//  Copyright © 2016年 RoseVision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (OFColor)

+ (UIColor *)color255WithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

/**
 *  白色 ffffff
 */
+ (UIColor *)ofWhiteTextColor;
/**
 *  黑色 000000
 */
+ (UIColor *)ofBlackTextColor;

/**
 *  橙色字 ff7711
 */
+ (UIColor *)ofOrangeTextColor;
+ (UIColor *)ofOrangeHighlightTextColor;

/**
 *  图片上标题 ffffff
 */
+ (UIColor *)ofPictureTitleColor;

/**
 *  普通正文颜色 66666
 */
+ (UIColor *)ofLightGrayContentColor;

/**
 *  普通应用正文 444444
 */
+ (UIColor *)ofNormalContentColor;

/**
 *  次级正文颜色 999999
 */
+ (UIColor *)ofLightGraySubContentColor;

/**
 *  普通应用摘要 333333
 */
+ (UIColor *)ofNormalBrifColor;

/**
 *  辅助提示颜色 7e7e7e
 */
+ (UIColor *)ofAssistanceColor;
/**
 *  英文字体颜色 333333
 */
+ (UIColor *)ofArialTextColor;
/**
 *  分割线颜色 dbdbdb
 */
+ (UIColor *)ofSeparatedLineColor;

/**
 * 边框颜色 221
 */
+ (UIColor *)ofBorderLineColor;

/**
 * 浅灰色 123
 */
+ (UIColor *)ofLightGreyColor;

/*!
 * 背景颜色
 */
//  默认背景颜色
+ (UIColor *)whiteColorForDefaultBackgroundColor;

#pragma mark - Button Hover
// 按钮hover效果 系统灰
+ (UIColor *)ofGrayHoverColor;

// 按钮hover效果 清灰
+ (UIColor *)ofLightGrayHoverColor;

// 按钮hover效果 橙色
+ (UIColor *)ofOrangeHoverColor;

// 按钮hover效果 深橙色
+ (UIColor *)ofDeepOrangeHoverColor;

@end
