#import "InAppViewController.h"


@implementation InAppController
//@synthesize textViewDescription;
//@synthesize upgradeButton;
//@synthesize priceLabel;


- (BOOL)initialize {
    BOOL success = false;
	storeManager = [MKStoreManager sharedManager];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ProductDataLoaded) name:@"ProductDataLoaded" object:storeManager];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PurchaseUpdatedMethod) name:@"PurchaseUpdated" object:storeManager];
    
	
	
	if ([[MKStoreManager sharedManager] fullUpgradeDescription] == nil || [[[MKStoreManager sharedManager] fullUpgradeDescription] caseInsensitiveCompare:@""] == 0) {
		[[MKStoreManager sharedManager] requestProductData];
	}
	else {
        //success = false;
        upgradeDescription = [[MKStoreManager sharedManager] fullUpgradeDescription];
        upgradePrice = [[MKStoreManager sharedManager] fullUpgradePrice];
		//textViewDescription.text = 	[[MKStoreManager sharedManager] fullUpgradeDescription];
		//priceLabel.text = [[MKStoreManager sharedManager] fullUpgradePrice];
	}

	//[[MKStoreManager sharedManager] requestProductData];
	
	timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(updateGUI:) userInfo:nil repeats:YES];
	
    success = true;
    
    return success;
}

/*
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];	
	BOOL featureAPurchased = [userDefaults boolForKey:@"com.mad33com.movietracker.upgrade_to_full2"];
	upgradeButton.enabled = !featureAPurchased;
}*/
	




/*- (void)dealloc {
    [super dealloc];
}*/

/*
-(IBAction)UpgradeToFullVersion
{
	// inapp purchase
	//if([MKStoreManager featureAPurchased])
	//{
		//unlock it
		//NSString *tmpString = [[NSString alloc] initWithFormat:@"inapp feature A purchased"];
		
	 
	//}
	self.navigationController.navigationBar.hidden = YES;
	[[MKStoreManager sharedManager] buyFeatureA];
	upgradeButton.enabled = NO;
	//[self.navigationController popViewControllerAnimated:YES];

}*/

/*
-(void)ProductDataLoaded
{
	textViewDescription.text = [[MKStoreManager sharedManager] fullUpgradeDescription];
	priceLabel.text = [[MKStoreManager sharedManager] fullUpgradePrice];
	//[self.view setNeedsDisplay];
	
}*/

/*
-(void)PurchaseUpdatedMethod
{
	// todo: check if feature has been saved to userdefaults
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	BOOL featureAPurchased = [userDefaults boolForKey:@"com.mad33com.movietracker.upgrade_to_full2"];

	if(featureAPurchased)
	{
	}
	else {
		upgradeButton.enabled = YES;

		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error Occured" message:@"Could not process transaction, please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	self.navigationController.navigationBar.hidden = NO;
	//[self.navigationController popViewControllerAnimated:YES];



}*/

/*
//define the targetmethod
-(void)updateGUI: (NSTimer*)theTimer
{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	BOOL featureAPurchased = [userDefaults boolForKey:@"com.mad33com.movietracker.upgrade_to_full2"];
	
	if(featureAPurchased)
	{
		self.navigationController.navigationBar.hidden = NO;
		upgradeButton.enabled = NO;
		[self.navigationController popViewControllerAnimated:YES];
		[timer invalidate];
	}
	else {
		upgradeButton.enabled = YES;
		
	}
}*/

@end

bool Initialize()
{
    // todo find how to call an obj-c method from a C function
    //viewDidLoad();
    InAppController *inAppController = [[InAppController alloc] init];
    bool result = [inAppController initialize];
    return result;
}
