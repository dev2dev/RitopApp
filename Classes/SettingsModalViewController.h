//
//  SettingsModalViewController.h
//  RitopApp
//
//  Created by Toni Suter on 03.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingsCommonViewController;
@class SettingsDesignViewController;
@class SettingsInstallationViewController;
@class SettingsAboutViewController;


@interface SettingsModalViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	UITableView *rootTableView;
	NSMutableArray *rootTableData;
	UIView *detailView;
	SettingsCommonViewController *commonViewController;
	SettingsDesignViewController *designViewController;
	SettingsInstallationViewController *installationViewController;
	SettingsAboutViewController *aboutViewController;
}

@property(nonatomic, retain)UITableView *rootTableView;
@property(nonatomic, retain)NSMutableArray *rootTableData;
@property(nonatomic, retain)UIView *detailView;
@property(nonatomic, retain)SettingsCommonViewController *commonViewController;
@property(nonatomic, retain)SettingsDesignViewController *designViewController;
@property(nonatomic, retain)SettingsInstallationViewController *installationViewController;
@property(nonatomic, retain)SettingsAboutViewController *aboutViewController;

- (void)settingsDone:(id)sender;

@end
