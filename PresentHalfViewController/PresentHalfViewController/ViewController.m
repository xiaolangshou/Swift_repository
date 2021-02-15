//
//  ViewController.m
//  PresentHalfViewController
//
//  Created by lian shan on 2021/2/7.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 100, 40)];
    [_btn addTarget:self action:@selector(showViewAction) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    _btn.backgroundColor = UIColor.cyanColor;
}

- (void)showViewAction {

    ViewController2 *tViewCon = [[ViewController2 alloc] init];
    //设置模式展示风格
    [tViewCon setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    //必要配置
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    self.providesPresentationContextTransitionStyle = YES;
    self.definesPresentationContext = YES;
    [self presentViewController:tViewCon animated:YES completion:nil];
}

- (void)viewWillLayoutSubviews {

    self.view.frame = CGRectMake(self.view.frame.origin.x,
                                 UIScreen.mainScreen.bounds.size.height / 2,
                                 UIScreen.mainScreen.bounds.size.width,
                                 UIScreen.mainScreen.bounds.size.height / 2);
    self.view.backgroundColor = [UIColor clearColor];
}

@end
