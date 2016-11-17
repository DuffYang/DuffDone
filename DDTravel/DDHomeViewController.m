//
//  DDHomeViewController.m
//  DDTravel
//
//  Created by 杨东正 on 2016/11/14.
//  Copyright © 2016年 dongzheng. All rights reserved.
//

#import "DDHomeViewController.h"
#import "DDTravelListViewController.h"
#import "UIColor+OFColor.h"

@interface DDHomeViewController ()

@end

@implementation DDHomeViewController

- (void)loadView {
    [super loadView];
    self.title = @"首页";

    [self buildLeftNavigationBarItem];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didClickLeftButton:(id)sender {
    DDTravelListViewController *travelList = [[DDTravelListViewController alloc] init];
    [self.navigationController pushViewController:travelList animated:YES];
}

#pragma mark - builder
- (void)buildLeftNavigationBarItem {
    UIButton *sortButton = [UIButton buttonWithType:UIButtonTypeSystem];
    sortButton.frame = CGRectMake(0.0f, 0.0f, 31.0f, 24.0f);
    [sortButton setTintColor:[UIColor ofNormalContentColor]];
    [sortButton setImage: [UIImage imageNamed:@"home_mune_icon"] forState:UIControlStateNormal];
    [sortButton addTarget:self action:@selector(didClickLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:sortButton];
    self.navigationItem.leftBarButtonItem = barItem;
}

@end
