//
//  MasterViewController.m
//  NavigationBar
//
//  Created by vbwx on 12/5/21.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "UINavigationItem_Custom.h"


@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize backButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Master";
    }
    return self;
}

- (void)dealloc
{
    [_detailViewController release];
    [super dealloc];
}

- (IBAction) displayAlert:(id)sender
{
    QAConfirmAlert(@"You're awesome!", @"True dat", nil);
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightCustomBarButton = button;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = @"Detail";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil] autorelease];
        self.detailViewController.parent = self;
    }
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
