//
//  DetailViewController.h
//  NavigationBar
//
//  Created by vbwx on 12/5/21.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

@class MasterViewController;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property(assign, nonatomic) MasterViewController *parent;

@end
