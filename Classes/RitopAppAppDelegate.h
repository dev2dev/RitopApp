#import <UIKit/UIKit.h>


@class SplashScreenViewController;
@class MainSplitViewController;
@class MainRootViewController;
@class MainDetailViewController;

@interface RitopAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SplashScreenViewController *splashScreenViewController;
	MainSplitViewController *mainSplitViewController;
	MainRootViewController *mainRootViewController;
	MainDetailViewController *mainDetailViewController;
	UINavigationController *mainRootNavigationController;
	NSTimer *splashScreenTimer;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) SplashScreenViewController *splashScreenViewController;
@property (nonatomic, retain) MainSplitViewController *mainSplitViewController;
@property (nonatomic, retain) MainRootViewController *mainRootViewController;
@property (nonatomic, retain) MainDetailViewController *mainDetailViewController;
@property (nonatomic, retain) UINavigationController *mainRootNavigationController;
@property (nonatomic, retain) NSTimer *splashScreenTimer;

- (void)dismissSplashScreen:(id)sender;

@end

