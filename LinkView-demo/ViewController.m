//
//  ViewController.m
//  LinkView-demo
//
//  Created by cheshili5 on 2017/9/6.
//  Copyright © 2017年 cheshili5. All rights reserved.
//

#import "ViewController.h"
#import "LCLinkView.h"

@interface ViewController ()<LCLinkViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LCLinkView *linkView = [[LCLinkView alloc] initWithFrame:self.view.frame];
    linkView.delegate = self;
    
    [self.view addSubview:linkView];
}

-(NSArray *)linkViewDataArray:(LCLinkView *)linkView{
    
    
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<20; i++) {
        
        
        NSDictionary *data = @{@"title":[NSString stringWithFormat:@"测试title--%d",i],
                               @"list":@[[NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i],
                                         [NSString stringWithFormat:@"测试数据第 %d 组",i]]};
        
        [array addObject:data];
    }
    
    
    return array;
}


@end
