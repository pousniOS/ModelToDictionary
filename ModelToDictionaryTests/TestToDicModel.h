//
//  TestToDicModel.h
//  ModelToDictionaryTests
//
//  Created by apple on 2/6/2019.
//  Copyright © 2019 POSUN-MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestSubToDicModel.h"
#import "TestArrayToDicModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TestToDicModel : NSObject
@property(nonatomic,assign)NSInteger integer;
@property(nonatomic,assign)float Float;
@property(nonatomic,assign)double Double;
@property(nonatomic,copy)NSDictionary *dictionary;
@property(nonatomic,copy)NSMutableDictionary *mutableDictionary;
@property(nonatomic,copy)NSString *string;
@property(nonatomic,retain)NSMutableString *mutableString;
@property(nonatomic,retain)NSMutableArray<TestArrayToDicModel *> *mutableArray;
@property(nonatomic,retain)NSArray<TestArrayToDicModel *> *array;
@property(nonatomic,retain)TestSubToDicModel *subToDicModel;


-(instancetype)initTest;

@end

NS_ASSUME_NONNULL_END
