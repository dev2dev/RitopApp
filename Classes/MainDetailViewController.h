#import <UIKit/UIKit.h>


@interface MainDetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {
	UIPopoverController *popoverController;
	UIToolbar *toolbar;
}

@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) UIToolbar *toolbar;

@end
