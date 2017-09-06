//
//  LCLinkView.m
//  Linkage
//
//  Created by cheshili5 on 2017/5/12.
//  Copyright © 2017年 LeeJay. All rights reserved.
//

#import "LCLinkView.h"
#import "LCLinkTableView.h"
#import "LCLinkViewLeftCell.h"
#import "LCLinkViewRightCell.h"

#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define LEFT_WITh 94
#define LEFT_CELL_HEIGHT 44
#define RIGHT_CELL_HEUGHT 120
#define RIGHT_CELL_SECTION_HEIGHT 44

@interface LCLinkView ()<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_dataArray;
    BOOL _isRelate;
}

@property (nonatomic, strong) LCLinkTableView *leftTableView;
@property (nonatomic, strong) LCLinkTableView *rightTableView;
@end


@implementation LCLinkView
#pragma mark -- lazy
- (UITableView *)leftTableView {
    if (nil == _leftTableView){
        _leftTableView = [[LCLinkTableView alloc] initWithFrame:CGRectMake(0, 0, self.leftTableViewWith, self.frame.size.height)];
        _leftTableView.backgroundColor = [UIColor lightGrayColor];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.showsVerticalScrollIndicator = NO;
        [_leftTableView registerNib:[UINib nibWithNibName:@"LCLinkViewLeftCell" bundle:nil] forCellReuseIdentifier:@"leftcell"];
        [self addSubview:_leftTableView];
    }
    return _leftTableView;
}

- (UITableView *)rightTableView{
    if (nil == _rightTableView){
        _rightTableView = [[LCLinkTableView alloc] initWithFrame:CGRectMake(self.leftTableViewWith, 0,self.rightTableViewWith , self.frame.size.height)];
        _rightTableView.backgroundColor = [UIColor whiteColor];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        [_rightTableView registerNib:[UINib nibWithNibName:@"LCLinkViewRightCell" bundle:nil] forCellReuseIdentifier:@"rightcell"];
        [self addSubview:_rightTableView];
    }
    return _rightTableView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.rightTableViewWith = self.frame.size.width- LEFT_WITh;
        self.rightTableViewCellHeight = RIGHT_CELL_HEUGHT;
        
        self.leftTableViewWith = LEFT_WITh;
        self.leftTableViewCellHeight = LEFT_CELL_HEIGHT;
        
        self.rightTableViewSectionHeight = RIGHT_CELL_SECTION_HEIGHT;
        
        
    }
    return self;
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    [self leftTableView];
    [self rightTableView];
}
-(void)layoutSubviews{
    if ([self.delegate respondsToSelector:@selector(linkViewDataArray:)]) {
        _dataArray =  [self.delegate linkViewDataArray:self];
    }
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.leftTableView) {
        return 1;
    } else {
        return [_dataArray count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.leftTableView) {
        return [_dataArray count];
    } else {
        NSDictionary *item = [_dataArray objectAtIndex:section];
        return [[item objectForKey:@"list"] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *reCell;
    if (tableView == self.leftTableView) {
        LCLinkViewLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftcell" forIndexPath:indexPath];
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        selectedBackgroundView.backgroundColor = [UIColor whiteColor];
        cell.selectedBackgroundView = selectedBackgroundView;
        
//        UIView *liner = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 3, 44)];
//        liner.backgroundColor = BASECOLOR;
//        [selectedBackgroundView addSubview:liner];
        cell.titleLab.text = [_dataArray[indexPath.row] objectForKey:@"title"];
        reCell = cell;
        
        
        
    } else {
        LCLinkViewRightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightcell" forIndexPath:indexPath];
        NSArray *arr = _dataArray[indexPath.section][@"list"];
        cell.serviceName.text = arr[indexPath.row];
        
        reCell = cell;
    }
    
    return reCell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        return self.leftTableViewCellHeight;
    } else {
        return self.rightTableViewCellHeight;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == self.leftTableView) {
        return 0;
    } else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (tableView == self.leftTableView) {
        return 0;
    } else {
        //重要,或者0.01
        return CGFLOAT_MIN;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView == self.rightTableView) {
        return nil;
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
//        view.backgroundColor = RGBACOLOR(217, 217, 217, 0.5);
//        
//        UILabel *lable = [[UILabel alloc]initWithFrame:view.bounds];
//        lable.font = BaseFont(14);
//        NSDictionary *item = [_dataArray objectAtIndex:section];
//        NSString *title = [item objectForKey:@"title"];
//        lable.text = [NSString stringWithFormat:@"   %@", title];
//        lable.textColor = BASECOLOR;
//        [view addSubview:lable];
//        
//        return view;
        
    } else {
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (_isRelate) {
        NSInteger topCellSection = [[[tableView indexPathsForVisibleRows] firstObject] section];
        if (tableView == self.rightTableView) {
            [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:topCellSection inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        }
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section {
    if (_isRelate) {
        NSInteger topCellSection = [[[tableView indexPathsForVisibleRows] firstObject] section];
        if (tableView == self.rightTableView) {
            [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:topCellSection inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        _isRelate = NO;
        [self.leftTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        [self.rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    } else {
        [self.rightTableView deselectRowAtIndexPath:indexPath animated:NO];
        
    }
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTableView) {
        
    }
}
-(void)reloadData{
    if ([self.delegate respondsToSelector:@selector(linkViewDataArray:)]) {
        _dataArray =  [self.delegate linkViewDataArray:self];
    }
    if (_dataArray.count) {
        [self.leftTableView reloadData];
        [self.rightTableView reloadData];
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    }
    
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _isRelate = YES;
}

@end
