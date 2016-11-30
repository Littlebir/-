//
//  photosView.m
//  布局
//
//  Created by 三 on 2016/11/23.
//  Copyright © 2016年 三. All rights reserved.
//  这里是吧所有的照片封装起来

#import "photosView.h"
#import "photoView.h"
#import "UIView+Extension.h"
#import "UIImageView+WebCache.h"
#define photoWH 100
#define photoMargin 10
#define photoMaxCol(count) ((count==4)?2:3)
@implementation photosView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

/**
 布局图片

 @param photos 外部传过来的图片数组
 */
- (void)setPhotos:(NSArray *)photos{
    _photos = photos;
    NSInteger photosCount = photos.count;
    
    if (self.subviews.count >= photosCount) {//这里说明内部的imageView够用
        
    }else{//这里说明内部的imageView不够用 需要我们创建
        while (self.subviews.count < photosCount) {
            photoView *photoV = [[photoView alloc] init];
            [self addSubview:photoV];
        }
    }
    
    //遍历赋值
    for (int i = 0; i < self.subviews.count; i++) {
        photoView *photoV = self.subviews[i];
        if (i < photosCount) {
            [photoV sd_setImageWithURL:[NSURL URLWithString:photos[i]] placeholderImage:[UIImage imageNamed:@"0"]];
            photoV.hidden = NO;
        }else{
            photoV.hidden = YES;
        }
    }
}

- (void)layoutSubviews{
    NSInteger photosCount = _photos.count;
    int maxCols = photoMaxCol(photosCount);
    //设置图片的位置和尺寸
    for (int i = 0; i < photosCount; i++) {
        photoView *photoV = self.subviews[i];
        
        int col = i % maxCols;
        photoV.x = col * (photoWH + photoMargin);
        
        int row = i / maxCols;
        photoV.y = row * (photoWH + photoMargin);
        
        photoV.width = photoWH;
        photoV.height = photoWH;
    }
}

/**
 根据外部传进来的图片数组个数，进行布局 返回尺寸

 @param count 图片的个数
 @return 返回计算好的图片尺寸
 */
+ (CGSize)sizeWithCount:(int)count{
    int maxCols = photoMaxCol(count);
    //列 当传进来的图片数组个数是4的时候列就是2
    int cols = (count >= maxCols)? maxCols : count;
    //根据列 计算图片的宽
    CGFloat photoW = cols * photoWH + (cols - 1) * photoMargin;
    
    int rows = (count + maxCols - 1) / maxCols;
    CGFloat photoH = rows * photoWH + (rows - 1) * photoMargin;
    
    return  CGSizeMake(photoW, photoH);
}

@end
