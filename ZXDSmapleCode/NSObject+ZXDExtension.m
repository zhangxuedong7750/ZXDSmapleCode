//
//  NSObject+ZXDExtension.m
//  ZXDSmapleCode
//
//  Created by 张雪东 on 16/4/20.
//  Copyright © 2016年 张雪东. All rights reserved.
//

#import "NSObject+ZXDExtension.h"
#import <objc/runtime.h>

@implementation NSObject (ZXDExtension)

- (id)zxd_getAssociatedObjectForKey:(const char *)key{

    return objc_getAssociatedObject(self, key);
}

- (void)zxd_setCopyAssociatedObject:(id)obj forKey:(const char *)key{

    objc_setAssociatedObject(self, key, obj, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)zxd_setRetainAssociatedObject:(id)obj forKey:(const char *)key{

    objc_setAssociatedObject(self, key, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)zxd_setAssignAssociatedObject:(id)obj forKey:(const char *)key{

    objc_setAssociatedObject(self, key, obj, OBJC_ASSOCIATION_ASSIGN);
}

- (void)zxd_removeAssociatedObjectForKey:(const char *)key{

    objc_setAssociatedObject( self, key, nil, OBJC_ASSOCIATION_ASSIGN );
}

- (void)zxd_removeAllAssociatedObjects{

    objc_removeAssociatedObjects(self);
}

@end
