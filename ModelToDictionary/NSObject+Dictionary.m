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
            [propertyArray addObject:propName];

            
            /**获取属性类型**/
            NSString *property_data_type = nil;
            const char * property_attr = property_getAttributes(prop);
            //If the property is a type of Objective-C class, then substring the variable of `property_attr` in order to getting its real type
            if (property_attr[1] == '@') {
                char * occurs1 =  strchr(property_attr, '@');
                char * occurs2 =  strrchr(occurs1, '"');
                char dest_str[40]= {0};
                strncpy(dest_str, occurs1, occurs2 - occurs1);
                char * realType = (char *)malloc(sizeof(char) * 50);
                int i = 0, j = 0, len = (int)strlen(dest_str);
                for (; i < len; i++) {
                    if ((dest_str[i] >= 'a' && dest_str[i] <= 'z') || (dest_str[i] >= 'A' && dest_str[i] <= 'Z')) {
                        realType[j++] = dest_str[i];
                    }
                }
                property_data_type = [NSString stringWithFormat:@"%s", realType];
                free(realType);
            }else {
                char * realType = [self getPropertyRealType:property_attr];
                property_data_type = [NSString stringWithFormat:@"%s", realType];
            }
            NSLog(@"%@",property_data_type);
            
            
        }
        free(props);
        return propertyArray;
    }
}
- (char *)getPropertyRealType:(const char *)property_attr {
    char * type;
    char t = property_attr[1];
    if (strcmp(&t, @encode(char)) == 0) {
        type = "char";
    } else if (strcmp(&t, @encode(int)) == 0) {
        type = "int";
    } else if (strcmp(&t, @encode(short)) == 0) {
        type = "short";
    } else if (strcmp(&t, @encode(long)) == 0) {
        type = "long";
    } else if (strcmp(&t, @encode(long long)) == 0) {
        type = "long long";
    } else if (strcmp(&t, @encode(unsigned char)) == 0) {
        type = "unsigned char";
    } else if (strcmp(&t, @encode(unsigned int)) == 0) {
        type = "unsigned int";
    } else if (strcmp(&t, @encode(unsigned short)) == 0) {
        type = "unsigned short";
    } else if (strcmp(&t, @encode(unsigned long)) == 0) {
        type = "unsigned long";
    } else if (strcmp(&t, @encode(unsigned long long)) == 0) {
        type = "unsigned long long";
    } else if (strcmp(&t, @encode(float)) == 0) {
        type = "float";
    } else if (strcmp(&t, @encode(double)) == 0) {
        type = "double";
    } else if (strcmp(&t, @encode(_Bool)) == 0 || strcmp(&t, @encode(bool)) == 0) {
        type = "BOOL";
    } else if (strcmp(&t, @encode(void)) == 0) {
        type = "void";
    } else if (strcmp(&t, @encode(char *)) == 0) {
        type = "char *";
    } else if (strcmp(&t, @encode(id)) == 0) {
        type = "id";
    } else if (strcmp(&t, @encode(Class)) == 0) {
        type = "Class";
    } else if (strcmp(&t, @encode(SEL)) == 0) {
        type = "SEL";
    } else {
        type = "";
    }
    return type;
}
@end
