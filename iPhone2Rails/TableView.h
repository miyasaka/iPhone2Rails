//
//  TableView.h
//  iPhone2Rails
//
//  Created by m.masashi on 2015/04/20.
//  Copyright (c) 2015年 m.masashi. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface TableView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,retain)NSArray *nameList;

@end

