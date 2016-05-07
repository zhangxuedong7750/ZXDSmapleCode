//
//  ViewController.m
//  ZXDSmapleCode
//
//  Created by 张雪东 on 16/4/19.
//  Copyright © 2016年 张雪东. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "ZXDBlackMagic.h"
#import "ZXDDebugTool.h"

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
    
    NSString *str = [NSString stringWithFormat:@"张"];
    [ZXDDebugTool hookObject:str whenDeallocLogString:@"str被释放"];
    
    /*
        NSTaggedPointerString
    */
    NSString *tagStr = [NSString stringWithFormat:@"123456789"];
    NSLog(@"address: %p  Class: %@",tagStr,[tagStr class]);
    [ZXDDebugTool hookObject:tagStr whenDeallocLogString:@"tagStr被释放"];
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
