//
//  ZXDDebugTool.m
//  test01
//
//  Created by 张雪东 on 16/5/7.
//  Copyright © 2016年 ZXD. All rights reserved.
//

#import "ZXDDebugTool.h"
#import <objc/runtime.h>

static const char *debugKey = "hookDealloc";

@interface Deallocer : NSObject
@property (nonatomic ,copy) NSString *stringDealloc;
@end

@implementation Deallocer
- (void)dealloc
{
    NSLog(@"%@", _stringDealloc);
}
@end


@implementation ZXDDebugTool
+ (void)hookObject:(id)anObject whenDeallocLogString:(NSString *)string
{
    Deallocer *deallocer = [[Deallocer alloc] init];
    deallocer.stringDealloc = string;
    objc_setAssociatedObject(anObject, debugKey, deallocer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
