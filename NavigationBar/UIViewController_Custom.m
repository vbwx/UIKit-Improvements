//
//  UIViewController_Custom.m
//
//  Created by vbwx on 12/2/29.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "UIViewController_Custom.h"
#import "UINavigationItem_Custom.h"


@implementation UIViewController (CustomVC)

- (void) replaceBackButton:(UIButton*)button
{
    self.navigationItem.hidesBackButton = YES;
    [button removeTarget:nil action:@selector(navigateBack:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(navigateBack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftCustomButton = button;
}

- (void) navigateBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
