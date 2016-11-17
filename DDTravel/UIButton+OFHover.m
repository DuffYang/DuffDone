//
//  UIButton+OFHover.m
//  MStore
//
//  Created by 杨东正 on 16/8/15.
//  Copyright © 2016年 RoseVision. All rights reserved.
//

#import "UIButton+OFHover.h"
#import "UIColor+RGBColor.h"

@implementation UIButton (OFHover)

- (void)setTitleColor:(UIColor *)color highlightColor:(UIColor *)highlightColor {
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:highlightColor forState:UIControlStateSelected];
    [self setTitleColor:highlightColor forState:UIControlStateHighlighted];
    [self addTarget:self action:@selector(showHighlight:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)setBackgroundColor:(UIColor *)color highlightColor:(UIColor *)highlightColor {
    [self setBackgroundImage:[self imageWithColor:color] forState:UIControlStateNormal];
    [self setBackgroundImage:[self imageWithColor:highlightColor] forState:UIControlStateSelected];
    [self setBackgroundImage:[self imageWithColor:highlightColor] forState:UIControlStateHighlighted];
}

- (void)setBackgroundImage:(UIImage *)image highlightImage:(UIImage *)highlightImage {
    [self setBackgroundImage:image forState:UIControlStateNormal];
    [self setBackgroundImage:highlightImage forState:UIControlStateSelected];
    [self setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
}

+ (UIButton *)buildShareButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.tintColor = [UIColor grayColorOnLightColorForContent];
    [button setImage:[UIImage imageNamed:@"common_navBar_shareIcon"] forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(button.bounds), CGRectGetHeight(button.bounds));
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    return button;
}

- (void)showHighlight:(UIButton *)btn {
    btn.selected = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        btn.selected = NO;
    });
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
