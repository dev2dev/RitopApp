#import <UIKit/UIKit.h>

@class SettingsModalViewController;

@interface MainRootViewController : UITableViewController {
	NSMutableArray *data;
	NSMutableArray *detailedData;
	SettingsModalViewController *settingsModalViewController;
	UINavigationController *settingsNavigationController;
	NSTimer *refreshingTimer;
}

@property(nonatomic, retain)NSMutableArray *data;
@property(nonatomic, retain)NSMutableArray *detailedData;
@property(nonatomic, retain)SettingsModalViewController *settingsModalViewController;
@property(nonatomic, retain)UINavigationController *settingsNavigationController;
@property(nonatomic, retain)NSTimer *refreshingTimer;

- (void)showSettings:(id)sender;
- (void)refreshTable:(id)sender;

@end
