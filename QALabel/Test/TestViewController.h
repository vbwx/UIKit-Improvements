//
//  TestViewController.h
//  QALabel
//
//  Created by vbwx on 12/4/9.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "QALabel.h"

@interface TestViewController : UIViewController
{
    IBOutlet QALabel *label;
}

- (IBAction) changeAlignment:(id)sender;
- (IBAction) changeHorizontalAlignment:(id)sender;

@end
