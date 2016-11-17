//
//  UIFont+CustomFont.m
//  MStore
//
//  Created by MikeZhangpy on 16/6/30.
//  Copyright © 2016年 RoseVision. All rights reserved.
//

#import "UIFont+CustomFont.h"

@implementation UIFont (CustomFont)

+ (UIFont *)LTXHFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:ltxhFont size:size];
}

+ (UIFont *)LTZHFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:ltzhFont size:size];
}

+ (UIFont *)ArialFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:ArialFont size:size];
}

@end
