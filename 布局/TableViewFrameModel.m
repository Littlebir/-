//
//  TableViewFrameModel.m
//  布局
//
//  Created by 三 on 2016/11/25.
//  Copyright © 2016年 三. All rights reserved.
//

#import "TableViewFrameModel.h"
#import "NSString+Extension.h"
#import "photosView.h"
#define cellSpacing 10
@implementation TableViewFrameModel

- (void)setModel:(TableViewModel *)model{
    _model = model;
    
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
    //正文的frame
    CGFloat contentX = cellSpacing;
    CGFloat contentY = cellSpacing;
    CGFloat maxW = cellW - 2 * contentX;
    CGSize contentSize = [_model.text sizeWithFont:[UIFont systemFontOfSize:15.0f] maxW:maxW];
    self.contentF = (CGRect){{contentX,contentY},contentSize};
    
    //图片的frame
    CGFloat photoCellH = 0;
    if (_model.photoArr_URL.count > 0) {//有图片
        CGFloat photosX = contentX;
        CGFloat photosY = CGRectGetMaxY(self.contentF) + cellSpacing;
        CGSize photosSize = [photosView sizeWithCount:_model.photoArr_URL.count];
        self.photosViewF = (CGRect){{photosX,photosY},photosSize};
        
        photoCellH = CGRectGetMaxY(self.photosViewF) + cellSpacing;
    }else{
        photoCellH = 0;
    }
    
    self.cellHeight = CGRectGetMaxY(self.photosViewF) + cellSpacing;
}
@end
