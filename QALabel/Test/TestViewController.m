//
//  TestViewController.m
//  QALabel
//
//  Created by Bernhard Waldbrunner on 12/4/9.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "TestViewController.h"


@implementation TestViewController

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
    NSLog(@"%d / %d", label.numberOfLines, label.displayedLines);
}

- (IBAction) changeHorizontalAlignment:(id)sender
{
    switch (((UISegmentedControl*)sender).selectedSegmentIndex)
    {
        case 0:
            label.textAlignment = UITextAlignmentLeft;
            break;
        case 1:
            label.textAlignment = UITextAlignmentCenter;
            break;
        case 2:
            label.textAlignment = UITextAlignmentRight;
            break;
    }
}

@end
