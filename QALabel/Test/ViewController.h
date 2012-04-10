//
//  ViewController.h
//  QALabel
//
//  Created by Bernhard Waldbrunner on 12/4/9.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "QALabel.h"

@interface ViewController : UIViewController
{
    IBOutlet QALabel *label;
}

- (IBAction) changeAlignment:(id)sender;
- (IBAction) changeHorizontalAlignment:(id)sender;

@end
