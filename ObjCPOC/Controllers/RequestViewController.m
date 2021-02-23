//
//  RequestViewController.m
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/12/21.
//

#import "RequestViewController.h"
#import "Api.h"

@interface RequestViewController ()
@property (weak, nonatomic) IBOutlet UITextField *endpoindField;
@property (weak, nonatomic) IBOutlet UITextView *resultRequestField;

@end

@implementation RequestViewController

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
    NSDictionary * userInfo = @{ @"tabName" : @"Request" };
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateMainName" object:nil userInfo:userInfo];
}

- (void) setupTabBarItem {
    [[self tabBarItem] setImage:[UIImage systemImageNamed:@"network"] ];
    [[self tabBarItem] setTitle:@"Request"];
    [self setTitle:@"Request"];
}

- (IBAction)onRequestGet:(id)sender {
    [Api getRequest:_endpoindField.text headers:nil parameters:nil onCompleted:^(NSURLResponse * _Nonnull response, NSData * _Nonnull data, NSError * _Nonnull error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_resultRequestField.text = [NSString stringWithUTF8String:[data bytes]];
        });
        
        
    }];
}

@end
