//
//  RFAppDelegate.h
//  4Pics1Country
//
//  Created by Roey Farag on 7/28/13.
//  Copyright (c) 2013 Roey Farag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RevMobAds/RevMobAds.h>
#import "ASReviewPopup.h"

#import <Chartboost/Chartboost.h>
#import <Chartboost/CBNewsfeed.h>
#import <CommonCrypto/CommonDigest.h>
#import <AdSupport/AdSupport.h>

@interface RFAppDelegate : UIResponder <UIApplicationDelegate,RevMobAdsDelegate,ChartboostDelegate>

@property (strong, nonatomic) UIWindow *window;


@end
