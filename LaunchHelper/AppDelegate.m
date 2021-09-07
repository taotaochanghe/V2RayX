//
//  AppDelegate.m
//  LaunchHelper
//
//  Created by Liangqi Bao on 2021/9/8.
//  Copyright © 2021 Project V2Ray. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSLog(@"V2RayX LaunchHelper");
    
    NSWorkspace* ws = [NSWorkspace sharedWorkspace];
    BOOL bLaunched = NO;
    bLaunched = [ws launchApplication: @"/Applications/V2RayX.app"];
    if (!bLaunched) {
        bLaunched = [ws launchApplication: @"V2RayX.app"];
    }
    if (!bLaunched) {
        NSArray *pathComponents = [[[NSBundle mainBundle] bundlePath] pathComponents];
        pathComponents = [pathComponents subarrayWithRange:NSMakeRange(0, [pathComponents count] - 4)];
        NSString *path = [NSString pathWithComponents:pathComponents];
        [[NSWorkspace sharedWorkspace] launchApplication:path];
    }
    [NSApp terminate:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
