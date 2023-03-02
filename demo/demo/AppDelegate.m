//
//  AppDelegate.m
//  demo
//
//  Created by Douglas on 2023/2/17.
//

#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents.shared activateApp];
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    BOOL a = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                            openURL:url
                                                  sourceApplication:sourceApplication
                                                         annotation:annotation
              ];
    return a;
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
    BOOL a = [[FBSDKApplicationDelegate sharedInstance] application:app
                                                            openURL:url
                                                  sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                                         annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
              ];
    return a;
}


@end
