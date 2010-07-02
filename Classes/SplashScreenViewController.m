    //
//  SplashScreenViewController.m
//  RitopApp
//
//  Created by Toni Suter on 02.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SplashScreenViewController.h"


@implementation SplashScreenViewController

@synthesize rittmeyerLogo;

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	UIView *localView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	self.rittmeyerLogo = [[UILabel alloc] initWithFrame:CGRectMake(259,472,250,80)];
	[rittmeyerLogo setText:@"rittmeyer"];
	[rittmeyerLogo setFont:[UIFont boldSystemFontOfSize:50.0]];
	[rittmeyerLogo setTextAlignment:UITextAlignmentCenter];
	[rittmeyerLogo setBackgroundColor:[UIColor clearColor]];
	[localView addSubview:rittmeyerLogo];
	
	[localView setBackgroundColor:[UIColor darkGrayColor]];
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
