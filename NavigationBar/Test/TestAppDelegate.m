//
//  TestAppDelegate.m
//  NavigationBar
//
//  Created by vbwx on 12/5/21.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "TestAppDelegate.h"
#import "MasterViewController.h"
#import "UINavigationBar_Custom.h"


@implementation TestAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    MasterViewController *masterViewController = [[[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil] autorelease];
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:masterViewController] autorelease];

    // This is necessary for iOS 5 and up, or if you create the navigation bar programmatically.
    [self.navigationController.navigationBar customizeAppearance];

    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
