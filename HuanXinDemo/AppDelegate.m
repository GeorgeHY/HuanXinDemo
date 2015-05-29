//
//  AppDelegate.m
//  HuanXinDemo
//
//  Created by iwind on 15/5/25.
//  Copyright (c) 2015年 HanYang. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[EaseMob sharedInstance] registerSDKWithAppKey:@"iwind#bangke" apnsCertName:@"easeMobDemo"];
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:@"dvbs" password:@"123456" completion:^(NSDictionary *loginInfo, EMError *error) {
        NSLog(@"-------- loginInfo = %@",loginInfo);
    } onQueue:nil];
    
    
    
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight)];
    self.window.backgroundColor = [UIColor whiteColor];
    ViewController * vc = [[ViewController alloc]init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    
    
    
//    [[EaseMob sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[EaseMob sharedInstance] applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[EaseMob sharedInstance] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[EaseMob sharedInstance] applicationWillTerminate:application];
}

@end
