//
//  H264Encoder.h
//  NativeCameraDemo
//
//  Created by Thomas Lau on 2020/4/15.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^H264DataBlock)(NSData *data);

@interface H264Encoder : NSObject

@property (copy, nonatomic) H264DataBlock dataBlock;
/**
 硬编码

 @param sampleBuffer CMSampleBufferRef每一帧原始数据
 @param h264Datablock H264 十六进制数据
 */
- (void)encodeSampleBuffer:(CMSampleBufferRef)sampleBuffer
             H264DataBlock:h264Datablock;


/**
 硬编码
 
 @param sampleBuffer CMSampleBufferRef每一帧原始数据
 @param filePath 本地存储路径
 @param h264Datablock H264 十六进制数据
 */
- (void)encodeSampleBuffer:(CMSampleBufferRef)sampleBuffer
                  FilePath:(NSString * _Nullable) filePath
             H264DataBlock:h264Datablock;


/**
 结束编码
 */
- (void)endEncode;

@end

NS_ASSUME_NONNULL_END
