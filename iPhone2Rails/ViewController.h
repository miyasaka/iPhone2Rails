//
//  ViewController.h
//  iPhone2Rails
//
//  Created by m.masashi on 2015/04/16.
//  Copyright (c) 2015年 m.masashi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableView.h"

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *txtImp;
@property (strong, nonatomic) IBOutlet TableView *tableViewNameList;
@property (strong, nonatomic) IBOutlet UISearchBar *selfSearch;

- (IBAction)postData:(id)sender;

- (IBAction)getData:(id)sender;

- (IBAction)searchData:(id)sender;
@end

