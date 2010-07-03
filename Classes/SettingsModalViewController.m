    //
//  SettingsModalViewController.m
//  RitopApp
//
//  Created by Toni Suter on 03.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SettingsModalViewController.h"


@implementation SettingsModalViewController


- (void)loadView {
	self.view = [[UIView alloc] init];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern01.gif"]]];
	[self setTitle:@"Settings"];
	[[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(settingsDone:)]];
}


- (void)settingsDone:(id)sender  {
	[[[self navigationController] parentViewController] dismissModalViewControllerAnimated:YES];
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
