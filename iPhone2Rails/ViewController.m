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

    // chacke input data length
    NSString *text = [params objectForKey:@"sample2[col1]"];
    
    // NSLog(@"miya-000:%@",text);
    // to be String Class, NSDictionary class can not bind null value
    if(text.length > 0){
        //HTTP
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        [manager POST:NAMELISTURL parameters:params
         // success
              success:^(AFHTTPRequestOperation *opertion, id responseObject){
                  NSLog(@"success: %@", responseObject);
              }
         // failed
              failure:^(AFHTTPRequestOperation *operation, NSError *error){
                  NSLog(@"error: %@", error);
              }];
    }else{
        NSLog(@"miya-111:");
    }
}

- (IBAction)getData:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:NAMELISTURL parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject){
             // NSLog(@"success: %@", responseObject);
             
             NSMutableArray *names = [NSMutableArray array];
             for (NSDictionary *jsonObject in responseObject){
                 
                 [names addObject:[jsonObject objectForKey:@"col1"]];
             }
             self.tableViewNameList.nameList = names;
             [self.tableViewNameList reloadData];
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error){
             NSLog(@"error: %@",error);
         }];
}

// search from MySQL
- (IBAction)searchData:(id)sender {
    NSMutableString *str_URL = [NSMutableString string];
    [str_URL appendString:NAMELISTURL];
    [str_URL appendString:@"?search="];
    [str_URL appendString:self.txtImp.text];
    // NSLog(@"Input:%@",str_URL);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:str_URL parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject){
             // NSLog(@"success: %@", responseObject);
             
             NSMutableArray *names = [NSMutableArray array];
             for (NSDictionary *jsonObject in responseObject){
                 
                 [names addObject:[jsonObject objectForKey:@"col1"]];
             }
             self.tableViewNameList.nameList = names;
             [self.tableViewNameList reloadData];
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error){
             NSLog(@"error: %@",error);
         }];
}

// search from TableVie
- (IBAction)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Push Search button!!!:");
}

- (BOOL) textFieldShouldReturn:(UITextField *)theTextField
{
    if (theTextField == self.txtImp){
        [theTextField resignFirstResponder];
    }
    return YES;
}
@end
