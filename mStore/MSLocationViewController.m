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
    
    [self setTitle:@"Location - Floor"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    NSString *strFloor;
    if (_item.location.length)
    {
        strFloor = [_item.location substringWithRange:NSMakeRange(0, 1)];
    }
    [self setTitle:[NSString stringWithFormat:@"Location - Floor %@",strFloor]];

    [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Floor%@",strFloor]]];
    [self.view addSubview:imageView];
    
    imageViewPin = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 50, 40)];
    [imageViewPin setImage:[UIImage imageNamed:@"pin"]];
    [self.view addSubview:imageViewPin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
