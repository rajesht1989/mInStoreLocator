//
//  MStore.m
//  mStore
//
//  Created by Rajesh on 5/5/15.
//

#import "MStore.h"
#define LOGIN_ID @"mslogin"

@implementation MStore
+ (instancetype)sharedStore;
{
    static MStore *store;
    if (!store)
    {
        store = [[self alloc] init];
        [store createLoadingView];
    }
    return store;
}
- (void)createLoadingView
{
    self.loadingView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.loadingView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.3]];
    UIView *viewBg = [[UIView alloc] initWithFrame:CGRectMake(20, (self.loadingView.frame.size.height - 150)/2, self.loadingView.frame.size.width - 40, 150)];
    [viewBg setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
    [viewBg.layer setCornerRadius:8];
    [viewBg setBackgroundColor:[UIColor whiteColor]];
    [self.loadingView addSubview:viewBg];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
    [imageView setFrame:CGRectMake(10, (viewBg.frame.size.height - 100)/2, 80, 100)];
    [viewBg addSubview:imageView];
    
    UIView *messageView = [[UIView alloc] initWithFrame:CGRectMake(100, (viewBg.frame.size.height - 100)/2, 170, 100)];
    [viewBg addSubview:messageView];
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityView setFrame:CGRectMake(10, 10, 150, 60)];
    [messageView addSubview:activityView];
    [activityView startAnimating];
    
    UILabel *lblMessage = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 150, 20)];
    [lblMessage setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [lblMessage setText:@"Loading..."];
    [lblMessage setTextAlignment:NSTextAlignmentCenter];
    [lblMessage setFont:[UIFont systemFontOfSize:15 weight:.4]];
    [lblMessage setTextColor:[UIColor darkGrayColor]];
    [messageView addSubview:lblMessage];
    
}

+ (void)login
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:LOGIN_ID];
}

+ (BOOL)isLoggedin
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:LOGIN_ID];
}

+ (void)logout
{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:LOGIN_ID];
}


+ (void)showActivity
{
    [[[UIApplication sharedApplication]  keyWindow]addSubview:[[self sharedStore] loadingView]];
}

+ (void)hideActivity
{
    [[[self sharedStore] loadingView] removeFromSuperview];
}

@end
