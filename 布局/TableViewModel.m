//
//  TableViewModel.m
//  布局
//
//  Created by 三 on 2016/11/25.
//  Copyright © 2016年 三. All rights reserved.
//

#import "TableViewModel.h"

@implementation TableViewModel

- (NSArray *)photoArr_URL{
    return [self.photo_URL componentsSeparatedByString:@","];
}

@end
