//
//  TestSubToDicModel.m
//  ModelToDictionaryTests
//
//  Created by apple on 2/6/2019.
//  Copyright © 2019 POSUN-MAC. All rights reserved.
//

#import "TestSubToDicModel.h"

@implementation TestSubToDicModel

-(instancetype)initTest{
    if (self=[super init]) {
        _integer=10;
        _Float=23.5f;
        _Double=34.98;
        _dictionary=@{
                      @"dictionary":@"dictionary",
                      };
        _mutableDictionary=[@{
                              @"mutableDictionary":@"mutableDictionary",
                              } mutableCopy];
        _string=@"string";
        _mutableString=[@"mutableString" mutableCopy];
        _mutableArray =[@[] mutableCopy];
        _array=@[];
    }
    return self;
}
@end
