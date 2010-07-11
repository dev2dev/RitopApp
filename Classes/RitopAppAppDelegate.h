#import <UIKit/UIKit.h>


@class MainSplitViewController;
@class MainRootViewController;
@class MainDetailViewController;

@interface RitopAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MainSplitViewController *mainSplitViewController;
	MainRootViewController *mainRootViewController;
	MainDetailViewController *mainDetailViewController;
	UINavigationController *mainRootNavigationController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) MainSplitViewController *mainSplitViewController;
@property (nonatomic, retain) MainRootViewController *mainRootViewController;
@property (nonatomic, retain) MainDetailViewController *mainDetailViewController;
@property (nonatomic, retain) UINavigationController *mainRootNavigationController;

@end

