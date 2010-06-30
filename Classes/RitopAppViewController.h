//
//  RitopAppViewController.h
//  RitopApp
//
//  Created by Toni Suter on 29.06.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StyledTableViewController.h"

@interface RitopAppViewController : UIViewController {
	StyledTableViewController *myStyledTableViewController;
}

@property(nonatomic, retain)StyledTableViewController *myStyledTableViewController;

@end

