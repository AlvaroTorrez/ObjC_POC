//
//  ScannerViewController.m
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/18/21.
//

#import "ScannerViewController.h"

@interface ScannerViewController ()

@end

@implementation ScannerViewController

- (id) init {
    self = [super init];
    [self setupTabBarItem];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated {
    NSDictionary * userInfo = @{ @"tabName" : @"Scanner" };
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateMainName" object:nil userInfo:userInfo];
}

- (void) setupTabBarItem {
    [[self tabBarItem] setImage:[UIImage systemImageNamed:@"scanner"] ];
    [[self tabBarItem] setTitle:@"Scanner"];
    [self setTitle:@"Scanner"];
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
