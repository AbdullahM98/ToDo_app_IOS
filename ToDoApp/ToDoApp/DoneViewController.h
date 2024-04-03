//
//  DoneViewController.h
//  ToDoApp
//
//  Created by Abdullah Essam on 02/04/2024.
//

#import <UIKit/UIKit.h>
#import "Task.h"
NS_ASSUME_NONNULL_BEGIN

@interface DoneViewController : UIViewController <UITableViewDelegate , UITableViewDataSource>

@property NSMutableArray<Task*>* doneList ;

@end

NS_ASSUME_NONNULL_END
