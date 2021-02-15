//
//  ViewController.m
//  NSStringDemo
//
//  Created by lian shan on 2021/1/27.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *spm = @"";
    spm = [spm stringByAppendingString:@"111"];
    spm = [spm stringByAppendingString:@"222"];

    NSLog(@"%@", spm);
}


@end
