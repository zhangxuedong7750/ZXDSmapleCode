//
//  ViewController.m
//  ZXDSmapleCode
//
//  Created by 张雪东 on 16/4/19.
//  Copyright © 2016年 张雪东. All rights reserved.
//

#import "ViewController.h"
#import "ZXDBlackMagic.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //ZXDBlackMagic使用
    zxd_autoBlock{
    
        NSLog(@"this is auto block");
    };
    
    CGPoint p = CGPointMake(1, 3);
    NSLog(@"%s",zxd_encode(p));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
