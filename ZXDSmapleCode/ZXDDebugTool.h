//
//  ZXDDebugTool.h
//  test01
//
//  Created by 张雪东 on 16/5/7.
//  Copyright © 2016年 ZXD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXDDebugTool : NSObject

//观察某个对象什么时候释放
+ (void)hookObject:(id)anObject whenDeallocLogString:(NSString *)string;

@end
