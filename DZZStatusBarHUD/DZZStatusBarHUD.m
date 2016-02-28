//
//  DZZStatusBarHUD.m
//  DZZStatusBarHUDExample
//
//  Created by 杜铮志 on 16/2/28.
//  Copyright © 2016年 杜铮志. All rights reserved.
//

#import "DZZStatusBarHUD.h"

#define DZZTitleFont [UIFont systemFontOfSize:12]

/** 消息的停留时间 */
static CGFloat const DZZTitleDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const DZZAnimationDuration = 0.25;
/** 全局的窗口 */
static UIWindow *_window;
/** 定时器 */
static NSTimer *_timer;

@implementation DZZStatusBarHUD

// 显示窗口
+ (void)showWindow{
    
    // var
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0,- windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    _window.hidden = YES; // 先隐藏
    _window = [[UIWindow alloc] init];
    _window.backgroundColor = [UIColor blackColor];
    // window的排序
    _window.windowLevel = UIWindowLevelAlert;
    _window.frame = frame;
    _window.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:DZZAnimationDuration animations:^{
        
        _window.frame = frame;
        
    }];
    
}

/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)DZZ_showTitle:(NSString *)title image:(UIImage *)image{
    
    [_timer invalidate];
    
    [self showWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = DZZTitleFont;
    
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
    }
    button.frame = _window.frame;
    [_window addSubview:button];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:DZZTitleDuration target:self selector:@selector(DZZ_Hide) userInfo:nil repeats:NO];
    
}

/** 显示普通信息 */
+ (void)DZZ_showTitle:(NSString *)title{
    
    [self DZZ_showTitle:title image:nil];
}

/** 显示成功信息 */
+ (void)DZZ_showSuccess:(NSString *)success{
    
    NSLog(@"%@",NSTemporaryDirectory());
    [self DZZ_showTitle:success image:[UIImage imageNamed:@"DZZStatusBarHUD.bundle/success"]];
}

/** 显示失败信息 */
+ (void)DZZ_showLose:(NSString *)lose{
    
    [self DZZ_showTitle:lose image:[UIImage imageNamed:@"DZZStatusBarHUD.bundle/error"]];
}

/** 显示正在处理信息 */
+ (void)DZZ_showLoading:(NSString *)loading{
    
    [_timer invalidate];
    _timer = nil;
    
    [self showWindow];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = DZZTitleFont;
    label.frame = _window.frame;
    //文字剧中
    label.textAlignment = NSTextAlignmentCenter;
    label.text = loading;
    label.textColor = [UIColor whiteColor];
    [_window addSubview:label];
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    //想让它出来就要调用下面👇这段话  开始动画
    [loadingView startAnimating];
    
    // 文字宽度
    CGFloat titleW = [loading sizeWithAttributes:@{NSFontAttributeName : DZZTitleFont}].width;
    CGFloat centerX = (_window.frame.size.width - titleW) * 0.5 - 20;
    CGFloat centerY = _window.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [_window addSubview:loadingView];

}

/** 隐藏 */
+(void)DZZ_Hide
{
    [UIView animateWithDuration:DZZAnimationDuration animations:^{
        CGRect frame = _window.frame;
        frame.origin.y =  - frame.size.height;
        _window.frame = frame;
    } completion:^(BOOL finished) {
        _window = nil;
        _window = nil;
    }];
}







@end
