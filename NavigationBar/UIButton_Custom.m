//
//  UIButton_Custom.m
//
//  Created by vbwx on 12/4/12.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "UIButton_Custom.h"
#import <math.h>

#define TITLE_COLOR [UIColor blackColor]
#define SHADOW_COLOR [UIColor clearColor]


@implementation UIButton (CustomButton)

- (void) sizeToFit
{
    if (self.buttonType == UIButtonTypeCustom)
    {
        CGRect frame = self.frame;
        frame.size = (self.currentImage ? self.currentImage.size :
                     [self.currentTitle sizeWithFont:self.titleLabel.font]);
        if (self.currentBackgroundImage)
        {
            UIImage *bg = self.currentBackgroundImage;
            frame.size.width += bg.leftCapWidth*2 + 6;
            frame.size.height = bg.size.height;
        }
        self.frame = frame;
    }
    else
        [super sizeToFit];
}

- (void) mimicBarButton:(UIBarButtonItem*)item
{
    if (item.image)
    {
        [self setTitle:nil forState:UIControlStateNormal];
        [self setImage:item.image forState:UIControlStateNormal];
    }
    else
    {
        [self setImage:nil forState:UIControlStateNormal];
        [self setTitle:item.title forState:UIControlStateNormal];
    }
    [self setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    [self setTitleShadowColor:SHADOW_COLOR forState:UIControlStateNormal];
    self.selected = (item.style == UIBarButtonItemStyleDone);
    if (ANY(self.allTargets) != item.target)
    {
        [self removeTarget:nil action:NULL forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:item.target action:item.action forControlEvents:UIControlEventTouchUpInside];
    }
    [self sizeToFit];
}

@end
