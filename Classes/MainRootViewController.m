#import "MainRootViewController.h"
#import "InstallationDetailViewController.h"
#import "SettingsModalViewController.h"


@implementation MainRootViewController

@synthesize data;
@synthesize detailedData;
@synthesize settingsModalViewController;
@synthesize settingsNavigationController;
@synthesize refreshingTimer;

- (id)init {
	self = [super init];
    if (self != nil) {
		NSMutableArray *anlage1 = [NSMutableArray arrayWithObjects:
								   [NSMutableArray arrayWithObjects:
									[UIImage imageNamed:@"imageB.png"],
									[UIImage imageNamed:@"imageB.png"],
									[UIImage imageNamed:@"imageB.png"],
									nil],
								   [NSMutableArray arrayWithObjects:
									@"Test 1",
									@"Test 2",
									@"Test 3",
									nil],
								   [NSMutableArray arrayWithObjects:
									[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:5], [NSNumber numberWithFloat:5], [NSNumber numberWithFloat:10.0], [NSNumber numberWithFloat:10], [NSNumber numberWithFloat:5], [NSNumber numberWithFloat:5], [NSNumber numberWithFloat:10.0], [NSNumber numberWithFloat:10.0], nil],
									[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], nil],
									[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], nil],
									nil],
								   nil];
		
		NSMutableArray *anlage2 = [NSMutableArray arrayWithObjects:
								   [NSMutableArray arrayWithObjects:
									[UIImage imageNamed:@"imageB.png"],
									[UIImage imageNamed:@"imageB.png"],
									nil],
								   [NSMutableArray arrayWithObjects:
									@"Ventil A",
									@"Ventil B",
									nil],
								   [NSMutableArray arrayWithObjects:
									[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:2], [NSNumber numberWithFloat:4], [NSNumber numberWithFloat:8], [NSNumber numberWithFloat:16], [NSNumber numberWithFloat:32], [NSNumber numberWithFloat:64], [NSNumber numberWithFloat:128], [NSNumber numberWithFloat:256], [NSNumber numberWithFloat:512], [NSNumber numberWithFloat:1024], nil],
									[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], nil],
									nil],
								   nil];
		
		NSMutableArray *anlage3 = [NSMutableArray arrayWithObjects:
								   [NSMutableArray arrayWithObjects:
									[UIImage imageNamed:@"imageB.png"],
									[UIImage imageNamed:@"imageB.png"],
									[UIImage imageNamed:@"imageB.png"],
									[UIImage imageNamed:@"imageB.png"],
									nil],
								   [NSMutableArray arrayWithObjects:
									@"Ventil 1",
									@"Ventil 2",
									@"Ventil 3",
									@"Ventil 4",
									nil],
								   [NSMutableArray arrayWithObjects:
									[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:2], [NSNumber numberWithFloat:4], [NSNumber numberWithFloat:16.0], [NSNumber numberWithFloat:256.0], nil],
									[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], nil],
									[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:2], [NSNumber numberWithFloat:4], [NSNumber numberWithFloat:16.0], [NSNumber numberWithFloat:256.0], nil],
									[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], nil],
									nil],
								   nil];
		
		NSMutableArray *anlage4 = [NSMutableArray arrayWithObjects:
								   [NSMutableArray arrayWithObjects:
									[UIImage imageNamed:@"imageB.png"],
									[UIImage imageNamed:@"imageB.png"],
									[UIImage imageNamed:@"imageB.png"],
									nil],
								   [NSMutableArray arrayWithObjects:
									@"Device A",
									@"Device B",
									@"Device C",
									nil],
								   [NSMutableArray arrayWithObjects:
									[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:2], [NSNumber numberWithFloat:4], [NSNumber numberWithFloat:16.0], [NSNumber numberWithFloat:256.0], nil],
									[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:12.0], nil],
									[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:2], [NSNumber numberWithFloat:4], [NSNumber numberWithFloat:16.0], [NSNumber numberWithFloat:256.0], nil],
									nil],
								   nil];
		
		
		
		
		data = [[NSMutableArray alloc] initWithObjects:
				[NSMutableArray arrayWithObjects:
				 [UIImage imageNamed:@"imageA.png"], 
				 [UIImage imageNamed:@"imageA.png"], 
				 [UIImage imageNamed:@"imageA.png"],
				 [UIImage imageNamed:@"imageA.png"],
				 nil],
				[NSMutableArray arrayWithObjects:
				 @"Anlage 1",
				 @"Anlage 2", 
				 @"Anlage 3",
				 @"Anlage 4",
				 nil],
				[NSMutableArray arrayWithObjects:
				 anlage1,
				 anlage2,
				 anlage3,
				 anlage4,
				 nil],
				nil];
		
		[self.tableView setDataSource:self];		
		[self.tableView setDelegate:self];
		[self setTitle:@"Anlagen"];
		[[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingsIcon.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(showSettings:)]];
		[[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshTable:)]];
		
		self.settingsModalViewController = [[SettingsModalViewController alloc] init];
		self.settingsNavigationController = [[UINavigationController alloc] initWithRootViewController:self.settingsModalViewController];
		[[settingsNavigationController navigationBar] setTintColor:[UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1.0]];
		[settingsNavigationController setModalPresentationStyle:UIModalPresentationFormSheet];
	}
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	[self.tableView setRowHeight:80.0];
	[self.tableView setBackgroundColor:[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0]];
	[self.tableView setSeparatorColor:[UIColor colorWithRed:0.27 green:0.27 blue:0.27 alpha:1.0]];
}


- (void)showSettings:(id)sender  {
	[[self splitViewController] presentModalViewController:settingsNavigationController animated:YES];
}

- (void)refreshTable:(id)sender  {
	UIActivityIndicatorView *refreshIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	[refreshIndicator startAnimating];
	[[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:refreshIndicator]];
	self.refreshingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 
															target:self 
														  selector:@selector(refreshingDidEnd:) 
														  userInfo:nil 
														   repeats:NO];
}

- (void)refreshingDidEnd:(id)sender  {
	[[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshTable:)]];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[data objectAtIndex:0] count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	[[cell textLabel] setText:[[self.data objectAtIndex:1] objectAtIndex:[indexPath row]]];
	[[cell textLabel] setTextColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]];
	[[cell textLabel] setHighlightedTextColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
	[[cell imageView] setImage:[[self.data objectAtIndex:0] objectAtIndex:[indexPath row]]];
	[cell setSelectionStyle:UITableViewCellSelectionStyleGray];
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	
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
	InstallationDetailViewController *detailView = [[InstallationDetailViewController alloc] init];
	[detailView setTitle:[[self.data objectAtIndex:1] objectAtIndex:[indexPath row]]];
	[[self navigationController] pushViewController:detailView animated:YES];
	[detailView setData:[[self.data objectAtIndex:2] objectAtIndex:[indexPath row]]];
	[detailView.tableView reloadData];
	[detailView.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] 
								animated:NO 
						  scrollPosition:UITableViewScrollPositionTop];
	[detailView release];
}

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
	[data release];
    [super dealloc];
}


@end


