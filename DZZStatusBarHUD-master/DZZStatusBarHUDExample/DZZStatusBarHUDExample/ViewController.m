//
//  ViewController.m
//  DZZStatusBarHUDExample
//
//  Created by 杜铮志 on 16/2/28.
//  Copyright © 2016年 杜铮志. All rights reserved.
//

#import "ViewController.h"
#import "DZZStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)success:(id)sender {
    
    [DZZStatusBarHUD DZZ_showSuccess:@"加载成功!"];
}
- (IBAction)lose:(id)sender {
    [DZZStatusBarHUD DZZ_showLose:@"加载失败!"];
}
- (IBAction)loading:(id)sender {
    [DZZStatusBarHUD DZZ_showLoading:@"正在加载"];
}
- (IBAction)hide:(id)sender {
    [DZZStatusBarHUD DZZ_Hide];
}
- (IBAction)titleAndImage:(id)sender {
    [DZZStatusBarHUD DZZ_showTitle:@"你随意啊" image:[UIImage imageNamed:@"check"]];
}

- (IBAction)title:(id)sender {
    
    [DZZStatusBarHUD DZZ_showTitle:@"10:30"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
