//
//  LCLinkView.h
//  Linkage
//
//  Created by cheshili5 on 2017/5/12.
//  Copyright © 2017年 LeeJay. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LCLinkView;
@protocol LCLinkViewDelegate <NSObject>

-(NSArray *)linkViewDataArray:(LCLinkView *)linkView;

@end



@interface LCLinkView : UIView

//设置右边的
@property (nonatomic, assign) CGFloat rightTableViewWith;
@property (nonatomic, assign) CGFloat rightTableViewCellHeight;
//设置右边组的头视图的高度
@property (nonatomic, assign) CGFloat rightTableViewSectionHeight;


//设置左边的
@property (nonatomic, assign) CGFloat leftTableViewWith;
@property (nonatomic, assign) CGFloat leftTableViewCellHeight;



//数据代理
@property (nonatomic, weak) id<LCLinkViewDelegate> delegate;



-(instancetype)initWithFrame:(CGRect)frame;

-(void)reloadData;

@end
