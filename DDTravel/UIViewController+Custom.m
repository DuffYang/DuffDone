//
//  UIViewController+Custom.m
//  MStore
//
//  Created by Dai Ryan on 13-8-2.
//  Copyright (c) 2013年 RoseVision. All rights reserved.
//

#import "UIViewController+Custom.h"

#import "UIColor+RGBColor.h"
#import "UIButton+OFHover.h"

@implementation UIViewController (Custom)
#pragma mark - Public Mehtods
- (void)setCustomNavigationBackItem {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"common_navBar_backIcon"]
                forState:UIControlStateNormal];
    [backButton sizeToFit];
    [backButton addTarget:self
                   action:@selector(privateBack)
         forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setLeftBarButtonItem:backItem];
}

- (void)setCustomNavigationRightButton:(NSString *)title action:(SEL)action{
    UIBarButtonItem *rightBarButtonItem = [self getCustomNavigationBarButton:title action:action];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)setCustomNavigationRightButtonWithImageName:(NSString *)imageName action:(SEL)action {
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame = CGRectMake(0.0f, 0.0f, 31.0f, 24.0f);
    [rightButton setTintColor:[UIColor grayColorOnLightColorForContent]];
    [rightButton setImage: [UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = barItem;
}

- (UIBarButtonItem *)getCustomNavigationBarButton:(NSString *)title action:(SEL)action {
    CGFloat width = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f]}].width;
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    barButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [barButton setFrame:CGRectMake(0.f, 0.f, width, 44.f)];
    [barButton setTitle:title forState:UIControlStateNormal];
    [barButton setTitleColor:[UIColor grayColorOnLightColorForContent] highlightColor:[UIColor grayColorOnLightColorForSubcontent]];
    [barButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [barButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
    return barButtonItem;
}

- (void)setCustomBackgroundColor {
    self.view.backgroundColor = [UIColor whiteColorForDefaultBackgroundColor];
}

- (void)setCustomTitleView {
    [self setCustomTitleViewWithImageName:@"common_navBar_logo"];
}

- (void)setCustomTitleViewWithImageName:(NSString *)imageName {
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    titleImageView.contentMode = UIViewContentModeCenter;
    self.navigationItem.titleView = titleImageView;
}

#pragma mark - Private Methods
- (void)privateBack {
    if ([self respondsToSelector:@selector(back)]) {
        [self performSelector:@selector(back)];
    } else {
        if ([self presentingViewController] &&
            self.navigationController != nil &&
            1 == [[self.navigationController viewControllers] count]) {
            
            [self.presentingViewController dismissViewControllerAnimated: YES completion: nil];
        } else {
            [self.navigationController popViewControllerAnimated: YES];
        }
    }
}

- (void)back {
     [self.navigationController popViewControllerAnimated: YES];
}

@end
