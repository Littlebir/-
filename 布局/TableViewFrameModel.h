//
//  TableViewFrameModel.h
//  布局
//
//  Created by 三 on 2016/11/25.
//  Copyright © 2016年 三. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TableViewModel.h"

@interface TableViewFrameModel : NSObject

@property (nonatomic, strong) TableViewModel *model;
/**正文的frame*/
@property (nonatomic, assign) CGRect contentF;
/**图片的frame*/
@property (nonatomic, assign) CGRect photosViewF;
/**cell的高度*/
@property (nonatomic, assign) CGFloat cellHeight;
@end
