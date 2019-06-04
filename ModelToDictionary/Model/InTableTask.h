//
//  InTableTask.h
//  ModelToDictionary
//
//  Created by apple on 5/6/2019.
//  Copyright © 2019 POSUN-MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class InTableEvent;
NS_ASSUME_NONNULL_BEGIN

@interface InTableTask : NSObject<NSCopying,NSMutableCopying>
+(instancetype)share;
/**将任务加入到队列里并触发执行**/
-(void)pushTask:(InTableEvent*)event;

@end

NS_ASSUME_NONNULL_END
