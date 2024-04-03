//
//  addViewController.m
//  ToDoApp
//
//  Created by Abdullah Essam on 02/04/2024.
//

#import "addViewController.h"
#import "Task.h"
#import "addDelegate.h"
#import "UserDefaultUtils.h"
@interface addViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *descriptionText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *statusSegment;
@property Task* task;
@property NSArray<Task*>* tasksList ;
@property NSMutableArray<Task*>* mutableTasksList ;
@end

@implementation addViewController


- (void)viewDidLoad {
    [super viewDidLoad];

}
- (void)viewWillAppear:(BOOL)animated{
    _tasksList = [UserDefaultUtils retrieveTasksFromUserDefaultsWithKey:@"tasks"];

    if(_tasksList == nil){
        _tasksList = [NSArray new];
        NSLog(@"created an array ");
    }
    _mutableTasksList = [NSMutableArray arrayWithArray: _tasksList];
    [_statusSegment removeSegmentAtIndex:2 animated:YES];
    [_statusSegment removeSegmentAtIndex:1 animated:YES];
}

- (IBAction)SaveBtn:(id)sender {
    NSDate *currentDate = [NSDate date];
    _task = [Task new];
    _task.name = _nameText.text;
    _task.desc = _descriptionText.text;
    _task.date = currentDate ;
    _task.priority = _prioritySegment.selectedSegmentIndex;
    _task.status = _statusSegment.selectedSegmentIndex;
    
    [_mutableTasksList addObject:_task];
    
    [_addScr addTasks:_mutableTasksList];
    
    NSLog(@"mutable array is %d",_mutableTasksList);
    [UserDefaultUtils storeTasksInUserDefaults:_mutableTasksList withKey:@"tasks"];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}










/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)statusSegment:(id)sender {
}

- (IBAction)prioritySegment:(id)sender {
}

- (IBAction)descText:(id)sender {
}

- (IBAction)titleText:(id)sender {
}
@end
