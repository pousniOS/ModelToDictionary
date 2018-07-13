//
//  NSObject+Dictionary.m
//  ModelToDictionary
//
//  Created by POSUN-MAC on 2018/7/13.
//  Copyright © 2018年 POSUN-MAC. All rights reserved.
//

#import "NSObject+Dictionary.h"
#import <objc/runtime.h>

@implementation NSObject (Dictionary)
#pragma makr - Model转Dictionary
-(NSDictionary *)toDictionary{
    NSMutableDictionary *mutableDictionary=[[NSMutableDictionary alloc] init];
    NSArray *propertyArray=[self propertyArray];
    if ([NSStringFromClass(self.class) isEqualToString:@"NSObject"]) {
        return nil;
    }
    else if([self isKindOfClass:[NSDictionary class]]){
        return (NSDictionary*)self;
    }
    for (NSInteger i=0; i<propertyArray.count; i++){
        NSString *key=propertyArray[i];
        id value=[self valueForKey:key];
        if ([value isKindOfClass:[NSNumber class]]) {
            value = [NSString stringWithFormat:@"%@",value];
        }
        if ([value isKindOfClass:[NSString class]]){
            if ([value isEqualToString:@"(null)"]) {
                value = @"";
            }
            if (![value length]||!value){

            }else{
                if ([key isEqualToString:@"Id"]){
                    [mutableDictionary setObject:value forKey:@"id"];
                }else{
                    [mutableDictionary setObject:value forKey:key];
                }
            }
        }
        else if([value isKindOfClass:[NSArray class]]){
            if (![value count]){
            } else if ([[value firstObject] isKindOfClass:[NSString class]]) {
                [mutableDictionary setObject:value forKey:key];
            }else{
                NSMutableArray *mutableArray=[[NSMutableArray alloc] init];
                NSArray *array=value;
                for (NSInteger i=0; i<array.count; i++){
                    id object=array[i];
                    NSDictionary *dic =[object toDictionary];
                    if (dic) {
                        [mutableArray addObject:dic];
                    }else{
                    }
                }
                [mutableDictionary setObject:mutableArray forKey:key];
            }
        }else{
            if (!value){
            }else{
                NSDictionary  *dic=[value toDictionary];
                if (dic) {
                    [mutableDictionary setObject:dic forKey:key];
                }
                else{
                }
            }
        }
    }
    return mutableDictionary;
}
#pragma mark - 获取成员变量名
-(NSArray *)propertyArray{
    if ([self isKindOfClass:[NSDictionary class]]) {
        return [(NSDictionary*)self allKeys];
    } else {
        NSMutableArray *propertyArray=[[NSMutableArray alloc] init];
        unsigned int propsCount;
        objc_property_t *props = class_copyPropertyList([self class], &propsCount);
        for(int i = 0;i < propsCount; i++){
            objc_property_t  prop = props[i];
            NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
            
            NSString *attributes =[NSString stringWithUTF8String:property_getAttributes(prop)];
            NSLog(@"%@",attributes);
            NSLog(@"%@",attributes);

            
            [propertyArray addObject:propName];
        }
        free(props);
        return propertyArray;
    }
}
@end
