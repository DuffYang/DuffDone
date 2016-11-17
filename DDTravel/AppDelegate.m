//
//  AppDelegate.m
//  DDTravel
//
//  Created by 杨东正 on 2016/11/14.
//  Copyright © 2016年 dongzheng. All rights reserved.
//

#import "AppDelegate.h"
#import "DDHomeViewController.h"
#import "UIColor+RGBColor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self buildWindow];
    
    return YES;
}


- (void)buildWindow {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    DDHomeViewController *homeViewController = [[DDHomeViewController alloc] init];
    UINavigationController *homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    homeNavController.navigationBar.barTintColor = [UIColor color255WithRed:250 green:250 blue:250];
    self.window.rootViewController = homeNavController;
    [self.window makeKeyAndVisible];
}


@end
