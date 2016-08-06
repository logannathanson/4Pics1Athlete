//
//  RFViewController.h
//  4Pics1Country
//
//  Created by Roey Farag on 7/28/13.
//  Copyright (c) 2013 Roey Farag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "Jokers.h"
#import "MKStoreManager.h"
#import "MKStoreObserver.h"
#import <RevMobAds/RevMobAds.h>
#import <iAd/iAd.h>
#import <iAd/ADBannerView.h>

@interface RFViewController : UIViewController<UIAlertViewDelegate,RevMobAdsDelegate, ADBannerViewDelegate>
{
    NSMutableArray *listOfWords;
    
    int currentCountryIndex;
    NSMutableArray *currentWord;
    NSString *currentPoolOfLetters;
    
    
    NSMutableArray *poolOfLetters;
    
    // By Roey
    NSMutableArray *poolOfHints ;
    
    // By Roey
    NSMutableArray *countOfDisplayLetters ;
    
    // By Roey
    int index;
    
    // By Roey
    NSTimer *timeRed ;
    // By Roey
    NSTimer *timeCyan ;
    
    // By Roey
    NSMutableArray *countOfButtonLetterRows ;
    
    // By Roey
    IBOutlet UIImageView *bannerImg ;
    
    // By Roey
    SystemSoundID SoundID ;
    
    // By Roey
    int levelIndex ;
    
    Jokers *bank ; 
    
    BOOL boughtLetter ;
    
    // By Roey
    BOOL boughtHint ;
    
    ///// INAPP PURCHASE
    
    IBOutlet UILabel *tierAFeatureLabel;
    
    IBOutlet UIButton *tierABuyButton;
    
    IBOutlet UIActivityIndicatorView *indicatorA;
    
    
    
    IBOutlet UILabel *tierBFeatureLabel;
    
    IBOutlet UIButton *tierBBuyButton;
    
    IBOutlet UIActivityIndicatorView *indicatorB;
    
    
    
    IBOutlet UILabel *tierCFeatureLabel;
    
    IBOutlet UIButton *tierCBuyButton;
    
    IBOutlet UIActivityIndicatorView *indicatorC;
    
    
    
    IBOutlet UIButton *ButtonBackFromInApp;
    
    
    
    MKStoreManager *storeMgr;
    
    NSTimer *timerInApp;
    
    IBOutlet UILabel *jokerCountInAppLabel;
    
    ///// END OF INAPP PURCHASE
    
    // By Roey
    NSMutableArray *listOfHints;
    
    BOOL revmobShown;
    BOOL iBannerIsVisible;
    
    // By Roey
    NSMutableArray *countOfValuesOfDisplayLetters ;
    
    
    
    NSDate *PlayLevelStartDate;
    
    // By Roey
    int numberOfTimes_clicked_hints ;
    
    // By Roey
    int numberOfTimes_clicked_shop ;
    
    // By Roey
    float totalTimeOnGame ;
    
    // By Roey
    int theTimeSpent ;
    
    // By Roey
    float restoreTimeCurrentlyOnLevel ;
    
    // By Roey
    int promitionTimer ;
    
    // By Roey
    NSTimer *promotionCountDown ;
    
    BOOL currencyAddedThisTurn;
    
    int indexToAddInto;
    
}

@property (nonatomic, retain) IBOutlet UIButton *imageViewTopLeft;
@property (nonatomic, retain) IBOutlet UIButton *imageViewTopRight;
@property (nonatomic, retain) IBOutlet UIButton *imageViewBottomLeft;
@property (nonatomic, retain) IBOutlet UIButton *imageViewBottomRight;

@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow1_1;
@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow1_2;
@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow1_3;
@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow1_4;
@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow1_5;
@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow1_6;
@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow1_7;

@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow2_1;
@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow2_2;
@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow2_3;
@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow2_4;
@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow2_5;
@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow2_6;
@property (nonatomic, retain) IBOutlet UIButton *buttonLetterRow2_7;

@property (nonatomic, retain) IBOutlet UIButton *displayLetter1;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter2;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter3;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter4;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter5;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter6;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter7;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter8;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter9;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter10;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter11;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter12;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter13;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter14;
@property (nonatomic, retain) IBOutlet UIButton *displayLetter15;

@property(nonatomic, retain) NSMutableArray *listOfWords;

@property (nonatomic, retain) IBOutlet UILabel *countryNumberLabel;

@property (nonatomic, retain) IBOutlet UILabel *countryNameDEV;
-(IBAction)LetterPressed:(id)sender;

// By Roey
@property(nonatomic, retain) NSMutableArray *countOfDisplayLetters ;

// By Roey
//In case you would like to erase everything.
-(IBAction)clearAllButtonPressed:(id)sender ;

// By Roey
-(IBAction)displayLetterRemove:(id)sender ;

// By Roey
-(IBAction)pressedShowACorrectLetter:(id)sender ;

// By Roey
@property (nonatomic, retain) IBOutlet UIView *youWinMassage ;

// By Roey
@property (nonatomic, retain) IBOutlet UIImageView *bannerImg ;

// By Roey
@property (nonatomic, retain) IBOutlet UITextView *endOfGameMassage ; 

// By Roey
-(IBAction)pressedContinue:(id)sender ;

// By Roey
@property (nonatomic, retain) IBOutlet UIButton *continueButton ; 

@property(nonatomic, retain) IBOutlet UILabel *bankAmountLabel ;

// By Roey
@property (nonatomic, retain) IBOutlet UIButton *biggerPictureView ;

// By Roey
-(IBAction)pressedImageView:(id)sender ;

//By Roey
-(IBAction)pressedBiggerImageView:(id)sender ;


///// INAPP Purchase

-(IBAction)BuyTierA;

-(IBAction)BuyTierB;

-(IBAction)BuyTierC;

-(void)InitInApp;


@property (nonatomic, retain) IBOutlet UIView *InAppPanel;
-(IBAction)HideInAppPanel;
-(IBAction)DisplayJokersShop;

// By Roey
-(IBAction)pressedHint:(id)sender ;
// By Roey
@property (nonatomic, retain) IBOutlet UILabel *countryName ;

// By Roey
@property (nonatomic, retain) IBOutlet UIView *forShiftDisplayLetters ;

-(IBAction)ShowMoreGames;
@property (nonatomic, retain) IBOutlet ADBannerView *iBanner;

// By Roey
@property (nonatomic, retain) IBOutlet UIView *promotionPage ;

// By Roey
@property (nonatomic, retain) IBOutlet UILabel *countDownClock ;

@property (nonatomic, retain) IBOutlet UIButton *promotionViewBuyButton;
-(IBAction)BuyTierD;


@end





