//
//  NSObject+ZXDExtension.h
//  ZXDSmapleCode
//
//  Created by 张雪东 on 16/4/20.
//  Copyright © 2016年 张雪东. All rights reserved.
//

#import <Foundation/Foundation.h>


#define zxd_property_strong( __type, __name) \
property (nonatomic, strong, setter=set__##__name:, getter=__##__name) __type __name;

#define zxd_def_property_strong( __type, __name) \
- (__type)__##__name   \
{ return [self zxd_getAssociatedObjectForKey:#__name]; }   \
- (void)set__##__name:(id)__##__name   \
{ [self zxd_setRetainAssociatedObject:(id)__##__name forKey:#__name]; }

#define zxd_property_weak( __type, __name) \
property (nonatomic, weak, setter=set__##__name:, getter=__##__name) __type __name;

#define zxd_def_property_weak( __type, __name) \
- (__type)__##__name   \
{ return [self zxd_getAssociatedObjectForKey:#__name]; }   \
- (void)set__##__name:(id)__##__name   \
{ [self zxd_setAssignAssociatedObject:(id)__##__name forKey:#__name]; }


#define zxd_property_copy( __type, __name) \
property (nonatomic, copy, setter=set__##__name:, getter=__##__name) __type __name;

#define zxd_def_property_copy( __type, __name) \
- (__type)__##__name   \
{ return [self zxd_getAssociatedObjectForKey:#__name]; }   \
- (void)set__##__name:(id)__##__name   \
{ [self zxd_setCopyAssociatedObject:(id)__##__name forKey:#__name]; }

@interface NSObject (ZXDExtension)

- (id)zxd_getAssociatedObjectForKey:(const char *)key;
- (void)zxd_setCopyAssociatedObject:(id)obj forKey:(const char *)key;
- (void)zxd_setRetainAssociatedObject:(id)obj forKey:(const char *)key;
- (void)zxd_setAssignAssociatedObject:(id)obj forKey:(const char *)key;
- (void)zxd_removeAssociatedObjectForKey:(const char *)key;
- (void)zxd_removeAllAssociatedObjects;

@end
