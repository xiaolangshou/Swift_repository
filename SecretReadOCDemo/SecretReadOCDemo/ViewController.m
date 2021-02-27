//
//  ViewController.m
//  SecretReadOCDemo
//
//  Created by Thomas Lau on 2021/2/17.
//  Copyright © 2021 TLLTD. All rights reserved.
//

#import "ViewController.h"
//#import <Secrets/Secrets-Swift.h>
@import Secrets;

@interface ViewController ()

@property (strong, nonatomic) SecretsManager *mng;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mng = [[SecretsManager alloc] init];
    [self.mng func1];
    [self.mng func2];
}


@end
