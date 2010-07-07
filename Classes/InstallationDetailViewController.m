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
				[NSMutableArray arrayWithObjects:@"", @"", @"", nil],
				[NSMutableArray arrayWithObjects:[NSNumber numberWithBool:NO], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:NO],nil],
				nil];
		[self.tableView setDataSource:self];		
		[self.tableView setDelegate:self];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
	[self.tableView setRowHeight:100.0];
	[self.tableView setBackgroundColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[data objectAtIndex:0] count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	const NSInteger TOP_LABEL_TAG = 1001;
	const NSInteger BOTTOM_LABEL_TAG = 1002;
	UILabel *topLabel;
	UILabel *bottomLabel;
	
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		
		UIImage *image = [UIImage imageNamed:@"imageA.png"];
		UIImage *indicator = [UIImage imageNamed:@"greenBullet.png"];
		
		//topLabel
		topLabel = [[[UILabel alloc] initWithFrame:CGRectMake(image.size.width + 2.0 * cell.indentationWidth,
															  0.5 * (aTableView.rowHeight - 2 * 20),
															  aTableView.bounds.size.width - image.size.width - 4.0 * cell.indentationWidth - indicator.size.width,
															  20)] autorelease];
		topLabel.tag = TOP_LABEL_TAG;
		topLabel.backgroundColor = [UIColor clearColor];
		topLabel.textColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
		topLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		topLabel.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
		[cell.contentView addSubview:topLabel];
		
		//bottomLabel
		bottomLabel = [[[UILabel alloc] initWithFrame:CGRectMake(image.size.width + 2.0 * cell.indentationWidth,
																 0.5 * (aTableView.rowHeight - 2 * 20) + 20,
																 aTableView.bounds.size.width - image.size.width - 4.0 * cell.indentationWidth - indicator.size.width,
																 20)] autorelease];
		bottomLabel.tag = BOTTOM_LABEL_TAG;
		bottomLabel.backgroundColor = [UIColor clearColor];
		bottomLabel.textColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
		bottomLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		bottomLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize] - 2];
		[cell.contentView addSubview:bottomLabel];
		
		cell.backgroundView = [[[UIImageView alloc] init] autorelease];
		cell.selectedBackgroundView = [[[UIImageView alloc] init] autorelease];
	}
	
	
	else
	{
		topLabel = (UILabel *)[cell viewWithTag:TOP_LABEL_TAG];
		bottomLabel = (UILabel *)[cell viewWithTag:BOTTOM_LABEL_TAG];
	}
	
	
	UIImage *indicatorImage;
	
	if ([[[data objectAtIndex:3] objectAtIndex:[indexPath row]] boolValue] == YES) {
		indicatorImage = [UIImage imageNamed:@"redBullet.png"];
	}
	else {
		indicatorImage = [UIImage imageNamed:@"greenBullet.png"];		
	}
	cell.accessoryView = [[[UIImageView alloc] initWithImage:indicatorImage] autorelease];
	
	topLabel.text = [[data objectAtIndex:1] objectAtIndex:[indexPath row]];
	bottomLabel.text = [[data objectAtIndex:2] objectAtIndex:[indexPath row]];
	
	((UIImageView *)cell.backgroundView).image = [UIImage imageNamed:@"unselectedRow.png"];
	((UIImageView *)cell.selectedBackgroundView).image = [UIImage imageNamed:@"selectedRow.png"];
	
	[[cell imageView] setImage:[[data objectAtIndex:0] objectAtIndex:[indexPath row]]];
	
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


