//
//  MSLoginViewController.m
//  mStore
//
//  Created by Rajesh on 5/5/15.
//

#import "MSLoginViewController.h"
#import "MStore.h"


@interface MSLoginViewController ()<UITextFieldDelegate>
{
    UITextField *txtUname;
    UITextField *txtPwd;
    UIView *bgView;
}

@end

@implementation MSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTapped:)];
    [addButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = addButton;
    [self setTitle:@"Login"];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [[self.navigationController navigationBar] setBackgroundImage:NAVIGATION_BAR_IMAGE forBarMetrics:UIBarMetricsDefault];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[THEME_COLOR CGColor], [(id)[UIColor whiteColor] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    CGRect frame = CGRectInset(self.view.frame, 50, 50);
    CGRect imageFrame = CGRectMake((frame.size.width - 110)/2, 10, 110, 125);
    if (isDeviceiPhone)
    {
        frame = self.view.frame;
        imageFrame = CGRectMake((frame.size.width - 55)/2, 10, 55, 68);
    }
     bgView = [[UIView alloc] initWithFrame:frame];
    [bgView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [bgView.layer setCornerRadius:8];
    [self.view addSubview:bgView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((bgView.frame.size.width - 65)/2, 10, 65, 80)];
    [imageView setImage:[UIImage imageNamed:@"Logo"]];
    [imageView.layer setCornerRadius:4];
    [imageView setClipsToBounds:YES];
    [imageView setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin];
    [bgView addSubview:imageView];
    
    UILabel *lblUserName = [[UILabel alloc] initWithFrame:CGRectMake(30, (imageFrame.origin.y + imageFrame.size.height + 20), 100, 30)];
    [lblUserName setText:@"Username"];
    [lblUserName setFont:[UIFont systemFontOfSize:16 weight:.4]];
    [lblUserName setTextColor:[UIColor whiteColor]];
    [bgView addSubview:lblUserName];
    
     txtUname = [[UITextField alloc] initWithFrame:CGRectMake(30, (lblUserName.frame.origin.y + lblUserName.frame.size.height + 10), bgView.frame.size.width-60, 30)];
    [txtUname setDelegate:self];
    [txtUname setBackgroundColor:[UIColor whiteColor]];
    [txtUname setBorderStyle:UITextBorderStyleRoundedRect];
    [bgView addSubview:txtUname];
    
    UILabel *lblPassword = [[UILabel alloc] initWithFrame:CGRectMake(30, (txtUname.frame.origin.y + txtUname.frame.size.height + 30), 100, 30)];
    [lblPassword setText:@"Password"];
    [lblPassword setFont:[UIFont systemFontOfSize:16 weight:.4]];
    [lblPassword setTextColor:[UIColor whiteColor]];
    [bgView addSubview:lblPassword];
    
     txtPwd = [[UITextField alloc] initWithFrame:CGRectMake(30, (lblPassword.frame.origin.y + lblPassword.frame.size.height + 10), bgView.frame.size.width-60, 30)];
    [txtPwd setDelegate:self];
    [txtPwd setBackgroundColor:[UIColor whiteColor]];
    [txtPwd setBorderStyle:UITextBorderStyleRoundedRect];
    [bgView addSubview:txtPwd];
    
    UIButton *btnLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnLogin setFrame:CGRectMake(30, (txtPwd.frame.origin.y + txtPwd.frame.size.height + 30), bgView.frame.size.width-60, 30)];
    [btnLogin setTitle:@"Login" forState:UIControlStateNormal];
    [bgView addSubview:btnLogin];
    [btnLogin addTarget:self action:@selector(loginTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)loginTapped:(UIButton *)btnLogin
{
    if (!txtUname.text.length)
    {
        [[[UIAlertView alloc] initWithTitle:nil message:@"Please enter Username" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
        return;
    }
    if (!txtPwd.text.length)
    {
        [[[UIAlertView alloc] initWithTitle:nil message:@"Please enter Password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
        return;
    }
    
    [MStore showActivity];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MStore login];
        [self dismissViewControllerAnimated:YES completion:nil];
        [MStore hideActivity];
    });
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        [bgView setTransform:CGAffineTransformMakeTranslation(0, (textField == txtUname) ? -40 : -100)];
    } completion:nil];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        [bgView setTransform:CGAffineTransformMakeTranslation(0, 0)];
    } completion:nil];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}


- (void)cancelTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
