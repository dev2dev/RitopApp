#import <UIKit/UIKit.h>


@class SettingsModalViewController;
@class BasicChartView;

@interface MainDetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {
	UIPopoverController *popoverController;
	UIToolbar *toolbar;
	BasicChartView *basicChartView;
}

@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) UIToolbar *toolbar;
@property (nonatomic, retain) BasicChartView *basicChartView;

@end
