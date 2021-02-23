//
//  SceneDelegate.h
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/9/21.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIWindowScene *windowScene;

@property (nonatomic, strong) LoginViewController *LoginViewController;

- (void) setRootViewController:(UIViewController*) viewController;
@end

