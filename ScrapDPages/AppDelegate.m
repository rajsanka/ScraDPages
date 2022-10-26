//
//  AppDelegate.m
//  ScrapDPages
//
//  Created by Raji Sankar on 12/10/22.
//  Copyright © 2022 Raji Sankar. All rights reserved.
//

#import "AppDelegate.h"

#include <Selenium/SERemoteWebDriver.h>
#include <Selenium/SECapabilities.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    SECapabilities *c = [SECapabilities new];
    [c setPlatformName:@"MAC"];
    [c setBrowserName:@"safari"];
    //[c setVersion:@"19.0.2"];

    NSError *error;
    SERemoteWebDriver *driver;
    driver = [[SERemoteWebDriver alloc] initWithServerAddress:@"192.168.0.103" port:4444
                    desiredCapabilities:c requiredCapabilities:nil error:&error];

    [driver setUrl:[[NSURL alloc] initWithString:@"https://hoopshype.com/salaries/players/"]];
    NSArray *a = [driver findElementsBy:[SEBy idString:@"//td[@class=\"name\""]];
    NSLog(@"%@", a);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
