//
//  InProgressViewController.m
//  ToDoApp
//
//  Created by Abdullah Essam on 02/04/2024.
//

#import "InProgressViewController.h"
#import "UserDefaultUtils.h"
#import "TaskDetailsViewController.h"
@interface InProgressViewController ()
@property (weak, nonatomic) IBOutlet UITableView *inProgressTableView;
@property NSMutableArray<Task*>* tasksList;
@end

@implementation InProgressViewController

   

- (void)viewDidLoad {
    [super viewDidLoad];
   // _inProgressList = [NSMutableArray new];
    _tasksList = [UserDefaultUtils retrieveTasksFromUserDefaultsWithKey:@"tasks"];
    _inProgressList = [NSMutableArray new];
    if(_tasksList == nil){
        NSLog(@"here");
        _tasksList = [NSMutableArray new];
    }
   
}

-(void) viewWillAppear:(BOOL)animated{
    for(int i=0; i< _tasksList.count;i++){
        if([_tasksList objectAtIndex:i].status == 1){
            NSLog(@"status is %d",[_tasksList objectAtIndex:i].status);

            [_inProgressList addObject:[_tasksList objectAtIndex:i]];
            [_inProgressTableView reloadData];
        }
    }
    NSLog(@"array size is %d",_inProgressList.count);
    [_inProgressTableView reloadData];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    TaskDetailsViewController *viewC = [self.storyboard instantiateViewControllerWithIdentifier:@"taskDetailsViewController"];
//    viewC.task = [_inProgressList objectAtIndex:indexPath.row];
//    [self.navigationController pushViewController:viewC animated:YES];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TaskDetailsViewController * TDVC = [self.storyboard instantiateViewControllerWithIdentifier:@"taskDetailsViewController"];
    printf("%ld",indexPath.row);
    TDVC.task = [_inProgressList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:TDVC animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_inProgressList count];
}
- (IBAction)filterSegment:(id)sender {
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   

    UITableViewCell *cell = [_inProgressTableView dequeueReusableCellWithIdentifier:@"myCell2" forIndexPath:indexPath];
    
 
    cell.textLabel.text = [_inProgressList objectAtIndex:indexPath.row].name;
    cell.detailTextLabel.text=[_inProgressList[indexPath.row] desc];
    switch([_inProgressList[indexPath.row]priority]){
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
    
    return cell;
}
-(void) ReloadData{
    [_inProgressTableView reloadData];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_inProgressList removeObjectAtIndex:indexPath.row];
   [UserDefaultUtils storeTasksInUserDefaults:_inProgressList withKey:@"tasks"];
    [_inProgressTableView reloadData];
}

@end
