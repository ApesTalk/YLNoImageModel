
# YLNoImageModel的使用简介

## 1.使用场景

APP中为了提升用户体验，当用户处在2G/3G/4G网络情况下，有无图模式功能，并且在用户开启无图模式的情况下会有如下处理逻辑：

- 如果目标图片之前已经加载过了，则显示已经加载过的图片；
- 如果目标图片之前没有加载过，则只显示一个placeholderImage，并且显示文案“点击加载图片”，当用户确认点击之后，再加载目标图片。

这个时候，用YLNoImageModel可以很方便的处理。

## 2.几点说明
为了方便管理图片以及判断图片是否已经加载过，这里使用第三方库SDWebImage来管理。网络情况判断推荐使用Reachability第三方库。


## 3.使用方法
- 1.导入需要的Reachability以及SDWebImage第三方库；
- 2.在项目中监听网络情况变动，修改本地保存的无图模式开关。
- 3.在需要展示无图模式的地方，调用如下方法。以UIButton为例，通常会有点击加载图片和点击查看大图的功能：

```
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
```