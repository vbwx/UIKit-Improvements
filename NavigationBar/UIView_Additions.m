//
//  UIView_Additions.m
//
//  Created by Bernhard Waldbrunner on 12/3/12.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "UIView_Additions.h"

@implementation UIView (ViewAdditions)

- (UIView*) subviewWithTag:(int)tag
{
    for (UIView *v in self.subviews)
        if (v.tag == tag)
            return v;
    return nil;
}

- (UIView*) viewAtIndex:(NSUInteger)idx ofClass:(Class)cls
{
    for (UIView *v in self.subviews)
        if ([v isMemberOfClass:cls] && idx-- == 0)
            return v;
    return nil;
}

- (UIView*) subviewAtIndex:(NSUInteger)idx ofClass:(Class)cls
{
    for (UIView *v in self.subviews)
    {
        if ([v isMemberOfClass:cls] && idx-- == 0)
            return v;
        UIView *view = [v subviewAtIndex:idx ofClass:cls];
        if (view)
            return view;
    }
    return nil;
}

- (UIView*) viewAtIndex:(NSUInteger)idx kindOfClass:(Class)cls
{
    for (UIView *v in self.subviews)
        if ([v isKindOfClass:cls] && idx-- == 0)
            return v;
    return nil;
}

- (UIView*) subviewAtIndex:(NSUInteger)idx kindOfClass:(Class)cls
{
    for (UIView *v in self.subviews)
    {
        if ([v isKindOfClass:cls] && idx-- == 0)
            return v;
        UIView *view = [v subviewAtIndex:idx kindOfClass:cls];
        if (view)
            return view;
    }
    return nil;
}

@end
