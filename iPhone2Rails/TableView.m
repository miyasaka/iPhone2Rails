//
//  TableView.m
//  iPhone2Rails
//
//  Created by m.masashi on 2015/04/20.
//  Copyright (c) 2015年 m.masashi. All rights reserved.
//

#import "TableView.h"

@implementation TableView

// TableViewDataSource :必須（データ件数を返す）
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.nameList count];
 
}
// TableViewDataSource :必須（テーブルに表示するデータを返す）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    // mark - miyasaka
    // NSLog(@" tableView :%@",self.nameList);
    cell.textLabel.text = [self.nameList objectAtIndex:indexPath.row];
    return cell;
}

// select deta
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // mark - miyasaka
     NSLog(@"Selected Data-%@",self);
     NSLog(@"Selected Data %ld",indexPath.row);

    //   [self performSelector:@"NameDetail" sender:self];
 //   [self performSegueWithIdentifier:@"NameDetail" sender:self];
}


@end
