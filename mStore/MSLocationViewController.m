//
//  MSLocationViewController.m
//  mStore
//
//  Created by Rajesh on 5/8/15.
//

#import "MSLocationViewController.h"

@interface MSLocationViewController ()
{
    UIImageView *imageViewPin;
}

@end

@implementation MSLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Location"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [imageView setImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    [self.view addSubview:imageView];
    
    imageViewPin = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 50, 40)];
    [imageViewPin setImage:[UIImage imageNamed:@"pin"]];
    [self.view addSubview:imageViewPin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
