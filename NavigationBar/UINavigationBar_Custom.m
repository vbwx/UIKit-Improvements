//
//  UINavigationBar_Custom.m
//
//  Created by Bernhard Waldbrunner on 12/4/7.
//  Copyright (c) 2012 QuantApps. All rights reserved.
//

#import "UINavigationBar_Custom.h"
#import "UIView_Additions.h"


static NSString *const BackgroundFile = @"bg-navbar.png";


@implementation UINavigationBar (CustomNavBar)

- (void) drawRect:(CGRect)rect
{
    [[UIImage imageNamed:BackgroundFile] drawInRect:CGRectMake(0, 0,
                                                    self.frame.size.width, self.frame.size.height)];
}

- (void) setClipsToBounds:(BOOL)ignore
{
    UIImageView *img;
    if (![self viewWithTag:9999] && (img = QAImage(@"navbar.png")))
    {
        img.tag = 9999;
        CGRect r = img.frame;
        r.origin = CGPointMake(0, self.frame.size.height - 1);
        img.frame = r;
        [self addSubview:img];
    }
}

- (BOOL) clipsToBounds
{
    return NO;
}

- (void) customizeAppearance
{
    if ([UINavigationBar respondsToSelector:@selector(appearance)] && self.tag != 9999)
    {
        self.tag = 9999;
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:BackgroundFile]
                                      forBarMetrics:UIBarMetricsDefault];
    }
    self.clipsToBounds = NO;
}

@end
