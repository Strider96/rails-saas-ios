//
//  YFAppDelegate.m
//  rails-saas-ios
//
//  Created by Chris Richards on 07/01/2013.
//  Copyright (c) 2013 Yellow Feather Ltd. All rights reserved.
//

#import "YFAppDelegate.h"
#import "YFLoginViewController.h"
#import "YFRailsSaasApiClient.h"

@interface YFAppDelegate ()

@property (strong, nonatomic) YFLoginViewController* loginViewController;

@end

@implementation YFAppDelegate

@synthesize loginViewController = _loginViewController;

- (void)showLoginView {
    if (self.loginViewController == nil) {
        self.loginViewController = [[YFLoginViewController alloc] initWithNibName:@"YFLoginView" bundle:nil];
        UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
        [navController presentViewController:self.loginViewController animated:NO completion:nil];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    BOOL isLoginRequired = [[YFRailsSaasApiClient sharedClient] isLoginRequired];
    if (isLoginRequired) {
        [self showLoginView];
    }
    else /* if has network access */ {
        [[YFRailsSaasApiClient sharedClient] refreshAccessToken];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
