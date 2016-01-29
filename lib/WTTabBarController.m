//
//  WTTabBarController.m
//  WTFunctionDemo
//
//  Created by winter on 16/1/29.
//  Copyright © 2016年 winter. All rights reserved.
//

#import "WTTabBarController.h"
#import "WTDemo-Swift.h"
#import "InterestingVC.h"
#import "ToDoViewController.h"
@implementation WTTabBarController



- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //添加控制器1
        WTCommomViewController *commomVC = [[WTCommomViewController alloc]init];
        UINavigationController *commomNAVC = [[UINavigationController alloc]initWithRootViewController:commomVC];
        commomNAVC.tabBarItem.title = @"常用";

        commomNAVC.tabBarItem.image = [UIImage imageNamed:@"tabImage1"];
        //添加控制器2
        InterestingVC *intereVC = [[InterestingVC alloc]init];
        UINavigationController *intereNavc = [[UINavigationController alloc]initWithRootViewController:intereVC];
        intereNavc.tabBarItem.title = @"funny";
        intereNavc.tabBarItem.image = [UIImage imageNamed:@"tabImage2"];
        //两个占位控制器
        ToDoViewController *toDoVC1 = [[ToDoViewController alloc]init];
        UINavigationController *toDoNavc1 = [[UINavigationController alloc]initWithRootViewController:toDoVC1];
        toDoNavc1.tabBarItem.title = @"待续..";
        
        ToDoViewController *toDoVC2 = [[ToDoViewController alloc]init];
        UINavigationController *toDoNavc2 = [[UINavigationController alloc]initWithRootViewController:toDoVC2];
        toDoNavc2.tabBarItem.title = @"待续..";
   
        
        self.viewControllers = @[commomNAVC, intereNavc, toDoNavc1, toDoNavc2];
        
        
        
        
    }
    return self;
}






@end
