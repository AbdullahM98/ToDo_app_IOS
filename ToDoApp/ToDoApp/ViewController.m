//
//  ViewController.m
//  ToDoApp
//
//  Created by Abdullah Essam on 02/04/2024.
//

#import "ViewController.h"
#import "addViewController.h"
#import "Task.h"
#import "UserDefaultUtils.h"
#import "TaskDetailsViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySegment;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property NSArray<Task*>* AllList;
@property Task* task;


@end

@implementation ViewController

- (IBAction)filterSegment:(id)sender {
    
    [self filterByPriority];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _AllList =(NSMutableArray*) [UserDefaultUtils retrieveTasksFromUserDefaultsWithKey:@"tasks"];
    if(_AllList == nil){
        _AllList = [NSMutableArray new];
    }
    
    for(_task in _AllList){
        NSLog(@"status for task  in UserDefList is %d",_task.status);
    }
    
    for(_task in _AllList){
        if(_task.status == 0){
            NSLog(@"status is so it will be added to todoList %d",_task.status);

            [_TaskList addObject:_task];
        }
    }
    NSLog(@"array size is %lu",(unsigned long)_TaskList.count);
    [_tableView reloadData];
    _searchBar.delegate = self;
    _searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    //[self retrieveTasksFromUserDefaultsWithKey:@"tasks"];
    // Do any additional setup after loading the view.
}



-(void)viewWillAppear:(BOOL)animated{
    _AllList = [UserDefaultUtils retrieveTasksFromUserDefaultsWithKey:@"tasks"];
    NSLog(@"restored array size is %d", _AllList.count);
    _TaskList = [NSMutableArray new];
    for(_task in _AllList){
        if(_task.status == 0){
            NSLog(@"status is %d",_task.status);

            [_TaskList addObject:_task];
        }
    }
    NSLog(@"array size is ON WILL APPEAR %lu",(unsigned long)_TaskList.count);
    for(_task in _TaskList){
        NSLog(@"status for task in todo %d",_task.status);
    }
    [_tableView reloadData];
}





- (IBAction)addToBtn:(id)sender {
    addViewController* addSheet  =[self.storyboard instantiateViewControllerWithIdentifier:@"addViewController"];
   addSheet.addScr = self;
    [self.navigationController presentViewController:addSheet animated:YES completion:nil];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_TaskList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
 
    cell.textLabel.text = [_TaskList objectAtIndex:indexPath.row].name;
    cell.detailTextLabel.text=[_TaskList[indexPath.row] desc];
    switch([_TaskList[indexPath.row]priority]){
        case 0:
            cell.imageView.image=[UIImage imageNamed:@"check"];
            break;
        case 1:
            cell.imageView.image=[UIImage imageNamed:@"file"];
            break;
        default:
            cell.imageView.image=[UIImage imageNamed:@"important"];
            break;
    }
    NSLog(@"hereeeee status within cell creation %d",[_TaskList objectAtIndex:indexPath.row].status);
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TaskDetailsViewController *viewC = [self.storyboard
                                        instantiateViewControllerWithIdentifier:@"taskDetailsViewController"];
    viewC.sender = self;
    viewC.status = 0;
    viewC.indexAtArray = indexPath.row ;
    [viewC setTask:[_TaskList objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:viewC animated:YES];
}

-(void) addTasks :(NSMutableArray<Task*>*)tasks {
    _AllList = [NSArray arrayWithArray:tasks];
    NSLog(@"restored array size is %d", _AllList.count);
    _TaskList = [NSMutableArray new];
    for(_task in _AllList){
        if(_task.status == 0){
            NSLog(@"status is %d",_task.status);

            [_TaskList addObject:_task];
        }
    }
    NSLog(@"array size in ON Add Task %d",_TaskList.count);
    
    [_tableView reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray* tempArr = [NSMutableArray arrayWithArray:_AllList];
    int index = [tempArr indexOfObject:[_TaskList objectAtIndex:indexPath.row] ];
    [_TaskList removeObjectAtIndex:indexPath.row];
    [tempArr removeObjectAtIndex:index];
    NSLog(@"array size in ON Add Task %d",_TaskList.count);

    [UserDefaultUtils storeTasksInUserDefaults:tempArr withKey:@"tasks"];
    [_tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
}

-(void) filterByPriority{
    int selectedIndex = _prioritySegment.selectedSegmentIndex;
     switch (selectedIndex) {
         case 0:{
             NSArray<Task *> *filteredTasks = [UserDefaultUtils filterByPriority:_TaskList withInt:1];
             _TaskList = [filteredTasks mutableCopy];
             [self.tableView reloadData];
         }
             break;
         case 1:{
             NSArray<Task *> *filteredTasks = [UserDefaultUtils filterByPriority:_TaskList withInt:1];
             NSArray<Task *> *lowPriority = [UserDefaultUtils filterByPriority:_TaskList withInt:0];
             _TaskList = [lowPriority mutableCopy];
             [self.tableView reloadData];
         }
             break;
         case 2:{
             NSArray<Task *> *filteredTasks = [UserDefaultUtils filterByPriority:_TaskList withInt:1];
             NSArray<Task *> *medPriority = [UserDefaultUtils filterByPriority:_TaskList withInt:1];
             _TaskList = [medPriority mutableCopy];
             [self.tableView reloadData];
         }
             break;
         case 3:{
             NSArray<Task *> *filteredTasks = [UserDefaultUtils filterByPriority:_TaskList withInt:1];
             NSArray<Task *> *highPriority = [UserDefaultUtils filterByPriority:_TaskList withInt:2];
             _TaskList = [highPriority mutableCopy];
             [self.tableView reloadData];
         }
             break;
         
         default:
             break;
     }
}



@end
