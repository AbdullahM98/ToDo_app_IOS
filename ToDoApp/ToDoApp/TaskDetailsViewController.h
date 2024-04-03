//
//  TaskDetailsViewController.h
//  ToDoApp
//
//  Created by Abdullah Essam on 03/04/2024.
//

#import <UIKit/UIKit.h>
#import "DetailsDelegate.h"
#import "Task.h"
#import "ReloadDataDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface TaskDetailsViewController : UIViewController <DetailsDelegate>

-(void) setTask:(Task*)task;

@property Task* task ;
@property int status;
@property int indexAtArray ;
@property id<DetailsDelegate> sender ;
@property id<ReloadDataDelegate> reloader ;

@end

NS_ASSUME_NONNULL_END
