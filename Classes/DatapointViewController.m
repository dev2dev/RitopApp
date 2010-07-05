#import "DatapointViewController.h"


@implementation DatapointViewController

@synthesize popoverController;

- (void)loadView {
	UIButton *buttonView = [[UIButton alloc] initWithFrame:CGRectMake(0,0,134, 74)];
	[buttonView setBackgroundImage:[UIImage imageNamed:@"datapoint.png"] forState:UIControlStateNormal];
	self.view = buttonView;
	
	UILabel *mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,134,20)];
	[mainLabel setText:@"Titel"];
	[mainLabel setFont:[UIFont boldSystemFontOfSize:20]];
	[mainLabel setBackgroundColor:[UIColor clearColor]];
	[mainLabel setTextAlignment:UITextAlignmentCenter];
	[self.view addSubview:mainLabel];

	UIViewController* popoverContent = [[UIViewController alloc] init];
	UIView* popoverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
	popoverView.backgroundColor = [UIColor darkGrayColor];
	popoverContent.view = popoverView;
	popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 150);
	self.popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
	[popoverView release];
	[popoverContent release];
	
	
	[buttonView addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)buttonPressed:(id)sender  {
	[self.popoverController presentPopoverFromRect:self.view.frame
											inView:[self.view superview]
						  permittedArrowDirections:UIPopoverArrowDirectionDown
										  animated:YES];
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
	[self.popoverController release];
    [super dealloc];
}


@end
