//
//  WeexModule.m
//  WeexDemo
//
//  Created by lian shan on 2021/1/15.
//

#import "PaymentWxModule.h"

@implementation PaymentWxModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(writeBack:params:))

WX_EXPORT_METHOD(@selector(writeBackByTag:params:))

WX_EXPORT_METHOD(@selector(requestTotalData))

WX_EXPORT_METHOD(@selector(requestComponentData:))

WX_EXPORT_METHOD(@selector(requestComponentDataByTag:))

WX_EXPORT_METHOD(@selector(submitAsync:))

WX_EXPORT_METHOD(@selector(submitAsyncByTag:))

WX_EXPORT_METHOD(@selector(jumpUrl:type:))

WX_EXPORT_METHOD(@selector(notifyDataSetChange))

WX_EXPORT_METHOD(@selector(showLoading))

WX_EXPORT_METHOD(@selector(hideLoading))

WX_EXPORT_METHOD(@selector(openFloatingLayer:params:width:height:))

WX_EXPORT_METHOD(@selector(closeFloatingLayer))

WX_EXPORT_METHOD(@selector(responseBeforeSubmit:type:errorMessage:))

WX_EXPORT_METHOD(@selector(responseBeforeSubmitByTag:type:errorMessage:))

WX_EXPORT_METHOD(@selector(doVerifyBeforeSubmit:))

WX_EXPORT_METHOD(@selector(doVerifyBeforeSubmitByTag:))

@end
