//
//  DoneViewController.m
//  ToDoApp
//
//  Created by Abdullah Essam on 02/04/2024.
//

#import "DoneViewController.h"
#import "UserDefaultUtils.h"
@interface DoneViewController ()
@property (weak, nonatomic) IBOutlet UITableView *doneTableView;
@property NSMutableArray<Task*>* allTasks;
@end

@implementation DoneViewController
static NSString* DoneTag = @"tasks";

- (void)viewDidLoad {
    [super viewDidLoad];
    _allTasks = [UserDefaultUtils retrieveTasksFromUserDefaultsWithKey:DoneTag];
    _doneList = [NSMutableArray new];
    if(_allTasks == nil){
        NSLog(@"here");
        _allTasks = [NSMutableArray new];
    }
    for(int i=0; i< _allTasks.count;i++){
        if([_allTasks objectAtIndex:i].status == 2){
            [_doneList addObject:[_allTasks objectAtIndex:i]];
            [_doneTableView reloadData];
        }
    }
    NSLog(@"array size is %d",_doneList.count);
    [_doneTableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_doneList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   

    UITableViewCell *cell = [_doneTableView dequeueReusableCellWithIdentifier:@"myCell3" forIndexPath:indexPath];
    
 
    cell.textLabel.text = [_doneList objectAtIndex:indexPath.row].name;
    cell.detailTextLabel.text=[_doneList[indexPath.row] desc];
    switch([_doneList[indexPath.row]priority]){
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
- (IBAction)filterSegment:(id)sender {
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_doneList removeObjectAtIndex:indexPath.row];
   [UserDefaultUtils storeTasksInUserDefaults:_doneList withKey:DoneTag];
    [_doneTableView reloadData];
}


@end
