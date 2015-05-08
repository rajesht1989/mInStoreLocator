//
//  MStore.h
//  mStore
//
//  Created by Rajesh on 5/5/15.
//
#define isDeviceiPhone ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

#define NAVIGATION_BAR_IMAGE [UIImage imageWithColor:THEME_COLOR]
#define THEME_COLOR [UIColor colorWithRed:.2 green:.5 blue:1 alpha:1]

#import <Foundation/Foundation.h>

@interface MStore : NSObject

+ (instancetype)sharedStore;

+ (void)login;
+ (BOOL)isLoggedin;
+ (void)logout;

@end
