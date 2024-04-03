//
//  Task.m
//  ToDoApp
//
//  Created by Abdullah Essam on 02/04/2024.
//

#import "Task.h"

@implementation Task

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.desc forKey:@"desc"];
    [coder encodeInteger:self.status forKey:@"status"];
    [coder encodeInteger:self.priority forKey:@"priority"];
    [coder encodeObject:self.date forKey:@"date"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.desc = [coder decodeObjectForKey:@"desc"];
        self.status = [coder decodeIntegerForKey:@"status"];
        self.priority = [coder decodeIntegerForKey:@"priority"];
        self.date = [coder decodeObjectForKey:@"date"];
    }
    return self;
}

//- (BOOL)isEqual:(Task*)otherTask {
//    if (self == otherTask) {
//        return YES;
//    }
//    
//    if (![otherTask isKindOfClass:[self class]]) {
//        return NO;
//    }
//        
//    return [self.name isEqualToString:otherTask.name] &&
//           [self.desc isEqualToString:otherTask.desc] &&
//           [self.status isEqualToString:otherTask.status] &&
//           self.priority == otherTask.priority &&
//           [self.date isEqualToDate:otherTask.date];
//}

@end
