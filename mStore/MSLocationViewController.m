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
    BOOL isGreen;
    NSTimer *timer;
}

@end

@implementation MSLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Location - Floor"];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(dismissViewController)]];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [[self.navigationController navigationBar] setBackgroundImage:NAVIGATION_BAR_IMAGE forBarMetrics:UIBarMetricsDefault];
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
//    [imageViewPin setAnimationImages:@[[UIImage imageNamed:@"pin"],[UIImage imageNamed:@"pin1"]]];
//    [imageViewPin startAnimating];
//    imageViewPin.animationDuration = 1.0f;
//    imageViewPin.animationRepeatCount = 5;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pinImageViewTapped)];
    [imageViewPin addGestureRecognizer:tapRecognizer];
    [imageViewPin setUserInteractionEnabled:YES];
    [self.view addSubview:imageViewPin];
     timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animateImage) userInfo:nil repeats:YES];
    

}

- (void)animateImage
{
    if (isGreen)
    {
        [imageViewPin setImage:[UIImage imageNamed:@"pin"]];
    }
    else
    {
        [imageViewPin setImage:[UIImage imageNamed:@"pin1"]];
    }
    isGreen = !isGreen;
}

- (void)pinImageViewTapped
{
    [timer invalidate];
    [[[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"Item %@\n of price %@\n Located in %@",_item.name,_item.price,_item.location] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (void)dismissViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [UIViewController attemptRotationToDeviceOrientation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

@end
