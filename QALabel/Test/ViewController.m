//
//  ViewController.m
//  QALabel
//
//  Created by Bernhard Waldbrunner on 12/4/9.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

#pragma mark - View lifecycle

- (void) viewDidLoad
{
    [super viewDidLoad];
    lines = 0;
}

- (IBAction) changeAlignment:(id)sender
{
    switch (((UISegmentedControl*)sender).selectedSegmentIndex)
    {
        case 0:
            label.verticalAlignment = UIControlContentVerticalAlignmentTop;
            break;
        case 1:
            label.verticalAlignment = UIControlContentVerticalAlignmentCenter;
            break;
        case 2:
            label.verticalAlignment = UIControlContentVerticalAlignmentBottom;
            break;
        case 3:
            label.verticalAlignment = UIControlContentVerticalAlignmentFill;
            break;
    }
}

@end
