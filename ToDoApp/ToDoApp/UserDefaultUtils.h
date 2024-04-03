//
//  UserDefaultUtils.h
//  ToDoApp
//
//  Created by Abdullah Essam on 03/04/2024.
//

#import <Foundation/Foundation.h>
#import "Task.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserDefaultUtils : NSObject
+ (void)storeTasksInUserDefaults:(NSArray *)tasks withKey:(NSString *)key;
+ (NSArray *)retrieveTasksFromUserDefaultsWithKey:(NSString *)key ;

+(NSArray<Task* > *)filterByPriority:(NSArray<Task *> *)tasks withInt:(int)filteredKey;
@end

NS_ASSUME_NONNULL_END
