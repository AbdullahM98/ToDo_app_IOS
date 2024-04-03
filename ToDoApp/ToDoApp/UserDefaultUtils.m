//
//  UserDefaultUtils.m
//  ToDoApp
//
//  Created by Abdullah Essam on 03/04/2024.
//

#import "UserDefaultUtils.h"
#import "Task.h"
@implementation UserDefaultUtils
{
    
}
+ (NSArray *)retrieveTasksFromUserDefaultsWithKey:(NSString *)key {

    NSData* data = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSArray *tasks = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return tasks;
}
+ (void)storeTasksInUserDefaults:(NSArray *)tasks withKey:(NSString *)key {
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:tasks];
    [[NSUserDefaults standardUserDefaults]  setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSArray<Task* > *)filterByPriority:(NSArray<Task *> *)tasks withInt:(int)filteredKey{
    NSMutableArray<Task *> *filteredArray = [NSMutableArray array];
    NSArray<Task *> *loadedTasks = tasks;
    for (Task *task in loadedTasks) {
       
        if (task.priority == filteredKey) {
            [filteredArray addObject:task];
        }
    }
    
    return filteredArray;
}
@end
