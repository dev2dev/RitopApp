//
//  RitopAppViewController.m
//  RitopApp
//
//  Created by Toni Suter on 29.06.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "RitopAppViewController.h"

@implementation RitopAppViewController


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

- (void)loadView {
	UIViewController *myViewController1 = [[UIViewController alloc] init];
	UINavigationController *myNavigationController1 = [[UINavigationController alloc] initWithRootViewController:myViewController1];
	[myNavigationController1 setTitle:@"Page 1"];
	UIViewController *myViewController2 = [[UIViewController alloc] init];
	UINavigationController *myNavigationController2 = [[UINavigationController alloc] initWithRootViewController:myViewController2];
	[myNavigationController2 setTitle:@"Page 2"];
	UIViewController *myViewController3 = [[UIViewController alloc] init];
	UINavigationController *myNavigationController3 = [[UINavigationController alloc] initWithRootViewController:myViewController3];
	[myNavigationController3 setTitle:@"Page 3"];
	
	UITabBarController *myTabBarController = [[UITabBarController alloc] init];
	[myTabBarController setViewControllers:[NSArray arrayWithObjects:myNavigationController1, myNavigationController2, myNavigationController3, nil]];
	
	self.view = myTabBarController.view;
}



/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
