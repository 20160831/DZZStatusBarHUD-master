//
//  DZZStatusBarHUD.h
//  DZZStatusBarHUDExample
//
//  Created by 杜铮志 on 16/2/28.
//  Copyright © 2016年 杜铮志. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZZStatusBarHUD : NSObject

/**
 * 显示普通信息
 * @param titile       文字
 * @param image     图片
 */
+ (void)DZZ_showTitle:(NSString *)title image:(UIImage *)image;

/**
 * 显示普通信息
 */
+ (void)DZZ_showTitle:(NSString *)title;

/**
 * 显示成功信息
 */
+ (void)DZZ_showSuccess:(NSString *)success;

/**
 * 显示失败信息
 */
+ (void)DZZ_showLose:(NSString *)lose;

/**
 * 显示正在处理的信息
 */
+ (void)DZZ_showLoading:(NSString *)loading;

/**
 * 隐藏
 */
+ (void)DZZ_Hide;

@end
