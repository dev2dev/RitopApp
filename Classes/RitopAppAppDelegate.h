//
//  RitopAppAppDelegate.h
//  RitopApp
//
//  Created by Toni Suter on 29.06.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SplashScreenViewController;

@interface RitopAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SplashScreenViewController *splashScreenViewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) SplashScreenViewController *splashScreenViewController;

@end

