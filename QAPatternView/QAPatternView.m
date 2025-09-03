//
//  QAPatternView.m
//
//  Created by vbwx on 12/4/6.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "QAPatternView.h"


@implementation QAPatternView

- (void) layoutSubviews
{
    if (self.tag != 8888)
    {
        super.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]];
        self.tag = 8888;
        UIImageView *img;
        CGRect r;

        if ((img = QAImage(@"bottom.png")))
        {
            img.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
            r = img.frame;
            r.origin = CGPointMake(0, self.frame.size.height);
            img.frame = r;
            [self addSubview:img];
        }
        if ((img = QAImage(@"top.png")))
        {
            img.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
            r = img.frame;
            r.origin = CGPointMake(0, -r.size.height);
            img.frame = r;
            [self addSubview:img];
        }
        if ((img = QAImage(@"bg-top.png")))
        {
            img.contentMode = UIViewContentModeTop;
            r = self.frame;
            r.origin = CGPointZero;
            img.frame = r;
            img.opaque = NO;
            img.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin |
                                   UIViewAutoresizingFlexibleRightMargin;
            img.clipsToBounds = YES;
            [self insertSubview:img atIndex:0];
        }
    }
}

@end
