//
//  LoginViewController.m
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/9/21.
//

#import "LoginViewController.h"
#import "ProtocolAuthService.h"
#import "IoC.h"
#import <SVProgressHUD/SVProgressHUD.h>

#import "UIViewController+General.h"
#import "MainViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation LoginViewController

NSObject<ProtocolAuthService> *authService;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    authService = (NSObject<ProtocolAuthService> *)[[IoC share] resolve:@protocol(ProtocolAuthService)] ;
    
    [SVProgressHUD setOffsetFromCenter:UIOffsetMake([self.view center].x - 15,[self.view center].y)];
}


- (IBAction)OnLogin:(id)sender {
    [SVProgressHUD show];
    [authService authUser:[self.userNameField text] password:[_passwordField text] onCompleted:^(AuthStatus result) {
        switch (result) {
            case AuthStatus_SUCCEEDED: {
                
//                HomeViewController *homeVC = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
//                [homeVC setTitle:@"Home"];
                
                MainViewController *main = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
                
                
                UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:main];
                [self.scene setRootViewController:nc];
                self.errorLabel.hidden = true;
                break;
            }
            case AuthStatus_FAILED: {
                [self.errorLabel setHidden:false];
                break;
            }
            default:
                break;
        }
        [SVProgressHUD dismiss];
    }];
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
