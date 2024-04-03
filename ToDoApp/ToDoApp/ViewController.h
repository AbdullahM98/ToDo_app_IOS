//
//  ViewController.h
//  ToDoApp
//
//  Created by Abdullah Essam on 02/04/2024.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "addDelegate.h"

@interface ViewController : UIViewController <UITableViewDelegate , UITableViewDataSource, UISearchBarDelegate>

@property NSMutableArray<Task*>* TaskList ;

@end


