//
//  SafeTableViewController.m
//  Objc-UI
//
//  Created by Alexcai on 2018/8/18.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

#import "SafeTableViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface SafeTableViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *sa_tableView;

@end

@implementation SafeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sa_tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(startRequest)];
    
    self.sa_tableView.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
}

#pragma mark - Simulate request
- (void)startRequest{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.sa_tableView.mj_header endRefreshing];
    });
}

- (void)loadMore{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.sa_tableView.mj_footer endRefreshingWithNoMoreData];
    });
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sa"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sa"];
    }
    cell.contentView.backgroundColor = UIColor.orangeColor;
    cell.textLabel.text = @(indexPath.row).stringValue;
    cell.imageView.image = [UIImage imageNamed:@"h7"];
    
    return cell;
}








@end
