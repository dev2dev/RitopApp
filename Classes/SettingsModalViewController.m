    //
//  SettingsModalViewController.m
//  RitopApp
//
//  Created by Toni Suter on 03.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SettingsModalViewController.h"
#import "SettingsCommonViewController.h"
#import "SettingsDesignViewController.h"
#import "SettingsInstallationViewController.h"
#import "SettingsAboutViewController.h"


@implementation SettingsModalViewController

@synthesize rootTableView;
@synthesize rootTableData;
@synthesize detailView;
@synthesize commonViewController;
@synthesize designViewController;
@synthesize installationViewController;
@synthesize aboutViewController;

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
																 [NSMutableArray arrayWithObjects:@"Allgemein",
																								  @"Darstellung",
																								  @"Anlagen",
																								  @"About",
																								  nil],
																 nil];
	
	self.detailView = [[UIView alloc] initWithFrame:CGRectMake(200, 0, 340, 580)];
	[detailView setBackgroundColor:[UIColor darkGrayColor]];
	[self.view addSubview:detailView];
	
	commonViewController = [[SettingsCommonViewController alloc] initWithStyle:UITableViewStyleGrouped];
	[commonViewController.tableView setFrame:CGRectMake(0, 0, 340, 580)];
	[self.detailView addSubview:commonViewController.view];
	
	designViewController = [[SettingsDesignViewController alloc] initWithStyle:UITableViewStyleGrouped];
	[designViewController.tableView setFrame:CGRectMake(0, 0, 340, 580)];
	
	installationViewController = [[SettingsInstallationViewController alloc] initWithStyle:UITableViewStyleGrouped];
	[installationViewController.tableView setFrame:CGRectMake(0, 0, 340, 580)];
	
	aboutViewController = [[SettingsAboutViewController alloc] initWithStyle:UITableViewStyleGrouped];
	[aboutViewController.tableView setFrame:CGRectMake(0, 0, 340, 580)];
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
	//remove all subviews
	for (UIView *view in self.detailView.subviews) {
		[view removeFromSuperview];
	}
	
	if(indexPath.row == 0)  {
		[self.detailView addSubview:commonViewController.view];
	}
	else if(indexPath.row == 1)  {
		[self.detailView addSubview:designViewController.view];
	}
	else if(indexPath.row == 2)  {
		[self.detailView addSubview:installationViewController.view];
	}
	else if(indexPath.row == 3)  {
		[self.detailView addSubview:aboutViewController.view];
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
