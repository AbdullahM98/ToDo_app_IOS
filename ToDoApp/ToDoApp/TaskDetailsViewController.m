//
//  TaskDetailsViewController.m
//  ToDoApp
//
//  Created by Abdullah Essam on 03/04/2024.
//

#import "TaskDetailsViewController.h"
#import "Task.h"
#import "UserDefaultUtils.h"

@interface TaskDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *descText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySegment;
@property NSMutableArray* tasksList ;
@property (weak, nonatomic) IBOutlet UISegmentedControl *statusSegment;
@property NSString* userDefTag;
@end

@implementation TaskDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
 
    
 
}
- (void)viewWillAppear:(BOOL)animated{
    if(_task != nil ){
        _nameText.text = _task.name;
        _descText.text = _task.desc ;
        _prioritySegment.selectedSegmentIndex = _task.priority;
        _statusSegment.selectedSegmentIndex = _task.status;
    }
   _tasksList= [UserDefaultUtils retrieveTasksFromUserDefaultsWithKey:@"tasks"];
    
}

-(void) showAlert{
    UIAlertController* alert = [UIAlertController  alertControllerWithTitle:@"Error Missing Data" message:@"Please Enter All Data" preferredStyle:UIAlertControllerSeverityDefault];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) setTask:(Task*)task{
    _task = task;
}





- (IBAction)SaveBtn:(id)sender {
    _task = [_tasksList objectAtIndex:_indexAtArray];
    _task.name = _nameText.text;
   _task.desc = _descText.text  ;
  _task.priority = (int) _prioritySegment.selectedSegmentIndex ;
  _task.status = _statusSegment.selectedSegmentIndex ;
    
    NSLog(@"task status before save is %d",_task.priority);
    NSLog(@"task status before save is %d",_task.status);
    
//    [_tasksList replaceObjectAtIndex:_indexAtArray withObject:_task];
   [UserDefaultUtils storeTasksInUserDefaults:_tasksList withKey:@"tasks"];
    NSLog(@"task status before save is %d",_task.status);
    [self.navigationController popViewControllerAnimated:YES];
}

        
@end
