//
//  QALabel.h
//
//  Created by Bernhard Waldbrunner on 12/4/9.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

@interface QALabel : UILabel
{
    UIControlContentVerticalAlignment verticalAlign;
    short addedLines;
    CGFloat originalHeight;
}

@property(assign) UIControlContentVerticalAlignment verticalAlignment;

@end
