//
//  NSData+ZXDExtension.h
//  ZXDSmapleCode
//
//  Created by 张雪东 on 16/4/19.
//  Copyright © 2016年 张雪东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZXDExtension)

@property (nonatomic, readonly, strong) NSData *zxd_MD5Data;
@property (nonatomic, readonly, copy) NSString *zxd_MD5String;

@property (nonatomic, readonly, strong) NSData *zxd_SHA1Data;
@property (nonatomic, readonly, copy) NSString *zxd_SHA1String;

@end
