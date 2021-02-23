//
//  ObjTableViewController.m
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/22/21.
//

#import "ObjTableViewController.h"

@interface ObjTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ObjTableViewController

- (id) init {
    self = [super init];
    [self setupTabBarItem];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSDictionary * userInfo = @{ @"tabName" : @"Table" };
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateMainName" object:nil userInfo:userInfo];
}

- (void) setupTabBarItem {
    [[self tabBarItem] setImage:[UIImage systemImageNamed:@"tablecells"] ];
    [[self tabBarItem] setTitle:@"Table"];
    [self setTitle:@"Table"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cel =[[UITableViewCell alloc] init];
    [[cel textLabel] setText:@"test2"];
    return cel;
}


@end
