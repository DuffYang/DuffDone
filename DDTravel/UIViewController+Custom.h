//
//  UIViewController+Custom.h
//  MStore
//
//  Created by Dai Ryan on 13-8-2.
//  Copyright (c) 2013年 RoseVision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Custom)

- (void)setCustomNavigationBackItem;
/**
 * @brief 定义导航条右侧按钮
 * @param title (Required) 按钮名称
 * @param action (Required) 点击事件
 */
- (void)setCustomNavigationRightButton:(NSString *)title action:(SEL)action;
- (void)setCustomNavigationRightButtonWithImageName:(NSString *)imageName action:(SEL)action;

- (void)setCustomBackgroundColor;
- (void)setCustomTitleView;
- (void)setCustomTitleViewWithImageName:(NSString *)imageName;
- (void)privateBack;
- (UIBarButtonItem *)getCustomNavigationBarButton:(NSString *)title action:(SEL)action;

@end
