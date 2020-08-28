//
//  ViewController.m
//  LBffmpegDemo
//
//  Created by gold on 17/7/7.
//  Copyright © 2017年 Bison. All rights reserved.
//

#import "ViewController.h"
#import "LBffmpegTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     *在运行在真机的代码中必须把地址换成你自己的电脑IP（10.10.10.134）（不能再用local 本地了）
     *运行服务器的电脑和手机保证在同一WiFi下
     */
    // 推流
//    [[LBffmpegTool sharedInstance] pushFlow:@"resource.bundle/war3end.mp4" output_str:@"rtmp://192.168.1.107:1990/liveApp/room"];
    // FFmpeg获取摄像头设备
    [[LBffmpegTool sharedInstance] showDevice];
    [[LBffmpegTool sharedInstance] getMovieDevice: self.view];
}

@end
