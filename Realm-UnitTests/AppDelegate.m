//
//  AppDelegate.m
//  Realm-UnitTests
//
//  Created by Alex Leffelman on 3/18/16.
//  Copyright © 2016 LeffelMania. All rights reserved.
//

#import "AppDelegate.h"

#import <Realm/Realm.h>

@interface AppDelegate ()

@property (nonatomic, strong) RLMRealm *realm;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.realm = [RLMRealm defaultRealm];
    
    NSMutableString *output = [NSMutableString stringWithString:@"\n"];
    [output appendString:@"#import <XCTest/XCTest.h>\n#import <Realm/Realm.h>\n\n"];
    [output appendString:@"@interface MyTestCase : XCTestCase\n\n@property (nonatomic, strong) RLMRealm *realm;\n\n@end\n\n"];
    [output appendString:@"@implementation MyTestCase\n\n"];
    
    [output appendString:@"- (void)setUp\n{\n\t[super setUp];\n"];
    [output appendString:@"\tRLMRealmConfiguration *config = [RLMRealmConfiguration new];\n"];
    [output appendString:@"\tconfig.inMemoryIdentifier = [self name];\n"];
    [output appendString:@"\t[RLMRealmConfiguration setDefaultConfiguration:config];\n\n"];
    [output appendString:@"\tself.realm = [RLMRealm realmWithConfiguration:config error:NULL];\n}\n\n"];
    
    for (NSUInteger i = 0; i < 1600; i++)
    {
        [output appendFormat:@"- (void)testNumber_%@\n{\n\tXCTAssertTrue(YES);\n}\n\n", @(i)];
    }
    
    [output appendString:@"@end\n"];
    NSLog(@"%@", output);
    
    return YES;
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
