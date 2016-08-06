//
//  MKStoreObserver.m
//
//  Created by Mugunth Kumar on 17-Oct-09.
//  Copyright 2009 Mugunth Kumar. All rights reserved.
//

#import "MKStoreObserver.h"
#import "MKStoreManager.h"

@implementation MKStoreObserver

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
	for (SKPaymentTransaction *transaction in transactions)
	{
		switch (transaction.transactionState)
		{
			case SKPaymentTransactionStatePurchased:
				
                [self completeTransaction:transaction];
				
                break;
				
            case SKPaymentTransactionStateFailed:
				
                [self failedTransaction:transaction];
				
                break;
				
            case SKPaymentTransactionStateRestored:
				
                [self restoreTransaction:transaction];
				
            default:
				
                break;
		}			
	}
}

- (void)failedTransaction: (SKPaymentTransaction *)transaction
{	
    if (transaction.error.code != SKErrorPaymentCancelled)		
    {		
        // Optionally, display an error here.
		NSLog(@"Failed Transaction - Unknown Error");
    }	
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
     //transaction.transactionIdentifier;
    NSLog(@"transaction ID: %@", transaction.transactionIdentifier);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppPurchaseFail" object:self];

}

- (void)completeTransaction: (SKPaymentTransaction *)transaction
{		
    //[[MKStoreManager sharedManager] provideContent:transaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    NSLog(@"transaction ID: %@", transaction.transactionIdentifier);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppPurchaseSuccessful" object:self];

}

- (void)restoreTransaction: (SKPaymentTransaction *)transaction
{	
    //[[MKStoreManager sharedManager] provideContent:transaction.originalTransaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppPurchaseSuccessful" object:self];

}

@end

