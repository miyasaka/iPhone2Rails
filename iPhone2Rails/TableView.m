//
//  TableView.m
//  iPhone2Rails
//
//  Created by m.masashi on 2015/04/20.
//  Copyright (c) 2015年 m.masashi. All rights reserved.
//

#import "TableView.h"

@implementation TableView

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.nameList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    NSLog(@" tableView :%@",self.nameList);
    cell.textLabel.text = [self.nameList objectAtIndex:indexPath.row];
    return cell;
}

@end
