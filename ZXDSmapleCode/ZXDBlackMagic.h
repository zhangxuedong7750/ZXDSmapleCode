//
//  ZXDBlackMagic.h
//  ZXDSmapleCode
//
//  Created by 张雪东 on 16/4/20.
//  Copyright © 2016年 张雪东. All rights reserved.
//

#import <Foundation/Foundation.h>

static void blockCleanUp(__strong void(^*block)(void)){

    (*block)();
}

// 当当前作用域结束时自动执行{}里面的方法
#define zxd_autoBlock \
        __strong void(^block)(void) __attribute__((cleanup(blockCleanUp), unused)) = ^


//
#define zxd_encode(var) @encode(__typeof__(var))
