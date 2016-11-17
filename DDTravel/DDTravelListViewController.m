//
//  DDTravelListViewController.m
//  DDTravel
//
//  Created by 杨东正 on 2016/11/15.
//  Copyright © 2016年 dongzheng. All rights reserved.
//

#import "DDTravelListViewController.h"
#import "DDTravelDetailViewController.h"
#import "DDTravelEditViewController.h"

#import "UIViewController+Custom.h"

#import "DDTravelListCell.h"

#import "DDTravelListModel.h"

#import "UIViewController+Custom.h"
#import "UIColor+RGBColor.h"

@interface DDTravelListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *confirmButton;

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, weak) NSString *couponNo;

@end

@implementation DDTravelListViewController

- (instancetype)initWithCouponNo:(NSString *)cpno {
    self = [super init];
    if (self) {
        self.couponNo = cpno;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.title = @"我的行程";
    
    [self setCustomBackgroundColor];
    [self setCustomNavigationBackItem];
    [self setCustomNavigationRightButton:@"编辑" action:@selector(didClickRightButton:)];
    [self buildTableView];
}

- (void)didClickRightButton:(id)sender {
    DDTravelEditViewController *editView = [[DDTravelEditViewController alloc] init];
    [self.navigationController pushViewController:editView animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的行程";
    [self fetchDistributeListFromLocal];
}

- (void)viewWillLayoutSubviews {
    self.tableView.frame = CGRectMake(.0f, .0f, self.view.bounds.size.width, self.view.bounds.size.height);
}

- (void)viewWillDealloc {
    [self removeObserver];
    [self cancelOperations];
}

- (void)dealloc {
    [self removeObserver];
    [self clearSubviews];
    [self clearData];
}

- (void)removeObserver {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.class cancelPreviousPerformRequestsWithTarget:self.tableView];
    [self.class cancelPreviousPerformRequestsWithTarget:self];
}

- (void)cancelOperations {
    
}

- (void)clearSubviews {
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
    self.tableView = nil;
}

- (void)clearData {
    self.dataSource = nil;
}

#pragma mark - Builder
- (void)buildTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

#pragma mark Reload
- (void)fetchDistributeListFromLocal {
    NSMutableArray *data = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        DDTravelListModel *model = [[DDTravelListModel alloc] init];
        model.nickname = @"11月15日 11:20";
        model.receiveTime = @"朝阳区望京街10号望京SOHO";
        model.usedTime = @"朝阳区康营中路康营家园17期";
        [data addObject:model];
    }
    self.dataSource = data;
    [self.tableView reloadData];
}

#pragma mark - UITableView
#pragma mark UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DDTravelListCell *cell = (DDTravelListCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DDTravelListCell class])];
    if (!cell) {
        cell = [[DDTravelListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([DDTravelListCell class])];
    }
    [cell reloadCellWithCouponDistributeData:[self.dataSource objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DDTravelDetailViewController *travelDetail = [[DDTravelDetailViewController alloc] init];
    [self.navigationController pushViewController:travelDetail animated:YES];
}


@end
