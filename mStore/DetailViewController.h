//
//  DetailViewController.h
//  mStore
//
//  Created by Rajesh on 5/5/15.
//

#import <UIKit/UIKit.h>
#import "MSParentViewController.h"

@interface DetailViewController : MSParentViewController

@property (strong, nonatomic) MSCategory *category;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (void)locateTapped:(UIButton *)button;

@end

