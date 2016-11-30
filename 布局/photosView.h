//
//  photosView.h
//  布局
//
//  Created by 三 on 2016/11/23.
//  Copyright © 2016年 三. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface photosView : UIView

@property (nonatomic,strong) NSArray *photos;

+ (CGSize)sizeWithCount:(int)count;

@end
