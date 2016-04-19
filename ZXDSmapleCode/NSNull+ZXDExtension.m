//
//  NSNull+ZXD.m
//  ZXDSmapleCode
//
//  Created by 张雪东 on 16/4/19.
//  Copyright © 2016年 张雪东. All rights reserved.
//

#import "NSNull+ZXDExtension.h"
#import <objc/runtime.h>

#define kNullObjects @[@"",@0,@{},@[]]
@implementation NSNull (ZXDExtension)

+(void)load{

    [self zxd_swizzleInstanceMethodInClass:[NSNull class] withoriginalSel:@selector(methodSignatureForSelector:) newSel:@selector(zxd_methodSignatureForSelector:)];
    [self zxd_swizzleInstanceMethodInClass:[NSNull class] withoriginalSel:@selector(forwardInvocation:) newSel:@selector(zxd_forwardInvocation:)];
}

-(NSMethodSignature *)zxd_methodSignatureForSelector:(SEL)selector{

    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    if (signature != nil) {
        return signature;
    }
    for (NSObject *obj in kNullObjects) {
        signature = [obj methodSignatureForSelector:selector];
        if (!signature) {
            continue;
        }
        if (strcmp(signature.methodReturnType, "@") == 0) {
            signature = [[NSNull null] methodSignatureForSelector:@selector(zxd_nil)];
        }
        return signature;
    }
    
    return [self zxd_methodSignatureForSelector:selector];
}

-(void)zxd_forwardInvocation:(NSInvocation *)anInvocation{

    if (strcmp(anInvocation.methodSignature.methodReturnType, "@")) {
        anInvocation.selector = @selector(zxd_nil);
        [anInvocation invokeWithTarget:self];
        return;
    }
    for (NSObject *obj in kNullObjects) {
        if ([obj respondsToSelector:anInvocation.selector]) {
            anInvocation.selector = @selector(zxd_nil);
            [anInvocation invokeWithTarget:self];
            return;
        }
    }
    [self zxd_forwardInvocation:anInvocation];
}

-(id)zxd_nil{

    return nil;
}

+(void)zxd_swizzleInstanceMethodInClass:(Class)cla withoriginalSel:(SEL)originalSel newSel:(SEL)newSel{

    Method a = class_getInstanceMethod(cla, originalSel);
    Method b = class_getInstanceMethod(cla, newSel);
    if (class_addMethod(cla, originalSel, method_getImplementation(b), method_getTypeEncoding(b))) {
        class_replaceMethod(cla, newSel, method_getImplementation(a), method_getTypeEncoding(a));
    }else{
        method_exchangeImplementations(a, b);
    }
}

@end
