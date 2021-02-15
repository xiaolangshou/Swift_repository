//
//  ViewController.m
//  subviewDemo
//
//  Created by lian shan on 2021/1/28.
//

#import "ViewController.h"
#import "sView.h"

@interface ViewController ()

@property (strong, nonatomic) sView *v;

@end

@implementation ViewController


/// 将对象销毁必须先解强引用，在置为nil
- (void)viewDidLoad {
    [super viewDidLoad];

    self.v = [[sView alloc] init];
    self.v.frame = CGRectMake(0, 10, 100, 100);
    [self.view addSubview:self.v];

    for (__strong UIView *i in self.view.subviews) {
        // self.view强引用 i,所以先移除
        [i removeFromSuperview];
    }

    self.v = nil;

    NSLog(@"%@", self.v.superview);
}


@end
