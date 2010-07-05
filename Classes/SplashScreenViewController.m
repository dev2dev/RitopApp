#import "SplashScreenViewController.h"


@implementation SplashScreenViewController

@synthesize rittmeyerLogo;

- (void)loadView {
	self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[self.view setBackgroundColor:[UIColor darkGrayColor]];
	[self.view setAutoresizesSubviews:YES];
	[self.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
	
	self.rittmeyerLogo = [[UILabel alloc] initWithFrame:CGRectZero];
	[self.rittmeyerLogo setText:@"rittmeyer"];
	[self.rittmeyerLogo setFont:[UIFont boldSystemFontOfSize:50.0]];
	[self.rittmeyerLogo setTextAlignment:UITextAlignmentCenter];
	[self.rittmeyerLogo setBackgroundColor:[UIColor clearColor]];
	[self.rittmeyerLogo setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin];
	[self.rittmeyerLogo sizeToFit];
	[self.rittmeyerLogo setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
	[self.view addSubview:self.rittmeyerLogo];
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
