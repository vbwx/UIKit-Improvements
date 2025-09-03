//
//  UINavigationItem_Custom.h
//
//  Created by vbwx on 12/4/9.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

@interface UINavigationItem (CustomNavItem)

@property(retain) UIButton *rightCustomButton;
@property(retain) UIButton *leftCustomButton;
@property(assign) UIBarButtonItem *leftCustomBarButton;
@property(assign) UIBarButtonItem *rightCustomBarButton;

+ (UIButton*) createCustomButton:(UIBarButtonItem*)item;

@end
