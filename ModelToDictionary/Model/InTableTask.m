//
//  InTableTask.m
//  ModelToDictionary
//
//  Created by apple on 5/6/2019.
//  Copyright © 2019 POSUN-MAC. All rights reserved.
//

#import "InTableTask.h"
#import "InTableEvent.h"


#ifndef dispatch_queue_async_safe
#define dispatch_queue_async_safe(queue, block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(queue)) == 0) {\
    block();\
} else {\
    dispatch_async(queue, block);\
}
#endif

#ifndef dispatch_main_async_safe
#define dispatch_main_async_safe(block)\
dispatch_queue_async_safe(dispatch_get_main_queue(), block)
#endif


@interface InTableTask()
{
    NSMutableArray  *_taskQueut;
}
@end
@implementation InTableTask

+(instancetype)share{
    static dispatch_once_t onceToken;
    static InTableTask *_inTableTask = nil;
    dispatch_once(&onceToken, ^{
        _inTableTask = [[super allocWithZone:NULL] init];
    });
    return _inTableTask;
}
+(id)allocWithZone:(struct _NSZone *)zone{
    return [InTableTask share];
}
-(id)copyWithZone:(NSZone *)zone{
    return [InTableTask share] ;//return _instance;
}
-(nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    return [InTableTask share];
}
-(instancetype)init{
    if (self = [super init]) {
        _taskQueut = [[NSMutableArray alloc] init];
    }
    return self;
}
-(void)pushTask:(InTableEvent*)event{
    dispatch_main_async_safe(^{
        if (event) {
            [self->_taskQueut insertObject:event atIndex:0];
            [self executionTask:event];
        }
    });
}
-(void)executionTask:(InTableEvent*)event{
    dispatch_main_async_safe(^{
        if (self->_taskQueut.count > 0) {
            NSLog(@"完成%@",event.ID);
            [self popTask];
            [self executionTask:event];
        }
    });
}
-(void)popTask{
    dispatch_main_async_safe(^{
        if (self->_taskQueut.count>0) {
            [self->_taskQueut removeLastObject];
        }
    });
}
@end
