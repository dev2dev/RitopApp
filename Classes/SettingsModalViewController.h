//
//  SettingsModalViewController.h
//  RitopApp
//
//  Created by Toni Suter on 03.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingsModalViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	UITableView *rootTableView;
	NSMutableArray *rootTableData;
	UIView *detailView;
}

@property(nonatomic, retain)UITableView *rootTableView;
@property(nonatomic, retain)NSMutableArray *rootTableData;
@property(nonatomic, retain)UIView *detailView;

- (void)settingsDone:(id)sender;

@end
