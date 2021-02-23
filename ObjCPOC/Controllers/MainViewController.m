//
//  MainViewController.m
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/12/21.
//

#import "MainViewController.h"
#import "RequestViewController.h"
#import "LocationViewController.h"
#import "ScannerViewController.h"
#import "ObjTableViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Request"];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"updateMainName" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *tabName = [note userInfo][@"tabName"];
            [self setTitle:tabName];
        });
    }];
    
    RequestViewController *requestViewController = [RequestViewController new];
    LocationViewController *locationViewController = [[LocationViewController alloc] init];
    ScannerViewController *scannerViewController = [[ScannerViewController alloc] init];
    ObjTableViewController *objTableViewController = [[ObjTableViewController alloc] init];
    
    NSMutableArray *dd;
    
    [dd addObject:nil];
    
    if (dd) {
        NSLog(@"##");
    } else {
        NSLog(@"##DDD");
    }
    
    
    NSArray *viewControllers = [NSArray arrayWithObjects:requestViewController,locationViewController,scannerViewController,objTableViewController,nil];
    
    [self setViewControllers:viewControllers animated:true];
}

@end
