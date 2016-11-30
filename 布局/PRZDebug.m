//
//  PRZDebug.m
//  PRZDebugDescription
//
//  Created by 三 on 2016/11/26.
//  Copyright © 2016年 三. All rights reserved.
//

#import "PRZDebug.h"
#import <objc/runtime.h>

@implementation PRZDebug

- (NSString *)debugDescription{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    uint count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    //循环并用KVC得到每个属性的值
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *name = @(property_getName(property));
        //默认值为nil的字符串
        id value = [self valueForKey:name]?:@"nil";
        //封装到字典里面
        [dictionary setObject:value forKey:name];
    }
    free(properties);
    
    return [NSString stringWithFormat:@"<%@: %p> -- %@",[self class],self,dictionary];
}
@end
