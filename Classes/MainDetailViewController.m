#import "MainDetailViewController.h"
#import	"SettingsModalViewController.h"
#import "DatapointViewController.h"


@implementation MainDetailViewController

@synthesize popoverController;
@synthesize toolbar;
@synthesize settingsModalViewController;

- (void)loadView {
	[super loadView];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern02.png"]]];
	[self setTitle:@"DetailViews"];
	
	self.toolbar = [[UIToolbar alloc] init];
	[self.toolbar setTintColor:[UIColor darkGrayColor]];
	[self.toolbar sizeToFit];
	[self.toolbar setItems:[NSMutableArray arrayWithObjects:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
															[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingsIcon.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(showSettings:)],
															[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil],
															nil]];
	[self.view addSubview:self.toolbar];
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 95.0)];
	[scrollView setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height-47.5)];
	[scrollView setShowsHorizontalScrollIndicator:YES];
	[scrollView setShowsVerticalScrollIndicator:NO];
	[scrollView setContentSize:CGSizeMake(1005,74)];
	[scrollView setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth];
	
	DatapointViewController	*dp1 = [[DatapointViewController alloc] init];
	[dp1.view setCenter:CGPointMake(80, 37)];
	[scrollView addSubview:dp1.view];
	DatapointViewController	*dp2 = [[DatapointViewController alloc] init];
	[dp2.view setCenter:CGPointMake(250,37)];
	[scrollView addSubview:dp2.view];
	DatapointViewController	*dp3 = [[DatapointViewController alloc] init];
	[dp3.view setCenter:CGPointMake(420,37)];
	[scrollView addSubview:dp3.view];
	DatapointViewController	*dp4 = [[DatapointViewController alloc] init];
	[dp4.view setCenter:CGPointMake(590,37)];
	[scrollView addSubview:dp4.view];
	DatapointViewController	*dp5 = [[DatapointViewController alloc] init];
	[dp5.view setCenter:CGPointMake(760,37)];
	[scrollView addSubview:dp5.view];
	DatapointViewController	*dp6 = [[DatapointViewController alloc] init];
	[dp6.view setCenter:CGPointMake(930,37)];
	[scrollView addSubview:dp6.view];

	[self.view addSubview:scrollView];
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
//    NSMutableArray *items = [[toolbar items] mutableCopy];
//    [items removeObjectAtIndex:0];
//    [self.toolbar setItems:items animated:YES];
	[self.toolbar setItems:[NSMutableArray arrayWithObjects:
							[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingsIcon.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(showSettings:)],
							[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil],
							nil]];
	//[items release];
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
