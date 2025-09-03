//
//  UIView_Additions.h
//
//  Created by vbwx on 12/3/12.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//


@interface UIView (ViewAdditions)

- (UIView*) subviewWithTag:(int)tag;
- (UIView*) viewAtIndex:(NSUInteger)idx ofClass:(Class)cls;
- (UIView*) viewAtIndex:(NSUInteger)idx kindOfClass:(Class)cls;
- (UIView*) subviewAtIndex:(NSUInteger)idx ofClass:(Class)cls;
- (UIView*) subviewAtIndex:(NSUInteger)idx kindOfClass:(Class)cls;

@end
