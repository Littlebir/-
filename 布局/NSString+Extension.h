//
//  NSString+Extension.h
//  布局
//
//  Created by 三 on 2016/11/25.
//  Copyright © 2016年 三. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Extension)

/**
 你要传给我字体的大小 和你要显示的尺寸
 @param font 字体的大小
 @param maxW 显示的尺寸
 @return 计算好的frame
 */
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;


/**
 你只要传给我字体的大小就可以 我帮你填写一个默认的MAXFLOAT

 @param font 字体的大小
 @return 计算好的frame
 */
- (CGSize)sizeWithFont:(UIFont *)font;
@end
