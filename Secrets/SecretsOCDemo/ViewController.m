//
//  ViewController.m
//  SecretsOCDemo
//
//  Created by Thomas Lau on 2021/2/17.
//  Copyright © 2021 TLLTD. All rights reserved.
//

#import "ViewController.h"
#import <Secrets/Secrets-Swift.h>

@interface ViewController ()

@property (strong, nonatomic) SecretsManager *secretsManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.secretsManager = [[SecretsManager alloc] init];
    [self.secretsManager func1];
}


@end
