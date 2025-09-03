//
//  QALabel.m
//
//  Created by vbwx on 12/4/9
//  Copyright (c) 2012 QuantApps
//
//  Special thanks to:
//  http://stackoverflow.com/users/411823/d-s
//  http://stackoverflow.com/users/74118/nevan-king
//

#import "QALabel.h"
#import <math.h>


@implementation QALabel

@synthesize highlightedShadowColor = highlightedShadow;


- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        verticalAlign = UIControlContentVerticalAlignmentCenter;
        addedLines = 0;
        originalHeight = frame.size.height;
        self.opaque = NO;
        self.backgroundColor = CLEAR;
        self.highlightedShadowColor = CLEAR;
    }
    return self;
}

- (id) initWithCoder:(NSCoder*)coder
{
    if (self = [super initWithCoder:coder])
    {
        addedLines = 0;
        self.highlightedShadowColor = CLEAR;
    }
    return self;
}

- (void) setFrame:(CGRect)frame
{
    super.frame = frame;
    originalHeight = frame.size.height;
}

- (void) setShadowColor:(UIColor*)shadowColor
{
    super.shadowColor = shadowColor;
    if (shadowColor != originalShadow)
    {
        DEL(originalShadow);
        originalShadow = [shadowColor retain];
    }
}

- (void) setHighlighted:(BOOL)highlighted
{
    super.shadowColor = (highlighted ? highlightedShadow : originalShadow);
    super.highlighted = highlighted;
}

- (UIControlContentVerticalAlignment) verticalAlignment
{
    return verticalAlign;
}

- (NSInteger) displayedLines
{
    if (super.numberOfLines == 1)
        return 1;

    CGFloat fontHeight = [self.text sizeWithFont:self.font].height;
    CGFloat stringHeight = [self.text sizeWithFont:self.font constrainedToSize:self.frame.size
                                      lineBreakMode:self.lineBreakMode].height;
    return roundf(stringHeight / fontHeight) - addedLines;
}

- (void) setVerticalAlignment:(UIControlContentVerticalAlignment)alignment
{
    if (verticalAlign == alignment)
        return;

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
    CGFloat fontHeight = [self.text sizeWithFont:self.font].height;
    CGFloat stringHeight = [self.text sizeWithFont:self.font constrainedToSize:self.frame.size
                                      lineBreakMode:self.lineBreakMode].height;
    self.numberOfLines = (alignment == UIControlContentVerticalAlignmentFill ? roundf(stringHeight / fontHeight) : 0);

    if (alignment == UIControlContentVerticalAlignmentBottom || alignment == UIControlContentVerticalAlignmentTop)
    {
        addedLines = roundf((self.frame.size.height - stringHeight) / fontHeight);
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
        frame.size.height = stringHeight;
        super.frame = frame;
    }
    verticalAlign = alignment;
}

- (void) dealloc
{
    DEL(originalShadow);
    DEL(highlightedShadow);
    [super dealloc];
}

@end
