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
#import <objc/runtime.h>
#import "TestModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([TestModel class], &propsCount);
    for(int i = 0;i < propsCount; i++){
        objc_property_t  prop = props[i];
        const char * property_attr = property_getAttributes(prop);
        const char * name=property_getName(prop);
        printf("%s---%s\n",name,property_attr);

    }
    free(props);

    
    
//    //给test对象赋值（注意填写正确的文件路径）
//    NSString *str=[NSString stringWithContentsOfFile:@"/Users/POSUN/Documents/ModelToDictionary/TestJson.json" encoding:NSUTF8StringEncoding error:nil];
//
//    if (str == nil){return ;}
//    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *error=nil;
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
//                                                        options:NSJSONReadingMutableContainers
//                                                          error:&error];
//    TEST *test=[[TEST alloc] init];
//    [test setValuesForKeysWithDictionary:dic];
//
//    //将test对象转换传NSDictionary对象
//    NSDictionary *testDic=[test toDictionary];
//    NSLog(@"%@",testDic);
//    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
