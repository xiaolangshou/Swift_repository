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

static void didDecompress( void *decompressionOutputRefCon,
                          void *sourceFrameRefCon,
                          OSStatus status,
                          VTDecodeInfoFlags infoFlags,
                          CVImageBufferRef pixelBuffer,
                          CMTime presentationTimeStamp,
                          CMTime presentationDuration)
{
    CVPixelBufferRef *outputPixelBuffer = (CVPixelBufferRef *)sourceFrameRefCon;
    *outputPixelBuffer = CVPixelBufferRetain(pixelBuffer);
    H264Decoder *decoder = (__bridge H264Decoder *)decompressionOutputRefCon;
    
    if ([decoder.delegate respondsToSelector:@selector(decoder:didDecodingFrame:)]) {
        [decoder.delegate decoder: decoder didDecodingFrame: CFBridgingRelease(pixelBuffer)];
    }
}


// 获取数据进行解码
- (void)didReadData: (NSData *)data {
    [self.h264Decoder decodeNalu:(uint8_t *)[data bytes] size:(uint32_t)data.length];
}

@end
