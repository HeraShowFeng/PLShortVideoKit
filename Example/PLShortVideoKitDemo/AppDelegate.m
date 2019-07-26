//
//  AppDelegate.m
//  PLShortVideoKitDemo
//
//  Created by suntongmian on 17/3/1.
//  Copyright © 2017年 Pili Engineering, Qiniu Inc. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import "PLShortVideoKit/PLShortVideoKit.h"
#import <GT/GT.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //初始化GT
    GT_DEBUG_INIT;
    //获取GT隐藏属性
    GT_DEBUG_HIDDEN;
    //设置logo显示位置
    GT_LOGO_POINT_SET(100,300);
    //设置fileTransferResult在悬浮框显示
    GT_OC_OUT_DEFAULT_ON_AC(@"fileTransferResult", nil, nil);
    //展示GT悬浮框
    GT_AC_SHOW;
    //设置GT悬浮框header的高度
    GT_AC_HEADER_HEIGHT_SET(40);
    //设置输出参数展示在LOG上
    GT_OUT_WRITE_TO_LOG("App Smoothness", true);
#pragma mark ---CUP/Memory/Capacity使用情况
    GT_LOG_D("UTIL","cpuUsage:%f", GT_UTIL_GET_CPU_USAGE);
    GT_LOG_D("UTIL","usedMemory:%u", GT_UTIL_GET_USED_MEM);
    GT_LOG_D("UTIL","AppUsedMemory:%u", GT_UTIL_GET_APP_MEM);
    GT_LOG_D("UTIL","freeMemory:%u", GT_UTIL_GET_FREE_MEM);
    GT_LOG_D("UTIL","restCapacity:%u", GT_UTIL_CURRENT_CAPACITY);
    GT_UTIL_RESET_NET_DATA;
  
    
    // pili 短视频日志系统
    [PLShortVideoKitEnv initEnv];
    [PLShortVideoKitEnv setLogLevel:PLShortVideoLogLevelDebug];
    [PLShortVideoKitEnv enableFileLogging];
    
    // crash 收集
    [Fabric with:@[[Crashlytics class]]];
    
    [[AVAudioSession sharedInstance] setCategory:(AVAudioSessionCategoryPlayback) error:nil];
    
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
