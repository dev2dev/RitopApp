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
	
		[self.layer setCornerRadius:10.0];
		[self setClipsToBounds:YES];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();

	//Draw Graph
	CGContextSaveGState(context);
	CGContextSetLineWidth(context, 1.0);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 20.0, rect.size.height-20);
	
	CGFloat maxValue = 0;
	for(int i = 0; i < self.data.count; i++)  {
		maxValue = ([[data objectAtIndex:i] floatValue] > maxValue) ? [[data objectAtIndex:i] floatValue] : maxValue;
	}
	CGFloat factor = (rect.size.height - 40)/maxValue;
	
	CGFloat distance = (rect.size.width-40)/(self.data.count-1);
	for(int i = 0; i < self.data.count; i++)  {
		CGContextAddLineToPoint(context, 20 + i*distance, rect.size.height-20-([[data objectAtIndex:i] floatValue] * factor));
	}
	
	CGContextAddLineToPoint(context, rect.size.width-20, rect.size.height-20);
	CGContextClosePath(context);
	CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.9 green:0.7 blue:0.5 alpha:0.3].CGColor);
	
	CGContextClip(context);
	CGFloat colors[] =
	{
		1.0, 1.0, 1.0, 0.3,
		0.0, 0.5, 0.9, 0.3,
	};
	
	CGGradientRef gradient = CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
	CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, rect.size.width), kCGGradientDrawsBeforeStartLocation);
	CGContextRestoreGState(context);
	
	
	
	CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
	for(int i = 0; i < self.data.count; i++)  {
		CGContextFillEllipseInRect(context, CGRectMake(18 + i*distance, rect.size.height-22-([[data objectAtIndex:i] floatValue] * factor), 4, 4));
	}
	
	
	//Draw Bars
	CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
	CGContextSetLineWidth(context, 4.0);
	CGContextMoveToPoint(context, 20.0, 20.0);
	CGContextAddLineToPoint(context, 20.0, rect.size.height-20);
	CGContextAddLineToPoint(context, rect.size.width-20, rect.size.height-20);
	CGContextStrokePath(context);
}


- (void)dealloc {
    [super dealloc];
}





@end
