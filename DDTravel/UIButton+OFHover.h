//
//  UIButton+OFHover.h
//  MStore
//
//  Created by 杨东正 on 16/8/15.
//  Copyright © 2016年 RoseVision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (OFHover)

- (void)setTitleColor:(UIColor *)color highlightColor:(UIColor *)highlightColor;
- (void)setBackgroundColor:(UIColor *)color highlightColor:(UIColor *)highlightColor;
- (void)setBackgroundImage:(UIImage *)image highlightImage:(UIImage *)highlightImage;

+ (UIButton *)buildShareButton;

@end
