//
//  WXSwiftTestModule.m
//  WeexDemo
//
//  Created by lian shan on 2021/1/8.
//

#import "WXSwiftTestModule.h"
#import "WeexDemo-Swift.h"

@implementation WXSwiftTestModule

#pragma clang diagnostic push //关闭unknow selector的warrning
#pragma clang diagnostic ignored "-Wundeclared-selector"

WX_EXPORT_METHOD(@selector(printSome:callback:)) //Swift 中定义的方法，XCode 转换成的最终的方法名称，在`WeexDemo-Swift.h`里面查看

#pragma clang diagnostic pop

@end
