//
//  GradeModel.h
//  SQLiteObject_C
//
//  Created by POSUN-MAC on 2018/9/14.
//  Copyright © 2018年 POSUN-MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GradeModel : NSObject
@property(nonatomic,copy)NSString *ID;

@property(nonatomic,copy)NSString *remark;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger fraction;
@end
