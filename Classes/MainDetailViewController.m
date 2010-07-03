#import "MainDetailViewController.h"
#import	"SettingsModalViewController.h"


@implementation MainDetailViewController

@synthesize popoverController;
@synthesize toolbar;
@synthesize settingsModalViewController;

- (void)loadView {
	self.view = [[UIView alloc] init];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern02.png"]]];
	[self setTitle:@"DetailViews"];
	self.toolbar = [[UIToolbar alloc] init];
	[self.toolbar setTintColor:[UIColor darkGrayColor]];
	[self.toolbar sizeToFit];
	[self.toolbar setItems:[NSMutableArray arrayWithObjects:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
															[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(showSettings:)],
															[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
															nil]];
	[self.view addSubview:self.toolbar];
}

- (void)showSettings:(id)sender  {
	self.settingsModalViewController = [[SettingsModalViewController alloc] init];
	UINavigationController *settingsNavigationViewController = [[UINavigationController alloc] initWithRootViewController:self.settingsModalViewController];
	[[settingsNavigationViewController navigationBar] setTintColor:[UIColor darkGrayColor]];
	[settingsNavigationViewController setModalPresentationStyle:UIModalPresentationFormSheet];
	[[self splitViewController] presentModalViewController:settingsNavigationViewController animated:YES];
}


- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc {
	barButtonItem.title = @"RootView";
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
	[self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = pc;
}


// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController: (UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    NSMutableArray *items = [[toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [self.toolbar setItems:items animated:YES];
	[items release];
    self.popoverController = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[settingsModalViewController release];
	[toolbar release];
	[popoverController release];
    [super dealloc];
}


@end
