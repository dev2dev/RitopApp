#import "BasicChartView.h"


@implementation BasicChartView

@synthesize data;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
		self.data = [[NSMutableArray alloc] initWithObjects:
					 [NSNumber numberWithFloat:25],
					 [NSNumber numberWithFloat:77],
					 [NSNumber numberWithFloat:34],
					 [NSNumber numberWithFloat:11],
					 [NSNumber numberWithFloat:14],
					 [NSNumber numberWithFloat:19],
					 [NSNumber numberWithFloat:99],
					 nil];
		
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();

	//Draw Graph
	CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
	CGContextSetLineWidth(context, 2.0);
	CGContextMoveToPoint(context, 10.0, rect.size.height-10);
	
	CGFloat maxValue = 0;
	for(int i = 0; i < self.data.count; i++)  {
		maxValue = ([[data objectAtIndex:i] floatValue] > maxValue) ? [[data objectAtIndex:i] floatValue] : maxValue;
	}
	CGFloat factor = (rect.size.height - 20)/maxValue;
	
	CGFloat distance = (rect.size.width-20)/(self.data.count-1);
	for(int i = 0; i < self.data.count; i++)  {
		CGContextAddLineToPoint(context, 10 + i*distance, rect.size.height-10-([[data objectAtIndex:i] floatValue] * factor));	
	}
	
	CGContextAddLineToPoint(context, rect.size.width-10, rect.size.height-10);
	CGContextAddLineToPoint(context, 10, rect.size.height-10);
	CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.9 green:0.7 blue:0.5 alpha:0.3].CGColor);
	CGContextFillPath(context);
	
	
	//Draw Bars
	CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
	CGContextSetLineWidth(context, 4.0);
	CGContextMoveToPoint(context, 10.0, 10.0);
	CGContextAddLineToPoint(context, 10.0, rect.size.height-10);
	CGContextAddLineToPoint(context, rect.size.width-10, rect.size.height-10);
	CGContextStrokePath(context);
}


- (void)dealloc {
    [super dealloc];
}


@end
