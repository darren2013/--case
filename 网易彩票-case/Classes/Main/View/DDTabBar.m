//
//  DDTabBar.m
//  网易彩票-case
//
//  Created by 杜东方 on 15/12/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDTabBar.h"

@interface DDTabBar()

@property(nonatomic,weak)UIButton *selectedBtn;

@end

@implementation DDTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/**
自定义子控件
1.在初始化方法中，添加子控件
2.layoutSubViews，布局子控件
*/

//[[UIView allocl] init]方法中会调用，接着会调用initWithFrame方法(因为系统也要知道控件位置)
//-(instancetype)init

//[[UIView allocl] initWithFrame]方法中会调用
//-(instancetype)initWithFrame:(CGRect)frame

//从xib或storyboard加载中会调用
//-(instancetype)initWithCoder:(NSCoder *)aDecoder



-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupBtns];
    }
    
    return self;
}

-(void)setupBtns{
    
    
    //往自定义的tabBarView添加5个按钮
    for(int i = 0;i < 5;i++){
        NSString *imageName = [NSString stringWithFormat:@"TabBar%d",(i+1)];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        //设置按钮选中状态
        NSString *selectedImageName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        [btn setBackgroundImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
        
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
       
        
        if (i == 0) {
            btn.selected = YES;
            self.selectedBtn = btn;
        }
}
    



    
}

-(void)layoutSubviews{
    
    
    CGFloat btnW = self.bounds.size.width / 5;
    CGFloat btnH = self.bounds.size.height;
    
    //往自定义的tabBarView添加5个按钮
    for(int i = 0;i < 5;i++){
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(btnW * i, 0, btnW, btnH);
    }

}

-(void)btnClicked:(UIButton *)btn{
    //切换tabBar的子控制器
    //self.selectedIndex = btn.tag;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedFrom:to:)]) {
        [self.delegate tabBar:self didSelectedFrom:self.selectedBtn.tag to:btn.tag];
    }
    
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    
    
}

@end
