//
//  UIFont+CustomFont.h
//  MStore
//
//  Created by MikeZhangpy on 16/6/30.
//  Copyright © 2016年 RoseVision. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const ltxhFont = @"FZLTXHJW--GB1-0";

static NSString * const ltzhFont = @"FZLTHJW--GB1-0";

static NSString * const ArialFont = @"ArialMT";

@interface UIFont (CustomFont)

/**
 *  兰亭黑-纤黑
 */
+ (UIFont *)LTXHFontWithSize:(CGFloat)size;

/**
 *  兰亭黑-中黑
 */
+ (UIFont *)LTZHFontWithSize:(CGFloat)size;


/**
 *  英文
 */
+ (UIFont *)ArialFontWithSize:(CGFloat)size;

@end
