//
//  QABackgroundView.m
//
//  Created by Bernhard Waldbrunner on 12/4/7.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "QABackgroundView.h"


@implementation QABackgroundView

- (void) layoutSubviews
{
    if (![self viewWithTag:7777])
    {
        UIImageView *bg = QAImage(@"bg.png");
        bg.tag = 7777;
        [self insertSubview:bg atIndex:0];
    }
}

@end
