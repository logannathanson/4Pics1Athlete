//
//  StoreManager.h
//  MKSync
//
//  Created by Mugunth Kumar on 17-Oct-09.
//  Copyright 2009 MK Inc. All rights reserved.
//  mugunthkumar.com

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "MKStoreObserver.h"

@interface MKStoreManager : NSObject<SKProductsRequestDelegate> {

	NSMutableArray *purchasableObjects;
	MKStoreObserver *storeObserver;	
	
	NSString *fullUpgradeDescription;
	NSString *fullUpgradePrice;
    SKProduct *productA;
    SKProduct *productB;
    SKProduct *productC;
    SKProduct *productD;
    
    int buyingTierIndex;
}

@property (nonatomic, retain) NSMutableArray *purchasableObjects;
@property (nonatomic, retain) MKStoreObserver *storeObserver;
@property (nonatomic, retain) NSString *fullUpgradeDescription;
@property (nonatomic, retain) NSString *fullUpgradePrice;
@property (nonatomic, retain) SKProduct *productA;
@property (nonatomic, retain) SKProduct *productB;
@property (nonatomic, retain) SKProduct *productC;
@property (nonatomic, retain) SKProduct *productD;
@property (nonatomic) int buyingTierIndex;

- (void) requestProductData;

- (void) buyFeatureA; // expose product buying functions, do not expose
- (void) buyFeatureB;
- (void) buyFeatureC;
- (void) buyFeatureD;

- (void) buyFeature:(SKProduct*) product;

- (void) failedTransaction: (SKPaymentTransaction *)transaction;
+ (MKStoreManager*)sharedManager;

//+(void) loadPurchases;

@end
