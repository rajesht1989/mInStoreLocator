//
//  UINavigationController+MSNavigationController.m
//  mStore
//
//  Created by Rajesh on 5/10/15.
//  Copyright (c) 2015 Org. All rights reserved.
//

#import "UINavigationController+MSNavigationController.h"

@implementation UINavigationController (MSNavigationController)

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return [[self topViewController] supportedInterfaceOrientations];
}



@end
