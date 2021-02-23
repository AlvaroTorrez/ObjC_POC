//
//  UIViewController+General.h
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/11/21.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "SceneDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (General)
- (AppDelegate*) app;
- (SceneDelegate*) scene;
@end

NS_ASSUME_NONNULL_END
