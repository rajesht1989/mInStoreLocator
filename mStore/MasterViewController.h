//
//  MasterViewController.h
//  mStore
//
//  Created by Rajesh on 5/5/15.
//

#import <UIKit/UIKit.h>
#import "MSParentTableViewController.h"

@class DetailViewController;

@interface MasterViewController : MSParentTableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

