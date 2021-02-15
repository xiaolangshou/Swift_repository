//
//  ViewController.m
//  OCImportSwiftFileDemo
//
//  Created by lian shan on 2021/2/8.
//

#import "ViewController.h"
#import <OCImportSwiftFileDemo-Swift.h>

@interface ViewController ()

@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) View2 *v2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _v2 = [[View2 alloc] init];
    _v2.frame = CGRectMake(10, 20, 100, 100);
    [self.view addSubview:_v2];
    _v2.backgroundColor = UIColor.blueColor;
}


@end
