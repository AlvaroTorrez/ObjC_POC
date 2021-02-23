//
//  UIViewController+General.m
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/11/21.
//

#import "UIViewController+General.h"

@implementation UIViewController (General)

- (AppDelegate*) app
{
    return (AppDelegate*) [[UIApplication sharedApplication] delegate];
}

- (SceneDelegate*) scene
{
    //return [[[[UIApplication sharedApplication] openSessions].allObjects[0] scene] delegate];
    
    return (SceneDelegate*) self.view.window.windowScene.delegate;
}

@end
