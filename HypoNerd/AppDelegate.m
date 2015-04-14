//
//  AppDelegate.m
//  HypoNerd
//
//  Created by Matthew Chupp on 3/17/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "AppDelegate.h"
#import "MCHypnosisViewController.h"
#import "MCReminderViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    MCHypnosisViewController *hvc = [[MCHypnosisViewController alloc] init];
    
    // get a pointer to an objet that represents the app bundle
    NSBundle *appBundle = [NSBundle mainBundle];
    
    // look in the appBundle for the file MCReminderViewController.xib
    MCReminderViewController *rvc = [[MCReminderViewController alloc] initWithNibName:@"MCReminderViewController" bundle:appBundle];
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[hvc, rvc];
    

//    self.window.rootViewController = hvc;
    //self.window.rootViewController = rvc;
    self.window.rootViewController = tabBarController;
    
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound
            categories:nil]];
    }
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible]; 
    
    return YES;
}



@end
