    //
//  SettingsModalViewController.m
//  RitopApp
//
//  Created by Toni Suter on 03.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SettingsModalViewController.h"


@implementation SettingsModalViewController

@synthesize rootTableView;
@synthesize rootTableData;
@synthesize detailView;

- (void)loadView {
	[super loadView];
	
	[self setTitle:@"Settings"];
	[[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(settingsDone:)]];
	
	self.rootTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 200, 580)];
	[rootTableView setDelegate:self];
	[rootTableView setDataSource:self];
	[rootTableView setBackgroundColor:[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0]];
	[rootTableView setSeparatorColor:[UIColor colorWithRed:0.27 green:0.27 blue:0.27 alpha:1.0]];
	[rootTableView setAllowsSelection:YES];
	[self.view addSubview:rootTableView];
	
	self.rootTableData = [[NSMutableArray alloc] initWithObjects:[NSMutableArray arrayWithObjects:[UIImage imageNamed:@"allgemeinesIcon.png"],
																								  [UIImage imageNamed:@"darstellungIcon.png"],
																								  [UIImage imageNamed:@"anlagenIcon.png"],
																								  [UIImage imageNamed:@"aboutIcon.png"],
																								  nil],
																 [NSMutableArray arrayWithObjects:@"Allgemeines",
																								  @"Darstellung",
																								  @"Anlagen",
																								  @"About",
																								  nil],
																 nil];
	
	self.detailView = [[UIView alloc] initWithFrame:CGRectMake(200, 0, 340, 580)];
	[detailView setBackgroundColor:[UIColor darkGrayColor]];
	[self.view addSubview:detailView];
}

-(void) viewDidLoad  {
	[self.rootTableView reloadData];
	[self.rootTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] 
									animated:NO 
							  scrollPosition:UITableViewScrollPositionTop];
}


- (void)settingsDone:(id)sender  {
	[[[self navigationController] parentViewController] dismissModalViewControllerAnimated:YES];
}








//TableView (RootView)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.rootTableData objectAtIndex:0] count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";

	UITableViewCell *cell = [rootTableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}

	[[cell textLabel] setText:[[self.rootTableData objectAtIndex:1] objectAtIndex:[indexPath row]]];
	[[cell textLabel] setTextColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]];
	[[cell textLabel] setHighlightedTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
	[[cell imageView] setImage:[[self.rootTableData objectAtIndex:0] objectAtIndex:[indexPath row]]];
	[cell setSelectionStyle:UITableViewCellSelectionStyleGray];

	return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.detailView removeFromSuperview];
	[self.detailView release];
	self.detailView = [[UIView alloc] initWithFrame:CGRectMake(200, 0, 340, 580)];
	[detailView setBackgroundColor:[UIColor darkGrayColor]];
	[self.view addSubview:self.detailView];

	if([indexPath row] == 3)  {
		UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon.png"]];
		[icon setFrame:CGRectMake(0,0,40,40)];
		[icon setCenter:CGPointMake(self.detailView.frame.size.width/2-80,30)];
		[self.detailView addSubview:icon];
		
		UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
		[titleLabel setText:@"Ritop"];
		[titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
		[titleLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
		[titleLabel setBackgroundColor:[UIColor clearColor]];
		[titleLabel sizeToFit];
		[titleLabel setCenter:CGPointMake(self.detailView.frame.size.width/2-30, 20)];
		[self.detailView addSubview:titleLabel];
		
		UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
		[versionLabel setText:@"1.0.1"];
		[versionLabel setFont:[UIFont systemFontOfSize:18]];
		[versionLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
		[versionLabel setBackgroundColor:[UIColor clearColor]];
		[versionLabel sizeToFit];
		[versionLabel setCenter:CGPointMake(self.detailView.frame.size.width/2+20, 20)];
		[self.detailView addSubview:versionLabel];
		
		UILabel *rittmeyerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
		[rittmeyerLabel setText:@"rittmeyer"];
		[rittmeyerLabel setFont:[UIFont boldSystemFontOfSize:18]];
		[rittmeyerLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
		[rittmeyerLabel setBackgroundColor:[UIColor clearColor]];
		[rittmeyerLabel sizeToFit];
		[rittmeyerLabel setCenter:CGPointMake(self.detailView.frame.size.width/2-14, 40)];
		[self.detailView addSubview:rittmeyerLabel];
		
		UILabel *wasbuiltLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
		[wasbuiltLabel setText:@"Design & Implementation by:"];
		[wasbuiltLabel setFont:[UIFont boldSystemFontOfSize:16]];
		[wasbuiltLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
		[wasbuiltLabel setBackgroundColor:[UIColor clearColor]];
		[wasbuiltLabel sizeToFit];
		[wasbuiltLabel setCenter:CGPointMake(self.detailView.frame.size.width/2, 100)];
		[self.detailView addSubview:wasbuiltLabel];
		
		UILabel *simonLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
		[simonLabel setText:@"Simeon Haefliger"];
		[simonLabel setFont:[UIFont systemFontOfSize:16]];
		[simonLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
		[simonLabel setBackgroundColor:[UIColor clearColor]];
		[simonLabel sizeToFit];
		[simonLabel setCenter:CGPointMake(self.detailView.frame.size.width/2, 130)];
		[self.detailView addSubview:simonLabel];
		
		UILabel *christianLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
		[christianLabel setText:@"Christian Gwerder"];
		[christianLabel setFont:[UIFont systemFontOfSize:16]];
		[christianLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
		[christianLabel setBackgroundColor:[UIColor clearColor]];
		[christianLabel sizeToFit];
		[christianLabel setCenter:CGPointMake(self.detailView.frame.size.width/2, 150)];
		[self.detailView addSubview:christianLabel];
		
		UILabel *toniLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
		[toniLabel setText:@"Toni Suter"];
		[toniLabel setFont:[UIFont systemFontOfSize:16]];
		[toniLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
		[toniLabel setBackgroundColor:[UIColor clearColor]];
		[toniLabel sizeToFit];
		[toniLabel setCenter:CGPointMake(self.detailView.frame.size.width/2, 170)];
		[self.detailView addSubview:toniLabel];
	}
}


//End TableView (RootView)



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
