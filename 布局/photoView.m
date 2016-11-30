//
//  photoView.m
//  布局
//
//  Created by 三 on 2016/11/23.
//  Copyright © 2016年 三. All rights reserved.
//

#import "photoView.h"

@interface photoView ()
@property (nonatomic, assign) CGRect superRect;
@property (nonatomic, strong) UIImageView *shandowView;
@end

@implementation photoView

- (instancetype)init{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        _openTapGes = _openLongPressGes = YES;
        UILongPressGestureRecognizer *longGes = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [self addGestureRecognizer:longGes];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (!_openTapGes) return;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _superRect = [self.superview convertRect:self.frame toView:window];
    [window addSubview:self.shandowView];
    _shandowView.image = self.image;
    
    [UIView animateWithDuration:0.5 animations:^{
        _shandowView.frame = [UIScreen mainScreen].bounds;
        _shandowView.alpha = 1;
    }];
}

- (UIImageView *)shandowView{
    if (!_shandowView) {
        _shandowView = [[UIImageView alloc] initWithFrame:_superRect];
        _shandowView.userInteractionEnabled = YES;
        _shandowView.alpha = 1.0f;
        _shandowView.contentMode = UIViewContentModeScaleToFill;
        UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancel:)];
        [_shandowView addGestureRecognizer:tapG];
    }
    return _shandowView;
}

/**
 取消
 */
- (void)cancel:(UITapGestureRecognizer *)tapGes {
    [UIView animateWithDuration:0.5 animations:^{
        _shandowView.frame = _superRect;
        _shandowView.alpha = 0;
    }];
}

/**
 长按实现方法
 */
- (void)longPress:(UILongPressGestureRecognizer *)longGes {
    if (!_openLongPressGes) return;
    if ([self.delegata respondsToSelector:@selector(imageView:LongPressGesState:)]) {
        [self.delegata imageView:self LongPressGesState:longGes.state];
    }
}

@end
