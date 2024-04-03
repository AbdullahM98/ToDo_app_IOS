//
//  InProgressViewController.h
//  ToDoApp
//
//  Created by Abdullah Essam on 02/04/2024.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "ReloadDataDelegate.h"
#import "DetailsDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface InProgressViewController : UIViewController <UITableViewDelegate , UITableViewDataSource , ReloadDataDelegate >
 
@property NSMutableArray<Task*>* inProgressList ;
@property id<DetailsDelegate> addScr;

@end

NS_ASSUME_NONNULL_END
