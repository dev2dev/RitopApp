#import "MainDetailViewController.h"


@implementation MainDetailViewController

@synthesize popoverController;
@synthesize toolbar;

- (void)loadView {
	self.view = [[UIView alloc] init];
	[self.view setBackgroundColor:[UIColor darkGrayColor]];
	[self setTitle:@"DetailViews"];
	self.toolbar = [[UIToolbar alloc] init];
	[self.toolbar sizeToFit];
	[self.toolbar setItems:[NSMutableArray arrayWithObjects:nil]];
	[self.view addSubview:self.toolbar];
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
    [super dealloc];
}


@end
