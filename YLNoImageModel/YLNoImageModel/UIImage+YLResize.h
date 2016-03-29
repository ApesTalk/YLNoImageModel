//
//  UIImage+YLResize.h
//  YLNoImageModel
//
//  Created by TK-001289 on 16/3/29.
//  Copyright (c) 2016年 YL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YLResize)

//绘制目标尺寸大小的图像
-(instancetype)resizeToSize:(CGSize)size;

@end
