//
//  WeexModule.m
//  WeexDemo
//
//  Created by lian shan on 2021/1/15.
//

#import "PaymentWxModule.h"

@implementation PaymentWxModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(openFloatingLayer:params:width:height:))

WX_EXPORT_METHOD(@selector(submitAsync:))

WX_EXPORT_METHOD(@selector(submitAsyncByTag:))

//func alipay(_ platform: String, type: Int, gid: Int) {


@end
