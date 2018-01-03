//
//  AppDelegate.m
//  弹框试试
//
//  Created by 123 on 2017/10/24.
//  Copyright © 2017年 123. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    
    //我的部分
    ViewController *my = [[ViewController alloc]init];
    UINavigationController *myVC = [[UINavigationController alloc]initWithRootViewController:my];
    // 设置内容
    myVC.tabBarItem= [[UITabBarItem alloc]initWithTitle:@"我的"image:[UIImage imageNamed:@"icon_index_mine_nor"]tag:1004];
    // 提示信息
    myVC.tabBarItem.badgeValue= nil;
    my.title=@"My Home";
    
    
    
    // 标签视图控制器，用来管理导航控制器的
    UITabBarController *tabBars = [[UITabBarController alloc]init];
    
    // 设置背景颜色
    tabBars.tabBar.barTintColor= [UIColor yellowColor];
    // 设置不半透明
    tabBars.tabBar.translucent= NO;
    // 设置选中按钮的颜色
    tabBars.tabBar.tintColor= [UIColor redColor];
    tabBars.tabBar.unselectedItemTintColor=[UIColor grayColor];
    
    
    
    // 给标签控制器指定子控制器
    tabBars.viewControllers= [NSArray arrayWithObjects:myVC,nil];
    self.window.rootViewController=tabBars;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
