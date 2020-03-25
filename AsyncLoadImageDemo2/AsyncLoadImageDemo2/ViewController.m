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
    
    //
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        // 下载图片
        if (!self.imageUrl) { return ;}
        NSData *imgData = [NSData dataWithContentsOfURL:self.imageUrl];
        //
        if (imgData) {
            dispatch_queue_t mainQueue = dispatch_get_main_queue();
            dispatch_async(mainQueue, ^{
                UIImage *img = [UIImage imageWithData:imgData];
                if (img.size.width > UIScreen.mainScreen.bounds.size.width
                    || img.size.height > UIScreen.mainScreen.bounds.size.height)
                {
                    self.exampleImgV.frame.size = self.view.bounds.size;
                } else {
                    self.exampleImgV.frame.size = img.size;
                }
                self.exampleImgV.center = self.view.bounds.size
            })
        }
    })
}

@end
