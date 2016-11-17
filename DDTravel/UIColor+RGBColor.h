//
//  UIColor+RGBColor.h
//  MStore
//
//  Created by Grass on 15/1/13.
//  Copyright (c) 2015年 RoseVision. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 * 用于项目中的颜色偏好设置
 */

@interface UIColor (RGBColor)

/**
 * App 主色调 用于需要价格,按钮背景色,订单状态,menu选中的文本色,以及其他high light 的信息
 */
+ (UIColor *)ofashionOrangeColor;

/*!
 * @brief 私信红点颜色
 */
+ (UIColor *)redColorForUnreadMessage;

/*!
 * 文字颜色
 */
//  浅色背景上的文字色值:普通情况下背景色是白色偏灰:
//  用于白色页面的普通一级阅读文本色值,一般是标题类的,重要信息的
+ (UIColor *)blackColorOnLightColorForTitle;

//  用于白色页面的二级阅读文本色值,一般是正文,菜单未选中文本,搜索出来的历史纪录,小按钮(银色)上的文字
+ (UIColor *)grayColorOnLightColorForContent;

//  用于白色页面的三级阅读文本色值,一般是备注文字,未填写信息的提示文字,商品市场价格(被划掉的价格)
+ (UIColor *)grayColorOnLightColorForSubcontent;

//  深色色背景上的文字色值:特殊情况下背景色是黑色偏灰:
// 用于黑色背景的一级阅读文本色值
+ (UIColor *)whiteColorOnDeepColorForContent;

//  用于黑色背景的二级阅读文本色值
+ (UIColor *)whiteColorOnDeepColorForSubcontent;

//用于黑色背景的三阅读文本色值
+ (UIColor *)whiteColorOnDeepColorForSubSubcontent;

/*!
 * R G B  255值  Convenient Funcation
 */
+ (UIColor *)color255WithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

//  layer border line color
+ (UIColor *)borderLineColor;

/*!
 * 背景颜色
 */
//  默认背景颜色
+ (UIColor *)whiteColorForDefaultBackgroundColor;

// 用于App 中body 部分#ebe9ed 背景色上面的条形背景
+ (UIColor *)whiteColorForDefaultSubBackgroundColor;

//  默NavBar背景颜色
+ (UIColor *)whiteColorForNavBarBackgroundColor;

//  TabBar背景颜色
+ (UIColor *)blackColorForTabBarBackgroundColor;

//  菜单背景色
//  NavBar 下面的扩展菜单背景色
+ (UIColor *)whiteColorForCategoryBackgroundColor;

//  个人详细资料背景颜色
+ (UIColor *)grayColorForPersonalDetailBackgroundColor;

// 分割线颜色颜色 10px 用于tableview的cell之间的间隔
+ (UIColor *)grayColorForItemSpaceBackgroundColor;

/*!
 * 线条颜色 用于App所有的线条的颜色 App 1px 线 颜色
 */
+ (UIColor *)whiteColorForAllLineColor;

//  用于App 中body 部分出现的黑色大面积背景和黑色按钮
+ (UIColor *)blackColorBackgroundColor;


@end
