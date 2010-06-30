//
//  StyledTableViewController.h
//  RitopApp
//
//  Created by Toni Suter on 30.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StyledTableViewController : UITableViewController {
	NSMutableArray *data;
}

@property(nonatomic, retain)NSMutableArray *data;

@end
