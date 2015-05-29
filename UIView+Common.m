//
//  UIView+Common.m
//  table
//
//  Created by lei_dream on 15/5/29.
//  Copyright (c) 2015年 lei_dream. All rights reserved.
//
#import "UIView+Common.h"

@implementation UIView (Common)

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)removeAllSubviews
{
	while (self.subviews.count) 
    {
		UIView *child = self.subviews.lastObject;
		[child removeFromSuperview];
	}
}

@end
