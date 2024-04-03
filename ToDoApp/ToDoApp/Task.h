//
//  Task.h
//  ToDoApp
//
//  Created by Abdullah Essam on 02/04/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject <NSCoding>


@property NSString* name ;
@property NSString* desc;
@property int status ;

@property int priority ;
@property NSDate* date ;

@end


NS_ASSUME_NONNULL_END
