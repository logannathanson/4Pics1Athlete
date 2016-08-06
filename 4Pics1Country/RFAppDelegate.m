//
//  RFAppDelegate.m
//  4Pics1Country
//
//  Created by Roey Farag on 7/28/13.
//  Copyright (c) 2013 Roey Farag. All rights reserved.
//

#import "RFAppDelegate.h"
#import <AdColony/AdColony.h>


//USE MY IDS
#define REVMOB_ID               @"55d5e74a8cc7360020dcfa87"
#define CHARTBOOST_APPID        @"55d5e8ca04b01646d2eef73d"
#define CHARTBOOST_APPSIGNATURE @"198931419e422747ab69a98132dd57fa565b68f6"
#define INAPP_PURCHASE_ID       @"com.logannat.myfirstgame"
#define ADCOLONY_ID             @"app75d1c9ec5b2f431ba4"
#define ADCOLONY_ZONE_ID        @"vze2f4111bd3b14a7498"
#define G_ANALYTICS_ID          @"UA-45032914-1"


@implementation RFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setValue:INAPP_PURCHASE_ID forKey:@"INAPP_PURCHASE_ID"];
    
    [RevMobAds startSessionWithAppID:REVMOB_ID];
    
    [Chartboost startWithAppId:CHARTBOOST_APPID
                  appSignature:CHARTBOOST_APPSIGNATURE
                      delegate:self];
    
    [AdColony configureWithAppID:ADCOLONY_ID zoneIDs:@[ADCOLONY_ZONE_ID] delegate:nil logging:YES];
    

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
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(id) alternateView
{
	return nil;
}

#pragma mark REVMOB delegate
- (void) dispAds
{
    [[RevMobAds session] showFullscreen];
}

- (void)revmobAdDidFailWithError:(NSError *)error
{
    [Chartboost showInterstitial:CBLocationHomeScreen];
}

- (void)revmobUserClosedTheAd
{
    [Chartboost showInterstitial:CBLocationHomeScreen];
}


#pragma mark chartboost delegate
- (void) dispMoreApps
{
    [Chartboost showMoreApps:CBLocationGameScreen];
}

@end
