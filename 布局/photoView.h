//
//  photoView.h
//  布局
//
//  Created by 三 on 2016/11/23.
//  Copyright © 2016年 三. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol photoViewDelegate <NSObject>

@optional
- (void)imageView:(UIImageView *)imageView LongPressGesState:(UIGestureRecognizerState)state;
@end

@interface photoView : UIImageView
/**
 点击手势 默认开启
 */
@property (nonatomic, assign) BOOL openTapGes;

/**
 长按手势 默认开始
 */
@property (nonatomic, assign) BOOL openLongPressGes;

@property (nonatomic, weak) id<photoViewDelegate>delegata;

@end
