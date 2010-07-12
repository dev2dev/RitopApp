#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface BasicChartView : UIView {
	NSMutableArray *data;
	bool dotsEnabled;
}

@property(nonatomic, retain) NSMutableArray *data;

@end
