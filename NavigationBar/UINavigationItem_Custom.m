//
//  UINavigationItem_Custom.m
//
//  Created by vbwx on 12/4/9.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "UINavigationItem_Custom.h"
#import "UIButton_Custom.h"

#define TITLE_COLOR [UIColor whiteColor]

static const CGFloat ShadowAlpha = 0.5;


@implementation UINavigationItem (CustomNavItem)

+ (UIButton*) createCustomButton:(UIBarButtonItem*)item
{
    if (!item)
        return nil;

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *bg = [[UIImage imageNamed:@"barbutton.png"] stretchableImageWithLeftCapWidth:6 topCapHeight:0];
    UIImage *bgSel = [[UIImage imageNamed:@"barbutton-sel.png"] stretchableImageWithLeftCapWidth:6 topCapHeight:0];
    [button setBackgroundImage:bg forState:UIControlStateNormal];
    [button setBackgroundImage:bgSel forState:UIControlStateHighlighted];
    [button setBackgroundImage:bgSel forState:UIControlStateSelected];
    button.adjustsImageWhenHighlighted = NO;
    button.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    [button setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor colorWithWhite:0 alpha:ShadowAlpha] forState:UIControlStateNormal];
    button.titleLabel.shadowOffset = CGSizeMake(0, 1);
    button.tag = 1111;
    [button mimicBarButton:item];

    return button;
}

- (void) setRightCustomBarButton:(UIBarButtonItem*)item
{
    if (self.rightCustomBarButton && item)
        [self.rightCustomButton mimicBarButton:item];
    else
        self.rightCustomButton = [UINavigationItem createCustomButton:item];
}

- (UIBarButtonItem*) rightCustomBarButton
{
    return (self.rightBarButtonItem.customView.tag == 1111 ? self.rightBarButtonItem : nil);
}

- (void) setLeftCustomBarButton:(UIBarButtonItem*)item
{
    if (self.leftCustomBarButton && item)
        [self.leftCustomButton mimicBarButton:item];
    else
        self.leftCustomButton = [UINavigationItem createCustomButton:item];
}

- (UIBarButtonItem*) leftCustomBarButton
{
    return (self.rightBarButtonItem.customView.tag == 1111 ? self.leftBarButtonItem : nil);
}

- (void) setRightCustomButton:(UIButton*)button
{
    if (!self.rightBarButtonItem || !button)
        self.rightBarButtonItem = (button ? [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease] : nil);
    else
        self.rightBarButtonItem.customView = button;
}

- (void) setLeftCustomButton:(UIButton*)button
{
    if (!self.leftBarButtonItem || !button)
        self.leftBarButtonItem = (button ? [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease] : nil);
    else
        self.leftBarButtonItem.customView = button;
}

- (UIButton*) leftCustomButton
{
    return (C_IS(self.leftBarButtonItem.customView, UIButton) ?
           (UIButton*)self.leftBarButtonItem.customView : nil);
}

- (UIButton*) rightCustomButton
{
    return (C_IS(self.rightBarButtonItem.customView, UIButton) ?
           (UIButton*)self.rightBarButtonItem.customView : nil);
}

- (void) setTitle:(NSString*)title
{
    if (!title || LEN(title) == 0)
    {
        self.titleView = nil;
        return;
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = CLEAR;
    label.font = [UIFont boldSystemFontOfSize:20];
    label.shadowOffset = CGSizeMake(0, 1);
    label.shadowColor = [UIColor colorWithWhite:0 alpha:ShadowAlpha];
    label.textColor = TITLE_COLOR;
    self.titleView = label;
    [label release];
    label.text = title;
    [label sizeToFit];
}

- (NSString*) title
{
    if (!self.titleView)
        self.title = [self valueForKey:@"_title"];
    if (C_IS(self.titleView, UILabel))
        return ((UILabel*)self.titleView).text;
    return [self valueForKey:@"_title"];
}

@end
