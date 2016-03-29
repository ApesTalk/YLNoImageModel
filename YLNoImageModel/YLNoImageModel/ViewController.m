//
//  ViewController.m
//  YLNoImageModel
//
//  Created by TK-001289 on 16/3/29.
//  Copyright (c) 2016年 YL. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+YLNoImageModel.h"
#import "UIImageView+YLNoImageModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _myImageView.contentMode = UIViewContentModeScaleAspectFill;
    _myImageView.clipsToBounds = YES;
    [_myImageView yl_setNoImageModelWithUrl:[NSURL URLWithString:@"http://www.microfotos.com/pic/0/90/9023/902372preview4.jpg"]
                           placeHolderImage:[UIImage imageNamed:@"holder"]];
    
    _myButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [_myButton yl_setNoImageModelWithUrl:[NSURL URLWithString:@"http://hospital.88yz.com/UploadFile/images/%E5%AE%A0%E7%89%A9%E7%BE%8E%E5%AE%B9.jpg"]
                        placeHolderImage:[UIImage imageNamed:@"holder"]];
    
    [_myButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonClick
{
    NSLog(@"button clicked");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
