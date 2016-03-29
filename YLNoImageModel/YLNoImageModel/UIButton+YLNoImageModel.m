//
//  UIButton+YLNoImageModel.m
//  YLNoImageModel
//
//  Created by TK-001289 on 16/3/29.
//  Copyright (c) 2016年 YL. All rights reserved.
//

#import "UIButton+YLNoImageModel.h"
#import "UIButton+WebCache.h"
#import "objc/runtime.h"
#import "UIImage+YLResize.h"

static void *kCoverButtonTag = &kCoverButtonTag;        ///< 覆盖按钮，点击加载
static void *kLoadImageUrl = &kLoadImageUrl;            ///< 图片url
static void *kHolderImage = &kHolderImage;              ///< 占位图片

@implementation UIButton (YLNoImageModel)
-(void)yl_setNoImageModelWithUrl:(NSURL *)url placeHolderImage:(UIImage *)holder
{
    UIImage *holderImg = [holder resizeToSize:self.bounds.size];
    
    if(kYLNoImageModeIsAvaliable){
        //开启了无图模式
        //异步判断是否已经加载过了当前图片
        [[SDWebImageManager sharedManager]cachedImageExistsForURL:url completion:^(BOOL isInCache) {
            if(isInCache){
                //如果已经加载过了，直接加载
                if(self.coverButton){
                    [self.coverButton removeFromSuperview];
                }
                
                [self sd_setImageWithURL:url forState:UIControlStateNormal placeholderImage:holderImg];
            }else{
                //如果没有加载过，则显示点击查看显示图片
                [self setImage:holderImg forState:UIControlStateNormal];
                self.loadImageUrl = url;
                self.holderImage = holderImg;
                
                if(!self.coverButton){
                    self.coverButton = [UIButton buttonWithType:UIButtonTypeCustom];
                    self.coverButton.titleLabel.font = [UIFont systemFontOfSize:20];
                    [self.coverButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [self.coverButton setTitle:@"点击加载图片" forState:UIControlStateNormal];
                    self.coverButton.contentMode = UIViewContentModeCenter;
                }
                [self.coverButton addTarget:self action:@selector(coverButtonAction) forControlEvents:UIControlEventTouchUpInside];
                self.coverButton.frame = self.bounds;
                [self addSubview:self.coverButton];
            }
        }];
    }else{
        //未开启无图模式
        if(self.coverButton){
            [self.coverButton removeFromSuperview];
        }
        
        [self sd_setImageWithURL:url forState:UIControlStateNormal placeholderImage:holderImg];
    }
}

-(UIButton *)coverButton
{
    return (UIButton *)objc_getAssociatedObject(self, kCoverButtonTag);
}

-(void)setCoverButton:(UIButton *)btn
{
    objc_setAssociatedObject(self, kCoverButtonTag, btn, OBJC_ASSOCIATION_RETAIN);
}

-(NSURL *)loadImageUrl
{
    return (NSURL *)objc_getAssociatedObject(self, kLoadImageUrl);
}

-(void)setLoadImageUrl:(NSURL *)url
{
    objc_setAssociatedObject(self, kLoadImageUrl, url, OBJC_ASSOCIATION_COPY);
}


-(UIImage *)holderImage
{
    return (UIImage *)objc_getAssociatedObject(self, kHolderImage);
}

-(void)setHolderImage :(UIImage *)img
{
    objc_setAssociatedObject(self, kHolderImage, img, OBJC_ASSOCIATION_RETAIN);
}

-(void)coverButtonAction
{
    if(self.coverButton){
        [self.coverButton removeFromSuperview];
    }
    
    [self sd_setImageWithURL:self.loadImageUrl forState:UIControlStateNormal placeholderImage:self.holderImage];
}

@end
