//
//  UIButton+YLNoImageModel.h
//  YLNoImageModel
//
//  Created by TK-001289 on 16/3/29.
//  Copyright (c) 2016年 YL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YLNoImageModel)

/**自定义加载网络图片的方法 如果无图模式开启，将不加载图片[添加无图模式的判断]*/
-(void)yl_setNoImageModelWithUrl:(NSURL *)url placeHolderImage:(UIImage *)holder;

@end
