//
//  LCLinkViewLeftCell.m
//  CheShiLi-B
//
//  Created by cheshili5 on 2017/8/3.
//  Copyright © 2017年 cheshili5. All rights reserved.
//

#import "LCLinkViewLeftCell.h"

@implementation LCLinkViewLeftCell




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected == YES) {
        self.titleLab.textColor = [UIColor redColor];
    }else{
        self.titleLab.textColor = [UIColor blackColor];
    }
}

@end
