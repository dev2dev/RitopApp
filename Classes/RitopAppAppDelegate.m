#import "RitopAppAppDelegate.h"
#import "MainSplitViewController.h"
#import "MainRootViewController.h"
#import "MainDetailViewController.h"


@implementation RitopAppAppDelegate

@synthesize window;
@synthesize mainSplitViewController;
@synthesize mainRootViewController;
@synthesize mainDetailViewController;
@synthesize mainRootNavigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert)];
	
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	self.mainSplitViewController = [[MainSplitViewController alloc] init];
	self.mainRootViewController = [[MainRootViewController alloc] init];
	self.mainDetailViewController = [[MainDetailViewController alloc] init];
	self.mainRootNavigationController = [[UINavigationController alloc] initWithRootViewController:self.mainRootViewController];
	[[self.mainRootNavigationController navigationBar] setTintColor:[UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1.0]];
	
	
	[self.mainSplitViewController setDelegate:self.mainDetailViewController];
	[self.mainSplitViewController setViewControllers:[NSArray arrayWithObjects:self.mainRootNavigationController, self.mainDetailViewController, nil]];
	
	[window addSubview:self.mainSplitViewController.view];
	[window setAutoresizesSubviews:YES];
    [window makeKeyAndVisible];
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[mainRootNavigationController release];
	[mainDetailViewController release];
	[mainRootViewController release];
	[mainSplitViewController release];
    [window release];
    [super dealloc];
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken
{
	NSLog(@"%@", [[newDeviceToken description] description]);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
	NSLog(@"Error in registration. Error: %@", error);
}





@end
