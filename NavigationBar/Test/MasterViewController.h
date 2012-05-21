//
//  MasterViewController.h
//  NavigationBar
//
//  Created by Bernhard Waldbrunner on 12/5/21.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

@class DetailViewController;

@interface MasterViewController : UITableViewController
{
    IBOutlet UIBarButtonItem *button;
}

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) IBOutlet UIButton *backButton;

- (IBAction) displayAlert:(id)sender;

@end
