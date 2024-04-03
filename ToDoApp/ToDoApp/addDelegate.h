//
//  addDelegate.h
//  ToDoApp
//
//  Created by Abdullah Essam on 02/04/2024.
//

#import <Foundation/Foundation.h>
#import "Task.h"
NS_ASSUME_NONNULL_BEGIN

@protocol addDelegate <NSObject>
-(void) addTasks :(NSMutableArray<Task*>*)tasks;
@end

NS_ASSUME_NONNULL_END
