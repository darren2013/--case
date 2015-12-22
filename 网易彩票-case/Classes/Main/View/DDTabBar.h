//
//  DDTabBar.h
//  网易彩票-case
//
//  Created by 杜东方 on 15/12/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDTabBar;

@protocol DDTabBarDelegate <NSObject>

-(void)tabBar:(DDTabBar *)tabBar didSelectedFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface DDTabBar : UIView

@property(nonatomic,weak)id<DDTabBarDelegate> delegate;

-(void)addTabBarBtnWithNormalImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;

@end


@interface DDTabBarButton : UIButton

@end
