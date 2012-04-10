//
//  QALabel.m
//
//  Created by Bernhard Waldbrunner on 12/4/9.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "QALabel.h"


@implementation QALabel

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        verticalAlign = UIControlContentVerticalAlignmentCenter;
        addedLines = 0;
        originalHeight = frame.size.height;
    }
    return self;
}

- (void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
    originalHeight = frame.size.height;
}

- (UIControlContentVerticalAlignment) verticalAlignment
{
    return verticalAlign;
}

- (void) setVerticalAlignment:(UIControlContentVerticalAlignment)alignment
{
    if (verticalAlign == alignment)
        return;
    
    self.numberOfLines = 0;
    if (addedLines > 0)
    {
        self.text = (verticalAlign == UIControlContentVerticalAlignmentTop ?
                     [self.text substringToIndex:self.text.length - addedLines*2] :
                     [self.text substringFromIndex:addedLines*2]);
        addedLines = 0;
    }
    if (alignment != UIControlContentVerticalAlignmentFill && self.frame.size.height != originalHeight)
    {
        CGRect frame = self.frame;
        frame.size.height = originalHeight;
        super.frame = frame;
    }
    if (alignment == UIControlContentVerticalAlignmentBottom || alignment == UIControlContentVerticalAlignmentTop)
    {
        CGSize fontSize = [self.text sizeWithFont:self.font];
        CGSize theStringSize = [self.text sizeWithFont:self.font constrainedToSize:self.frame.size
                                         lineBreakMode:self.lineBreakMode];
        addedLines = (self.frame.size.height - theStringSize.height) / fontSize.height;
        BOOL top = (alignment == UIControlContentVerticalAlignmentTop);
        NSMutableString *pad = [NSMutableString stringWithCapacity:self.text.length + addedLines*2];
        for (short i = 0; i < addedLines; i++)
            [pad appendString:(top ? @"\n " : @" \n")];
        if (top)
            [pad insertString:self.text atIndex:0];
        else
            [pad appendString:self.text];
        self.text = pad;
    }
    else if (alignment == UIControlContentVerticalAlignmentFill)
    {
        originalHeight = self.frame.size.height;
        CGRect frame = self.frame;
        frame.size.height = [self sizeThatFits:CGSizeZero].height;
        super.frame = frame;
    }
    verticalAlign = alignment;
}

@end
