//
//  AppDelegate.m
//  本地通知Demo
//
//  Created by 任前辈 on 16/2/23.
//  Copyright © 2016年 SingleProgrammers. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //ios8 之后 需要授权  它会在你第一次使用app时 给出提示 是否允许显示通知
    //允许alert 提示  badge修改appIcon未读数  设置sound提示音
    
    ///SDFSSDAUFDQUAFDASFU测试
    if ([[UIDevice currentDevice].systemVersion  floatValue]>=8.0) { //判断当前设备系统的版本 是不是大于 8.0
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]
         ];
        
        
    }
    
    
    UILocalNotification * notificaton =  launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];//取字典中 本地通知key对应的值
    
    //取出附加信息
    NSString * str = notificaton.userInfo[@"state"];

    if (notificaton) {//说明是点击通知启动的
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"这是点击通知进来的" message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }
    
    return YES;
}

//应用程序收到了本地推送

//1.如果当前应用在后台 并且是点击这个通知栏 进入的程序  会调这个代理方法

//2.如果当前应用在前台 如果收到通知 会直接调用

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
    NSLog(@"%@",notification.userInfo);
    //判断应用程序的状态 如果应用程序在前台 不应该进行跳转（这样属于强奸用户）
   
    //
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {//判断应用程序是否在前台
        
        return;
    }
    
    //
    self.window.rootViewController.view.backgroundColor = [UIColor redColor];
    
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
