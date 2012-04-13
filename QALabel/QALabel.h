//
//  QALabel.h
//
//  Created by Bernhard Waldbrunner on 12/4/9
//  Copyright (c) 2012 QuantApps
//
//  Special thanks to:
//  http://stackoverflow.com/users/411823/d-s
//  http://stackoverflow.com/users/74118/nevan-king
//

@interface QALabel : UILabel
{
    UIControlContentVerticalAlignment verticalAlign;
    short addedLines;
    CGFloat originalHeight;
}

@property(assign) UIControlContentVerticalAlignment verticalAlignment;
@property(readonly) NSInteger displayedLines;

@end
