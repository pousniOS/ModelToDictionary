//
//  TestModel.h
//  ModelToDictionary
//
//  Created by POSUN-MAC on 2019/3/29.
//  Copyright © 2019 POSUN-MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject

@property(nonatomic,assign)char char_test;
@property(nonatomic,assign)int int_test;
@property(nonatomic,assign)short short_test;
@property(nonatomic,assign)long long_test;
@property(nonatomic,assign)unsigned char unsigned_char_test;
@property(nonatomic,assign)unsigned int unsigned_int_test;
@property(nonatomic,assign)unsigned short unsigned_short_test;
@property(nonatomic,assign)unsigned long unsigned_long_test;

@property(nonatomic,assign)unsigned long long  unsigned_long_long_test;
@property(nonatomic,assign)float float_test;
@property(nonatomic,assign)double double_test;
@property(nonatomic,assign)BOOL BOOL_test;
//@property(nonatomic,assign)void void_test;
@property(nonatomic,assign)char * char_xtest;
@property(nonatomic,assign)SEL * SEL_test;
@property(nonatomic,assign)id  id_test;
@property(nonatomic,assign)Class Class_test;
@property(nonatomic,assign)NSArray *NSArray_test;
@property(nonatomic,assign)NSMutableArray *NSMutableArray_test;
@property(nonatomic,assign)NSObject *NSObject_test;
@property(nonatomic,assign)NSDictionary *NSDictionary_test;
@property(nonatomic,assign)NSMutableDictionary *NSMutalbleDictionary_test;
@property(nonatomic,assign)NSString *NSString_test;
@property(nonatomic,assign)NSMutableString *NSMutalbleString_test;
@property(nonatomic,assign)NSValue *NSValue_test;
@property(nonatomic,assign)NSNumber *NSNumber_test;





@end

NS_ASSUME_NONNULL_END
