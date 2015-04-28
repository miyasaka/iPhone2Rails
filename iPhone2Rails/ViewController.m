//
//  ViewController.m
//  iPhone2Rails
//
//  Created by m.masashi on 2015/04/16.
//  Copyright (c) 2015年 m.masashi. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initialize];
}

- (void)initialize
{
    self.tableViewNameList.dataSource = self.tableViewNameList;
    self.tableViewNameList.delegate = self.tableViewNameList;

    self.txtImp.delegate = self;
    [self.txtImp becomeFirstResponder];
    self.txtImp.placeholder = @"登録したい名前";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#define NAMELISTURL @"http://dev-gmo.charlie-s.jp:3000/sample2s.json"

- (IBAction)postData:(id)sender {

    // redy for send parameter
    NSDictionary *params = [NSDictionary dictionaryWithObject:self.txtImp.text forKey:@"sample2[col1]"];
    
    //HTTP
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:NAMELISTURL parameters:params
          success:^(AFHTTPRequestOperation *opertion, id responseObject){
              // success
              NSLog(@"success: %@", responseObject);
          }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error){
            // failed
            NSLog(@"error: %@", error);
          }];
}

- (IBAction)getData:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:NAMELISTURL parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject){
             NSLog(@"success: %@", responseObject);
             
             NSMutableArray *names = [NSMutableArray array];
             for (NSDictionary *jsonObject in responseObject){
                 
                 [names addObject:[jsonObject objectForKey:@"col1"]];
             }
             NSLog(@"miya-1:%@",names);
             self.tableViewNameList.nameList = names;
             [self.tableViewNameList reloadData];
             NSLog(@"miya-2:%@",names);
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error){
             NSLog(@"error: %@",error);
         }];
}

- (IBAction)searchData:(id)sender {
}

- (BOOL) textFieldShouldReturn:(UITextField *)theTextField
{
    if (theTextField == self.txtImp){
        [theTextField resignFirstResponder];
    }
    return YES;
}
@end
