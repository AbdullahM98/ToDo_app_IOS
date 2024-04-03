//
//  DetailsViewController.m
//  ToDoApp
//
//  Created by Abdullah Essam on 03/04/2024.
//

#import "DetailsViewController.h"
#import "Task.h"
@interface DetailsViewController ()
@property Task* task ;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void) setTask :(Task*)task {
    _task = task ;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
