#import <UIKit/UIKit.h>
#import "MKStoreManager.h"
#import "MKStoreObserver.h"

MKStoreManager *storeManager;

NSTimer *timer;

NSString* upgradeDescription;
NSString* upgradePrice;

@interface InAppController : NSObject {
	//IBOutlet UITextView *textViewDescription;
	//IBOutlet UIButton *upgradeButton;
	//IBOutlet UILabel *priceLabel;
	
	
}

- (BOOL)initialize;

//@property (nonatomic, retain) IBOutlet UITextView *textViewDescription;
//@property (nonatomic, retain) IBOutlet UIButton *upgradeButton;
//@property (nonatomic, retain) IBOutlet UILabel *priceLabel;

//-(IBAction)UpgradeToFullVersion;
//-(void)PurchaseUpdatedMethod;



@end

bool Initialize();