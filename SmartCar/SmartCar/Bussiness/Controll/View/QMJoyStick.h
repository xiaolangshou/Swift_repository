//
//  QMJoyStick.h
//  QMJoyStick
//
//  Created by metthew on 2016/10/13.
//  Copyright © 2016年 metthew. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString*(^Direction)(void);

@interface QMJoyStick : UIView

@property (nonatomic, strong) UIImageView *stickBgView;
@property (nonatomic, strong) UIImageView *stickView;

@end
