//
//  main.m
//  ModelToDictionary
//
//  Created by POSUN-MAC on 2018/7/24.
//  Copyright © 2018年 POSUN-MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TEST.h"
#import "NSObject+Dictionary.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //给test对象赋值（注意填写正确的文件路径）
        NSString *str=[NSString stringWithContentsOfFile:@"/Users/POSUN/Documents/ModelToDictionary/ModelToDictionary/TestJson.json" encoding:NSUTF8StringEncoding error:nil];
        
        if (str == nil){return 0;}
        NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error=nil;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&error];
        TEST *test=[[TEST alloc] init];
        [test setValuesForKeysWithDictionary:dic];
        
        //将test对象转换传NSDictionary对象
        NSDictionary *testDic=[test toDictionary];
        NSLog(@"%@",testDic);
    }
    return 0;
}
