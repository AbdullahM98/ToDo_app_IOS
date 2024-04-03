//
//  DetailsDelegate.h
//  ToDoApp
//
//  Created by Abdullah Essam on 03/04/2024.
//

#import <Foundation/Foundation.h>
#import "Task.h"
NS_ASSUME_NONNULL_BEGIN

@protocol DetailsDelegate <NSObject>
- (void) setTask:(Task*)task ;
@end

NS_ASSUME_NONNULL_END
