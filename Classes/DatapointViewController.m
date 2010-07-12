#import "DatapointViewController.h"
//#import <CoreFoundation/CoreFoundation.h>

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
	
	
	

	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.ssvmuri.ch/apns/test.php"]];
	[request setHTTPMethod:@"POST"];
	[request setValue:@"text/xml" forHTTPHeaderField:@"Content-type"];

	NSString *xmlString = @"<data><item>Item 1</item><item>Item 2</item></data>";
	[request setValue:[NSString stringWithFormat:@"%d", [xmlString length]] forHTTPHeaderField:@"Content-length"];
	[request setHTTPBody:[xmlString dataUsingEncoding:NSUTF8StringEncoding]];

	[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

	 
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response  {

	 
	 }

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data  {
	unsigned char aBuffer[[data length]];
	[data getBytes:aBuffer length:[data length]];
	NSLog(@"%s", aBuffer);
	
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
	[parser setDelegate:self]; // The parser calls methods in this class
    [parser setShouldProcessNamespaces:NO]; // We don't care about namespaces
    [parser setShouldReportNamespacePrefixes:NO]; //
    [parser setShouldResolveExternalEntities:NO]; // We just want data, no other stuff
	
    [parser parse]; // Parse that data..
	
    [parser release];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{	
	NSLog(@"foundCharacters");
	NSLog(@"%@", string);
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if (qName) {
        elementName = qName;
	}
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
