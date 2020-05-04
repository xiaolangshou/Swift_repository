//
//  ViewController.m
//  AsyncLoadImageDemo2
//
//  Created by Liu Tao on 2018/12/8.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) UIImageView *exampleImgV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupWebImage];
}

// back queue download image
// main queue display image
//
- (void)setupWebImage {
    
    self.imageUrl = @"https://static.arkcloudtech.com/image/webnative/topBack.png";
    self.exampleImgV = [[UIImageView alloc] init];
    [self.exampleImgV setContentMode: UIViewContentModeScaleAspectFit];
    self.exampleImgV.backgroundColor = UIColor.cyanColor;
    [self.view addSubview:self.exampleImgV];
    //
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        // 下载图片
        if (!self.imageUrl) { return; }
        NSData *imgData = [NSData dataWithContentsOfURL: [[NSURL alloc] initWithString: self.imageUrl]];
        // iOS UI操作只能在主线程
        if (imgData) {
            dispatch_queue_t mainQueue = dispatch_get_main_queue();
            dispatch_async(mainQueue, ^{
                UIImage *img = [UIImage imageWithData: imgData];
                if (img.size.width > UIScreen.mainScreen.bounds.size.width
                    || img.size.height > UIScreen.mainScreen.bounds.size.height)
                {
                    self.exampleImgV.frame = CGRectMake(0,
                                                        0,
                                                        self.view.bounds.size.width,
                                                        self.view.bounds.size.height);
                } else {
                    self.exampleImgV.frame = CGRectMake(0,
                                                        0,
                                                        img.size.width,
                                                        img.size.height);
                }
                self.exampleImgV.center = self.view.center;
                self.exampleImgV.image = img;
            });
        }
    });
}

@end
