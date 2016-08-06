//
//  MKStoreManager.m
//
//  Created by Mugunth Kumar on 17-Oct-09.
//  Copyright 2009 Mugunth Kumar. All rights reserved.
//  mugunthkumar.com
//

#import "MKStoreManager.h"


@implementation MKStoreManager

@synthesize purchasableObjects;
@synthesize storeObserver;
@synthesize fullUpgradePrice, fullUpgradeDescription;
@synthesize productA, productB, productC, productD;
@synthesize buyingTierIndex;

// all your features should be managed one and only by StoreManager
static NSString *featureAId = @"com.logannat.myfirstgameTier1";
static NSString *featureBId = @"com.logannat.myfirstgameTier2";
static NSString *featureCId = @"com.logannat.myfirstgameTier3";
static NSString *featureDId = @"com.logannat.myfirstgamedeal1";

BOOL featureAPurchased, featureBPurchased;
static MKStoreManager* _sharedStoreManager; // self

+ (BOOL) featureAPurchased {
	
	return featureAPurchased;
}

+ (BOOL) featureBPurchased {
	
	return featureBPurchased;
}

+ (MKStoreManager*)sharedManager
{
	@synchronized(self) {
		
        if (_sharedStoreManager == nil) {
			
            [[self alloc] init]; // assignment not done here
			_sharedStoreManager.purchasableObjects = [[NSMutableArray alloc] init];			
			[_sharedStoreManager requestProductData];
			
			_sharedStoreManager.storeObserver = [[MKStoreObserver alloc] init];
			[[SKPaymentQueue defaultQueue] addTransactionObserver:_sharedStoreManager.storeObserver];
        }
    }
    return _sharedStoreManager;
}


#pragma mark Singleton Methods

+ (id)allocWithZone:(NSZone *)zone

{	
    @synchronized(self) {
		
        if (_sharedStoreManager == nil) {
			
            _sharedStoreManager = [super allocWithZone:zone];			
            return _sharedStoreManager;  // assignment and return on first allocation
        }
    }
	
    return nil; //on subsequent allocation attempts return nil	
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;	
}


- (void) requestProductData
{
	SKProductsRequest *request= [[SKProductsRequest alloc] initWithProductIdentifiers: 
								 [NSSet setWithObjects: featureAId, featureBId, featureCId, featureDId, nil]]; // add any other product here
	request.delegate = self;
	[request start];
}


- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
	[purchasableObjects addObjectsFromArray:response.products];
    if([purchasableObjects count] > 1)
    {
        productA = [purchasableObjects objectAtIndex:0];
        productB = [purchasableObjects objectAtIndex:1];
        productC = [purchasableObjects objectAtIndex:2];
        productD = [purchasableObjects objectAtIndex:3];
    }
	for(int i=0;i<[purchasableObjects count];i++)
	{
        SKProduct *product = [purchasableObjects objectAtIndex:i];
		fullUpgradeDescription = [[NSString alloc] initWithFormat:@"%@", [product localizedDescription]];
		fullUpgradePrice = [[NSString alloc] initWithFormat:@"%f", [[product price] doubleValue]];
		NSLog(@"Feature: %@, Cost: %f, ID: %@",[product localizedTitle],
			  [[product price] doubleValue], [product productIdentifier]);
	}
	[[NSNotificationCenter defaultCenter] postNotificationName:@"ProductDataLoaded" object:self];

}

- (void) buyFeatureA
{
    buyingTierIndex = 0;
	[self buyFeature:productA];
}

- (void) buyFeatureB
{
    buyingTierIndex = 1;
	[self buyFeature:productB];
}

- (void) buyFeatureC
{
    buyingTierIndex = 2;
	[self buyFeature:productC];
}

- (void) buyFeatureD
{
    buyingTierIndex = 3;
	[self buyFeature:productD];
}

- (void) buyFeature:(SKProduct*) product
{
	if ([SKPaymentQueue canMakePayments])
	{
		//SKPayment *payment = [SKPayment paymentWithProductIdentifier:product];
        SKPayment *payment = [SKPayment paymentWithProduct:product];
		[[SKPaymentQueue defaultQueue] addPayment:payment];
	}
	else
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"App Store Error" message:@"You are not authorized to purchase from AppStore"
													   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];
	}
}

- (void) failedTransaction: (SKPaymentTransaction *)transaction
{
	NSString *messageToBeShown = [NSString stringWithFormat:@"Reason: %@, You can try: %@", [transaction.error localizedFailureReason], [transaction.error localizedRecoverySuggestion]];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to complete your purchase" message:messageToBeShown
												   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];
}
@end

