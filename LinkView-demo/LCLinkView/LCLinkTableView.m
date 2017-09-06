//
//  LCLinkTableView.m
//  CheShiLi-B
//
//  Created by cheshili5 on 2017/8/3.
//  Copyright © 2017年 cheshili5. All rights reserved.
//

#import "LCLinkTableView.h"

@implementation LCLinkTableView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

@end
