#import "SplashScreenViewController.h"


@implementation SplashScreenViewController

@synthesize rittmeyerLogo;

- (void)loadView {
	UIView *localView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	
	self.rittmeyerLogo = [[UILabel alloc] initWithFrame:CGRectMake(1,1,250,80)];
	[rittmeyerLogo setText:@"rittmeyer"];
	[rittmeyerLogo setFont:[UIFont boldSystemFontOfSize:50.0]];
	[rittmeyerLogo setTextAlignment:UITextAlignmentCenter];
	[rittmeyerLogo setBackgroundColor:[UIColor clearColor]];
	[rittmeyerLogo setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin];
	[localView addSubview:rittmeyerLogo];
	
	[localView setBackgroundColor:[UIColor darkGrayColor]];
	[localView setAutoresizesSubviews:YES];
	
	self.view = localView;

	[localView release];
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
	[rittmeyerLogo release];
    [super dealloc];
}


@end
