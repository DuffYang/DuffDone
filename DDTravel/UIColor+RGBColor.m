//
//  UIColor+RGBColor.m
//  MStore
//
//  Created by Grass on 15/1/13.
//  Copyright (c) 2015年 RoseVision. All rights reserved.
//

#import "UIColor+RGBColor.h"

@implementation UIColor (RGBColor)

/*!
 * R G B  255值  Convenient Funcation
 */
+ (UIColor *)color255WithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [self colorWithRed:red / 255.f green:green / 255.f blue:blue / 255.f alpha:1.f];
}

/**
 * App 主色调 用于需要价格,按钮背景色,订单状态,menu选中的文本色,以及其他high light 的信息
 */
+ (UIColor *)ofashionOrangeColor {
    return [UIColor color255WithRed:255.f green:119.f blue:17.f];
}

/*!
 * @brief 私信红点颜色
 */
+ (UIColor *)redColorForUnreadMessage {
    return [UIColor color255WithRed:255.f green:51.f blue:51.f];
}

/*!
 * 文字颜色
 */
//  浅色背景上的文字色值:普通情况下背景色是白色偏灰:
//  用于白色页面的普通一级阅读文本色值,一般是标题类的,重要信息的
+ (UIColor *)blackColorOnLightColorForTitle {
    return [UIColor color255WithRed:34.f green:34.f blue:34.f];
}

//  用于白色页面的二级阅读文本色值,一般是正文,菜单未选中文本,搜索出来的历史纪录,小按钮(银色)上的文字
+ (UIColor *)grayColorOnLightColorForContent {
    return [UIColor color255WithRed:102.f green:102.f blue:102.f];
}

//  用于白色页面的三级阅读文本色值,一般是备注文字,未填写信息的提示文字,商品市场价格(被划掉的价格)
+ (UIColor *)grayColorOnLightColorForSubcontent {
    return [UIColor color255WithRed:153.f green:153.f blue:153.f];
}

//  深色色背景上的文字色值:特殊情况下背景色是黑色偏灰:
// 用于黑色背景的一级阅读文本色值
+ (UIColor *)whiteColorOnDeepColorForContent {
    return [UIColor color255WithRed:255.f green:255.f blue:255.f];
}

//  用于黑色背景的二级阅读文本色值
+ (UIColor *)whiteColorOnDeepColorForSubcontent {
    return [UIColor color255WithRed:204.f green:204.f blue:204.f];
}

//用于黑色背景的三阅读文本色值
+ (UIColor *)whiteColorOnDeepColorForSubSubcontent {
    return [UIColor color255WithRed:153.f green:153.f blue:153.f];
}

+ (UIColor *)borderLineColor {
    return [self color255WithRed:221 green:221 blue:221];
}

/*!
 * 背景颜色
 */
//  默认背景颜色
+ (UIColor *)whiteColorForDefaultBackgroundColor {
    return [UIColor color255WithRed:240.f green:240.f blue:240.f];
}

// App 中主背景上的二级背景色   用于App 中body 部分#ebe9ed 背景色上面的条形背景
+ (UIColor *)whiteColorForDefaultSubBackgroundColor {
    return [UIColor color255WithRed:255.f green:255.f blue:255.f];
}

//  默NavBar背景颜色
+ (UIColor *)whiteColorForNavBarBackgroundColor {
    return [UIColor color255WithRed:243.f green:241.f blue:245.f];
}

//  TabBar背景颜色
+ (UIColor *)blackColorForTabBarBackgroundColor {
    return [UIColor color255WithRed:27.f green:25.f blue:29.f];
}

//  菜单背景色
//  NavBar 下面的扩展菜单背景色
+ (UIColor *)whiteColorForCategoryBackgroundColor {
    return [UIColor color255WithRed:252.f green:252.f blue:252.f];
}

//  个人详细资料背景颜色
+ (UIColor *)grayColorForPersonalDetailBackgroundColor {
    return [UIColor color255WithRed:21.0f green:19.0f blue:22.0f];
}

// 分割线颜色颜色 10px 用于tableview的cell之间的间隔
+ (UIColor *)grayColorForItemSpaceBackgroundColor {
    return [UIColor color255WithRed:240.f green:240.f blue:240.f];
}

/*!
 * 线条颜色 用于App所有的线条的颜色 App 1px 线 颜色
 */
+ (UIColor *)whiteColorForAllLineColor {
    return [UIColor color255WithRed:221.f green:221.f blue:221.f];
}

//  用于App 中body 部分出现的黑色大面积背景和黑色按钮
+ (UIColor *)blackColorBackgroundColor {
    return [UIColor color255WithRed:43.f green:41.f blue:45.f];
}

@end
