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

#import "DDTravelListHeader.h"

#import "UIViewController+Custom.h"

#import "DDTravelListCell.h"

#import "DDTravelListModel.h"

#import "UIViewController+Custom.h"
#import "UIColor+RGBColor.h"

@interface DDTravelListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DDTravelListHeader *headerView;

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
    [self setCustomNavigationRightButton:@"开发票" action:@selector(didClickRightButton:)];
    [self buildTableView];
    [self buildHeaderView];
}

- (void)didClickRightButton:(id)sender {
    DDTravelEditViewController *editView = [[DDTravelEditViewController alloc] init];
    [self.navigationController pushViewController:editView animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的行程";
    self.view.backgroundColor = [UIColor whiteColorForDefaultBackgroundColor];
    
    [self fetchDistributeListFromLocal];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchDistributeListFromLocal];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
    
    self.tableView.frame = CGRectMake(10, .0f, width - 20, self.view.bounds.size.height);
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

- (void)longPressToDo:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gesture locationInView:self.tableView];
        NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:point];
        if(indexPath == nil) return ;
        DDTravelListModel *model = [self.dataSource objectAtIndex:indexPath.row];
        DDTravelEditViewController *editView = [[DDTravelEditViewController alloc] initWithModel:model];
        [self.navigationController pushViewController:editView animated:YES];
    }
}

#pragma mark Reload
- (void)fetchDistributeListFromLocal {
    NSMutableArray *data = [NSMutableArray array];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSArray *dataArray = [ud objectForKey:@"data"];
    for (NSDictionary *info in dataArray) {
        DDTravelListModel *model = [[DDTravelListModel alloc] init];
        model.keyID = [info objectForKey:@"keyID"];
        model.dateString = [info objectForKey:@"dateString"];
        model.startPoint = [info objectForKey:@"startPoint"];
        model.endPoint = [info objectForKey:@"endPoint"];
        model.avatarURL = [info objectForKey:@"avatarURL"];
        model.owner = [info objectForKey:@"owner"];
        model.carType = [info objectForKey:@"carType"];
        model.commentScore = [info objectForKey:@"commentScore"];
        model.orderCount = [info objectForKey:@"orderCount"];
        model.price = [info objectForKey:@"price"];
        model.paiziString = [info objectForKey:@"paizi"];
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
    return 137 + 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DDTravelListModel *model = [self.dataSource objectAtIndex:indexPath.row];
    DDTravelDetailViewController *travelDetail = [[DDTravelDetailViewController alloc] initWithModel:model];
    [self.navigationController pushViewController:travelDetail animated:YES];
}

#pragma mark - Builder
- (void)buildTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    UILongPressGestureRecognizer * longPressGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
    longPressGr.minimumPressDuration = 1.0;
    [self.tableView addGestureRecognizer:longPressGr];
    [self.view addSubview:self.tableView];
}

- (void)buildHeaderView {
    CGFloat width = CGRectGetWidth(self.view.bounds);
    self.headerView = [DDTravelListHeader new];
    self.headerView.frame = CGRectMake(0, 0, width, 39);
    self.tableView.tableHeaderView = self.headerView;
}

@end
