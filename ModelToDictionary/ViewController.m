//
//  ViewController.m
//  ModelToDictionary
//
//  Created by POSUN-MAC on 2018/7/24.
//  Copyright © 2018年 POSUN-MAC. All rights reserved.
//

#import "ViewController.h"
#import "TEST.h"
#import "NSObject+Dictionary.h"
#import "TestModel.h"
#import "StudentModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self outPut:[NSString new]];
    [self outPut:[NSString class]];
    
    [self outPut:[NSMutableString new]];
    [self outPut:[NSMutableString class]];
    
    [self outPut:[NSDictionary new]];
    [self outPut:[NSDictionary class]];

    [self outPut:[NSMutableDictionary new]];
    [self outPut:[NSMutableDictionary class]];
    
    [self outPut:[NSArray new]];
    [self outPut:[NSArray class]];
    
    [self outPut:[NSMutableArray new]];
    [self outPut:[NSMutableArray class]];
    
    StudentModel *std=[[StudentModel alloc] init];
    std.name=@"杨越";
    std.stdID=@"000000";
    std.sex=NO;
    std.cls=@"六年级";
    GradeModel *gradModel=[[GradeModel alloc] init];
    gradModel.ID=@"0";
    gradModel.name=@"数学";
    gradModel.fraction=99;
    gradModel.remark=@"考得不错再接再厉";
    
    GradeModel *gradModel1=[[GradeModel alloc] init];
    gradModel1.ID=@"1";
    gradModel1.name=@"语文";
    gradModel1.fraction=60;
    gradModel1.remark=@"要加油哦";
    std.transcript=[@[gradModel,gradModel1] mutableCopy];
    
    NSLog(@"%@",[std toDictionary]);
    
    
//    //给test对象赋值（注意填写正确的文件路径）
    NSString *str=[NSString stringWithContentsOfFile:@"/Users/apple/Desktop/YangYue/ModelToDictionary/TestJson.json" encoding:NSUTF8StringEncoding error:nil];
    
    if (str == nil){return ;}
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error=nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&error];
    TEST *test=[[TEST alloc] init];
    [test setValuesForKeysWithDictionary:dic];
    
    
    
//    //将test对象转换传NSDictionary对象
    NSDictionary *testDic=[test toDictionary];
    NSLog(@"%@",testDic);
//    NSDictionary *testDic=[test toDictionary];
//    NSLog(@"%@",testDic);
//    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

-(void)outPut:(id)obj{
    NSLog(@"%@",NSStringFromClass([obj class]));
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
