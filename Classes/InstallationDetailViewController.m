#import "InstallationDetailViewController.h"


@implementation InstallationDetailViewController

@synthesize data;

- (id)init {
	self = [super init];
    if (self != nil) {
		data = [[NSMutableArray alloc] initWithObjects:[NSMutableArray arrayWithObjects:[UIImage imageNamed:@"imageA.png"], 
														[UIImage imageNamed:@"imageB.png"], 
														[UIImage imageNamed:@"imageC.png"],nil],
				[NSMutableArray arrayWithObjects:@"Ventil V1", @"Ventil V2", @"Ventil V3", nil],
				[NSMutableArray arrayWithObjects:[NSNumber numberWithBool:NO], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:NO],nil],
				nil];
		[self.tableView setDataSource:self];		
		[self.tableView setDelegate:self];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	[self.tableView setRowHeight:80.0];
	[self.tableView setBackgroundColor:[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0]];
	[self.tableView setSeparatorColor:[UIColor colorWithRed:0.27 green:0.27 blue:0.27 alpha:1.0]];
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


