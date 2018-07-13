//
//  ViewController.m
//  ModelToDictionary
//
//  Created by POSUN-MAC on 2018/7/13.
//  Copyright © 2018年 POSUN-MAC. All rights reserved.
//

#import "ViewController.h"
#import "TEST.h"
#import "NSObject+Dictionary.h"

@interface ViewController ()

@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /**填写正确的文件路径**/
    NSString *str=[NSString stringWithContentsOfFile:@"/Users/POSUN/Desktop/TestJson.json" encoding:NSUTF8StringEncoding error:nil];
    
    if (str == nil){return;}
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error=nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&error];
    
    TEST *test=[[TEST alloc] init];
    [test setValuesForKeysWithDictionary:dic];
    
    NSLog(@"%@",[test toDictionary]);
    NSLog(@"%@",[test toDictionary]);

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
