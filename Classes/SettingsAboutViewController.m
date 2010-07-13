//
//  SettingsAboutViewController.m
//  RitopApp
//
//  Created by Toni Suter on 13.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SettingsAboutViewController.h"


@implementation SettingsAboutViewController


#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,340, 200)];
																  
	UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon.png"]];
	[icon setFrame:CGRectMake(0,0,50,50)];
	[icon setCenter:CGPointMake(headerView.frame.size.width/2-50,30)];
	[headerView addSubview:icon];
		
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[titleLabel setText:@"Ritop"];
	[titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
	[titleLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
	[titleLabel setBackgroundColor:[UIColor clearColor]];
	[titleLabel sizeToFit];
	[titleLabel setCenter:CGPointMake(headerView.frame.size.width/2 + 10, 20)];
	[headerView addSubview:titleLabel];
			
	UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[versionLabel setText:@"1.0.1"];
	[versionLabel setFont:[UIFont systemFontOfSize:18]];
	[versionLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
	[versionLabel setBackgroundColor:[UIColor clearColor]];
	[versionLabel sizeToFit];
	[versionLabel setCenter:CGPointMake(headerView.frame.size.width/2+60, 20)];
	[headerView addSubview:versionLabel];
			
	UILabel *rittmeyerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[rittmeyerLabel setText:@"Rittmeyer"];
	[rittmeyerLabel setFont:[UIFont boldSystemFontOfSize:18]];
	[rittmeyerLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
	[rittmeyerLabel setBackgroundColor:[UIColor clearColor]];
	[rittmeyerLabel sizeToFit];
	[rittmeyerLabel setCenter:CGPointMake(headerView.frame.size.width/2 + 29, 40)];
	[headerView addSubview:rittmeyerLabel];
			
	UILabel *wasbuiltLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[wasbuiltLabel setText:@"Design & Implementation by:"];
	[wasbuiltLabel setFont:[UIFont boldSystemFontOfSize:16]];
	[wasbuiltLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
	[wasbuiltLabel setBackgroundColor:[UIColor clearColor]];
	[wasbuiltLabel sizeToFit];
	[wasbuiltLabel setCenter:CGPointMake(headerView.frame.size.width/2, 100)];
	[headerView addSubview:wasbuiltLabel];
		
	UILabel *simonLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[simonLabel setText:@"Simeon Haefliger"];
	[simonLabel setFont:[UIFont systemFontOfSize:16]];
	[simonLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
	[simonLabel setBackgroundColor:[UIColor clearColor]];
	[simonLabel sizeToFit];
	[simonLabel setCenter:CGPointMake(headerView.frame.size.width/2, 130)];
	[headerView addSubview:simonLabel];
		
	UILabel *christianLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[christianLabel setText:@"Christian Gwerder"];
	[christianLabel setFont:[UIFont systemFontOfSize:16]];
	[christianLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
	[christianLabel setBackgroundColor:[UIColor clearColor]];
	[christianLabel sizeToFit];
	[christianLabel setCenter:CGPointMake(headerView.frame.size.width/2, 150)];
	[headerView addSubview:christianLabel];
		
	UILabel *toniLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
	[toniLabel setText:@"Toni Suter"];
	[toniLabel setFont:[UIFont systemFontOfSize:16]];
	[toniLabel setTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
	[toniLabel setBackgroundColor:[UIColor clearColor]];
	[toniLabel sizeToFit];
	[toniLabel setCenter:CGPointMake(headerView.frame.size.width/2, 170)];
	[headerView addSubview:toniLabel];
	
	self.tableView.tableHeaderView = headerView;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	if(indexPath.row == 0)  {
		[[cell textLabel] setText:@"Über Ritop"];
		[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	}
	else if(indexPath.row == 1)  {
		[[cell textLabel] setText:@"Fragen & Antworten"];
		[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	}
    
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


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

