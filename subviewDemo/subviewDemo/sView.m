//
//  sView.m
//  subviewDemo
//
//  Created by lian shan on 2021/1/28.
//

#import "sView.h"

@implementation sView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.redColor;
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

@end
