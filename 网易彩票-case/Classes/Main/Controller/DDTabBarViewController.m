//
//  DDTabBarViewController.m
//  网易彩票-case
//
//  Created by 杜东方 on 15/12/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDTabBarViewController.h"
#import "DDTabBar.h"

@interface DDTabBarViewController ()<DDTabBarDelegate>

@end

@implementation DDTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //NSLog(@"%s",__func__);
    
    //tabBar里的item的图片大小是30x30如果@x2,则是60x60
    
    //自己写一个tabBar替换系统的tabBar

    
    DDTabBar *tabBar = [[DDTabBar alloc] initWithFrame:self.tabBar.bounds];
    tabBar.delegate = self;
    
    for(int i = 0;i < 5;i++){
        NSString *imageName = [NSString stringWithFormat:@"TabBar%d",(i+1)];
        //设置按钮选中状态
        NSString *selectedImageName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        [tabBar addTabBarBtnWithNormalImageName:imageName selectedImageName:selectedImageName];
    }

    
    [self.tabBar addSubview:tabBar];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tabBar代理实现

-(void)tabBar:(DDTabBar *)tabBar didSelectedFrom:(NSInteger)from to:(NSInteger)to{
    self.selectedIndex = to;
}


@end
