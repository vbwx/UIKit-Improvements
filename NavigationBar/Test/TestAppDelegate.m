//
//  TestAppDelegate.m
//  NavigationBar
//
//  Created by Bernhard Waldbrunner on 12/5/21.
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
    
    [UINavigationBar customizeAppearance]; // This is necessary for iOS 5 and up.
    // The following hack would not be necessary if the navigation controller got created in the XIB file.
    // Otherwise, the custom border would not appear.
    self.navigationController.navigationBar.clipsToBounds = NO;
    
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
