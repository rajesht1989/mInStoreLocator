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
    }
    return store;
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

@end
