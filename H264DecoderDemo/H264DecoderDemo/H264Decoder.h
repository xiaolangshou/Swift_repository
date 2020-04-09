//
//  H264Decoder.h
//  H264DecoderDemo
//
//  Created by Liu Tao on 2020/4/8.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <VideoToolbox/VideoToolbox.h>

NS_ASSUME_NONNULL_BEGIN
@protocol H264DecoderDelegate <NSObject>

- (void)decoder: decoder didDecodingFrame: pixelBuffer;

@end

@interface H264Decoder : NSObject {
    VTDecompressionSessionRef _deocderSession;               //  解码  session
    CMVideoFormatDescriptionRef _decoderFormatDescription;   //  解码 format 封装了sps和pps
    //sps & pps
    uint8_t *_sps;
    NSInteger _spsSize;
    uint8_t *_pps;
    NSInteger _ppsSize;
}

@property (weak, nonatomic) id<H264DecoderDelegate> delegate;

- (void)decodeNalu:(uint8_t *)frame size:(uint32_t) frameSize;
- (BOOL)initH264Decoder;
- (CVPixelBufferRef)decode:(uint8_t *)frame withSize:(uint32_t)frameSize;
- (void)didReadData: (NSData *)data;

@end

NS_ASSUME_NONNULL_END
