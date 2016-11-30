//
//  AdaptiveCell.m
//  布局
//
//  Created by 三 on 2016/11/26.
//  Copyright © 2016年 三. All rights reserved.
//

#import "AdaptiveCell.h"
#import "photosView.h"
#import "TableViewModel.h"
@interface AdaptiveCell ()
@property (nonatomic, strong) photosView *phonesView;

@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation AdaptiveCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //初始化
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    //配图
    _phonesView = [[photosView alloc] init];
    [self addSubview:self.phonesView];
    
    //正文
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.numberOfLines = 0;
    _contentLabel.font = [UIFont systemFontOfSize:15.0f];
    [self addSubview:self.contentLabel];
}

- (void)setFrameModel:(TableViewFrameModel *)frameModel{
    _frameModel = frameModel;
    TableViewModel *model = frameModel.model;
    
    if (model.photoArr_URL.count) {
        self.phonesView.frame = frameModel.photosViewF;
        self.phonesView.photos = model.photoArr_URL;
        self.phonesView.hidden = NO;
    }else{
        self.phonesView.hidden = YES;
    }
    
    _contentLabel.text = model.text;
    _contentLabel.frame = frameModel.contentF;
}

@end
