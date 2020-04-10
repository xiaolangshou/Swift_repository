//
//  ViewController.m
//  H264DecoderDemo
//
//  Created by Liu Tao on 2020/4/8.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

#import "ViewController.h"
#import "H264Decoder.h"

@interface ViewController ()

@property (strong, nonatomic) H264Decoder *h264Decoder;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.h264Decoder = [[H264Decoder alloc] init];
}

// 获取数据进行解码
- (void)didReadData: (NSData *)data {
    [self.h264Decoder decodeNalu:(uint8_t *)[data bytes] size:(uint32_t)data.length];
}

@end
