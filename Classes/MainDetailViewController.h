#import <UIKit/UIKit.h>


@class SettingsModalViewController;

@interface MainDetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {
	UIPopoverController *popoverController;
	UIToolbar *toolbar;
	SettingsModalViewController *settingsModalViewController;
}

@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) UIToolbar *toolbar;
@property (nonatomic, retain) SettingsModalViewController *settingsModalViewController;

- (void)showSettings:(id)sender;

@end
