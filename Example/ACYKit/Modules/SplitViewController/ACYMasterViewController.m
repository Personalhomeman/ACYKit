//
//  ACYMasterViewController.m
//  ACYKit
//
//  Created by Arthur Qiu on 23/04/2017.
//  Copyright © 2017 Arthur Liu. All rights reserved.
//

#import "ACYMasterViewController.h"
#import "ACYDetailViewController.h"

@interface ACYMasterViewController ()

@end

@implementation ACYMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.acy_shouldCollapseDetailViewController = YES;
    
    self.view.backgroundColor = [UIColor orangeColor];
    
	[self.tableView acy_alwaysShowHorizontalScrollIndicator:YES];
	[self.tableView acy_alwaysShowVerticalScrollIndicator:YES];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"cell"];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                                            forIndexPath:indexPath];
    
    cell.textLabel.text = [@(indexPath.row) stringValue];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    self.acy_shouldCollapseDetailViewController = NO;
    
    [self.splitViewController showDetailViewController:self.acy_detailViewController
                                                sender:nil];

}


#pragma mark - Private Methods




@end
