//
//  H264Decoder.m
//  H264DecoderDemo
//
//  Created by Liu Tao on 2020/4/8.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

#import "H264Decoder.h"

@implementation H264Decoder

// 解码操作, 调用解码方法 采集sps pps 关键帧 其他帧数据
- (void)decodeNalu:(uint8_t *)frame size:(uint32_t) frameSize {
    
    int nalu_type = (frame[4] & 0x1F);
    CVPixelBufferRef pixelBuffer = NULL;
    uint32_t nalSize = (uint32_t)(frameSize - 4);
    uint8_t *pNalSize = (uint8_t*)(&nalSize);
    frame[0] = *(pNalSize + 3);
    frame[1] = *(pNalSize + 2);
    frame[2] = *(pNalSize + 1);
    frame[3] = *(pNalSize);
    
    // 传输的时候。关键帧不能丢数据 否则绿屏 B/P可以丢 这样会卡顿
    switch (nalu_type)
    {
        case 0x05:
            //  关键帧
            if([self initH264Decoder])
            {
                pixelBuffer = [self decode:frame withSize:frameSize];
            }
            break;
        case 0x07:
            //  sps
            _spsSize = frameSize - 4;
            _sps = malloc(_spsSize);
            memcpy(_sps, &frame[4], _spsSize);
            break;
        case 0x08:
        {
            //  pps
            _ppsSize = frameSize - 4;
            _pps = malloc(_ppsSize);
            memcpy(_pps, &frame[4], _ppsSize);
            break;
        }
        default:
        {
            //  B/P其他帧
            if([self initH264Decoder]){
                pixelBuffer = [self decode:frame withSize:frameSize];
            }
            break;
        }
    }
}

// 初始化解码器
- (BOOL)initH264Decoder {
    if(_deocderSession) {
        return YES;
    }
    const uint8_t* const parameterSetPointers[2] = { _sps, _pps };
    const size_t parameterSetSizes[2] = { _spsSize, _ppsSize };
    // 1.获取H264视频格式描述信息
    // 参数1 alloc方式
    // 参数2 参数集合数量
    // parameterSetCount This parameter must be at least 2.可能和parameterSetPointers、parameterSetSizes有关系
    // 参数3 parameterSetPointers
    // 参数4 parameterSetSizes
    // 参数5 NALU 标识StartCode的长度
    // 参数6 CMVideoFormatDescriptionRef 视频格式描述容器 H264读取出来的信息放在这里面
    OSStatus status = CMVideoFormatDescriptionCreateFromH264ParameterSets(kCFAllocatorDefault,
                                                                          2, //param count
                                                                          parameterSetPointers,
                                                                          parameterSetSizes,
                                                                          4, //nal start code size
                                                                          &_decoderFormatDescription);
    
    if(status == noErr) {
        // 2.设置解压会话参数值
        NSDictionary* destinationPixelBufferAttributes = @{
                                                           (id)kCVPixelBufferPixelFormatTypeKey : [NSNumber numberWithInt:kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange], //硬解必须是 kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange 或者是kCVPixelFormatType_420YpCbCr8Planar
                                                           //这里款高和编码反的
                                                           (id)kCVPixelBufferOpenGLCompatibilityKey : [NSNumber numberWithBool:YES]
                                                           };
        
        // 3.设置回调方法
        VTDecompressionOutputCallbackRecord callBackRecord;
        // 回调函数
        callBackRecord.decompressionOutputCallback = didDecompress;
        // 输出的类
        callBackRecord.decompressionOutputRefCon = (__bridge void *)self;
        
        // 4.创建解压会话，这时候只是创建了并未开始解压工作
        // 参数1 session alloc方式
        // 参数2 CMVideoFormatDescriptionRef 视频格式描述信息 上面读取的
        // 参数3 特殊的decoder NULL-> VideoToolbox自行选择
        // 参数4 解压参数设置
        // 参数5 回调地址
        // 参数6 会话地址
        status = VTDecompressionSessionCreate(kCFAllocatorDefault,
                                              _decoderFormatDescription,
                                              NULL,
                                              (__bridge CFDictionaryRef)destinationPixelBufferAttributes,
                                              &callBackRecord,
                                              &_deocderSession);
        // 5.设置解压属性
        VTSessionSetProperty(_deocderSession, kVTDecompressionPropertyKey_ThreadCount, (__bridge CFTypeRef)[NSNumber numberWithInt:1]);
        VTSessionSetProperty(_deocderSession, kVTDecompressionPropertyKey_RealTime, kCFBooleanTrue);
    } else {
        NSLog(@"IOS8VT: reset decoder session failed status=%d", (int)status);
    }
    
    return YES;
}

// 开始解码
- (CVPixelBufferRef)decode:(uint8_t *)frame withSize:(uint32_t)frameSize {
    CVPixelBufferRef outputPixelBuffer = NULL;
    //1.根据帧信息获取编码后的CMBlockBuffer
    // 参数1 alloc方式
    // 参数2 frame
    // 参数3 frameSize
    // 参数4 blockAllocator NULL ->default
    // 参数5
    // 参数6
    CMBlockBufferRef blockBuffer = NULL;
    OSStatus status  = CMBlockBufferCreateWithMemoryBlock(NULL,
                                                          (void *)frame,
                                                          frameSize,
                                                          kCFAllocatorNull,
                                                          NULL,
                                                          0,
                                                          frameSize,
                                                          FALSE,
                                                          &blockBuffer);
    if(status == kCMBlockBufferNoErr) {
        CMSampleBufferRef sampleBuffer = NULL;
        const size_t sampleSizeArray[] = {frameSize};
        // 2.创建 CMSampleBuffer
        // 参数1 alloc方式
        // 参数2 CMBlockBufferRef 编码后的视频数据信息
        // 参数3 视频格式描述
        
        status = CMSampleBufferCreateReady(kCFAllocatorDefault,
                                           blockBuffer,
                                           _decoderFormatDescription ,
                                           1, 0, NULL, 1, sampleSizeArray,
                                           &sampleBuffer);
        if (status == kCMBlockBufferNoErr && sampleBuffer) {
            VTDecodeFrameFlags flags = 0;
            VTDecodeInfoFlags flagOut = 0;
            OSStatus decodeStatus = VTDecompressionSessionDecodeFrame(_deocderSession,
                                                                      sampleBuffer,
                                                                      flags,
                                                                      &outputPixelBuffer,
                                                                      &flagOut);
            
            if(decodeStatus == kVTInvalidSessionErr) {
                NSLog(@"IOS8VT: Invalid session, reset decoder session");
            } else if(decodeStatus == kVTVideoDecoderBadDataErr) {
                NSLog(@"IOS8VT: decode failed status=%d(Bad data)", (int)decodeStatus);
            } else if(decodeStatus != noErr) {
                NSLog(@"IOS8VT: decode failed status=%d", (int)decodeStatus);
            }
            CFRelease(sampleBuffer);
        }
        CFRelease(blockBuffer);
    }
    return outputPixelBuffer;
}

@end
