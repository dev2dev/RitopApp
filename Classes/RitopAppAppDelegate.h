//
//  RitopAppAppDelegate.h
//  RitopApp
//
//  Created by Toni Suter on 29.06.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RitopAppViewController;

@interface RitopAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RitopAppViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RitopAppViewController *viewController;

@end

