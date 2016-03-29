//
//  UIImage+YLResize.m
//  YLNoImageModel
//
//  Created by TK-001289 on 16/3/29.
//  Copyright (c) 2016年 YL. All rights reserved.
//

#import "UIImage+YLResize.h"

@implementation UIImage (YLResize)

-(instancetype)resizeToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
