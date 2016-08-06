//
//  RFViewController.m
//  4Pics1Country
//
//  Created by Roey Farag on 7/28/13.
//  Copyright (c) 2013 Roey Farag. All rights reserved.
//

#import "RFViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ASReviewPopup.h"
#import <AdColony/AdColony.h>



#import <Chartboost/Chartboost.h>
#import <Chartboost/CBNewsfeed.h>
#import <CommonCrypto/CommonDigest.h>
#import <AdSupport/AdSupport.h>

#define ITUNES_APPLE_ID         @"756689884" //found in iTunesConnect app info -> apple ID
#define ADCOLONY_ZONE_ID        @"vzff8d9fb447eb4403a1818b"


@interface RFViewController ()

@end

@implementation RFViewController ;
@synthesize imageViewBottomLeft, imageViewBottomRight, imageViewTopLeft, imageViewTopRight;

@synthesize buttonLetterRow1_1, buttonLetterRow1_2, buttonLetterRow1_3, buttonLetterRow1_4, buttonLetterRow1_5, buttonLetterRow1_6, buttonLetterRow1_7;

@synthesize buttonLetterRow2_1, buttonLetterRow2_2, buttonLetterRow2_3, buttonLetterRow2_4, buttonLetterRow2_5, buttonLetterRow2_6, buttonLetterRow2_7;

@synthesize displayLetter1, displayLetter10, displayLetter11, displayLetter12, displayLetter13, displayLetter14, displayLetter15, displayLetter2, displayLetter3, displayLetter4, displayLetter5, displayLetter6, displayLetter7, displayLetter8, displayLetter9;

@synthesize listOfWords;
@synthesize countryNumberLabel;

@synthesize countryNameDEV;

//By Roey
@synthesize countOfDisplayLetters ;

//By Roey
@synthesize youWinMassage ;

//By Roey
@synthesize bannerImg ;

@synthesize bankAmountLabel ;

// by Roey
@synthesize continueButton ;

// By Roey
@synthesize endOfGameMassage ;

// By Roey
@synthesize biggerPictureView ;

@synthesize InAppPanel;

// By Roey
@synthesize countryName ;

// By Roey
@synthesize forShiftDisplayLetters, countDownClock,promotionPage ;
@synthesize iBanner;
@synthesize promotionViewBuyButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    
    
    NSUserDefaults *alreadyPlayed = [NSUserDefaults standardUserDefaults];
    BOOL userPlayedThisGame = [alreadyPlayed boolForKey:@"alreadyPlayed"];
    
    NSLog(@"userPlayedThisGame: %hhd", userPlayedThisGame) ;
    
    if(!userPlayedThisGame)
    {
        NSLog(@"Inside !userPlayedThisGame") ;
        
        
        [alreadyPlayed setBool:true forKey:@"alreadyPlayed"];
        
    }
    
    //RevMobFullscreen* fullscreen = [[RevMobAds session] fullscreen];
    //fullscreen.delegate = self;
    //[fullscreen showAd];
    [self ShowAds];
    
    [self InitializeBank] ;
    
    [self LoadCurrentCountryIndex] ;
    
    
    //[self SaveCurrentCountryIndex];
    
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *pic1 = [UIImage imageNamed:[NSString stringWithFormat:@"word_%d_image_1.jpg", (levelIndex + 1)]];
    UIImage *pic2 = [UIImage imageNamed:[NSString stringWithFormat:@"word_%d_image_2.jpg", (levelIndex + 1)]];
    UIImage *pic3 = [UIImage imageNamed:[NSString stringWithFormat:@"word_%d_image_3.jpg", (levelIndex + 1)]];
    UIImage *pic4 = [UIImage imageNamed:[NSString stringWithFormat:@"word_%d_image_4.jpg", (levelIndex + 1)]];
    
    //NSLog(@"pic1: %@", pic1) ;
    
    [imageViewTopLeft setImage:pic1 forState:UIControlStateNormal] ;
    [imageViewTopRight setImage:pic2 forState:UIControlStateNormal] ;
    [imageViewBottomLeft setImage:pic3 forState:UIControlStateNormal] ;
    [imageViewBottomRight setImage:pic4 forState:UIControlStateNormal] ;
    
    [imageViewBottomLeft setBackgroundImage:pic1 forState:UIControlStateNormal];
    
    [buttonLetterRow1_1 setTitle:@"X" forState:UIControlStateNormal];
    [buttonLetterRow1_2 setTitle:@"X" forState:UIControlStateNormal];
    [buttonLetterRow1_3 setTitle:@"X" forState:UIControlStateNormal];
    [buttonLetterRow1_4 setTitle:@"X" forState:UIControlStateNormal];
    [buttonLetterRow1_5 setTitle:@"X" forState:UIControlStateNormal];
    [buttonLetterRow1_6 setTitle:@"X" forState:UIControlStateNormal];
    [buttonLetterRow1_7 setTitle:@"X" forState:UIControlStateNormal];
    
    [buttonLetterRow2_1 setTitle:@"X" forState:UIControlStateNormal];
    [buttonLetterRow2_2 setTitle:@"X" forState:UIControlStateNormal];
    [buttonLetterRow2_3 setTitle:@"X" forState:UIControlStateNormal];
    [buttonLetterRow2_4 setTitle:@"X" forState:UIControlStateNormal];
    [buttonLetterRow2_5 setTitle:@"X" forState:UIControlStateNormal];
    [buttonLetterRow2_6 setTitle:@"X" forState:UIControlStateNormal];
    [buttonLetterRow2_7 setTitle:@"X" forState:UIControlStateNormal];
    
    
    [displayLetter1 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter2 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter3 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter4 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter5 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter6 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter7 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter8 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter9 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter10 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter11 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter12 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter13 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter14 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter15 setTitle:@"_" forState:UIControlStateNormal];
    
    // todo:  get list of countries from a file (text file)
    listOfWords = [[NSMutableArray alloc] init];
    listOfHints = [[NSMutableArray alloc] init];
    /*[listOfWords addObject:@"FRANCE"];
     [listOfWords addObject:@"ITALY"];
     [listOfWords addObject:@"GERMANY"];
     [listOfWords addObject:@"ISRAEL"];
     [listOfWords addObject:@"CANADA"];
     */
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"List_of_words"
                                                     ofType:@"txt"];
    NSString* words = [NSString stringWithContentsOfFile:path
                                                encoding:NSUTF8StringEncoding
                                                   error:NULL];
    listOfWords = (NSMutableArray*)[words componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    NSString* hints_path = [[NSBundle mainBundle] pathForResource:@"1Pic1Country_Hints"
                                                           ofType:@"txt"];
    NSString* hints_words = [NSString stringWithContentsOfFile:hints_path
                                                      encoding:NSUTF8StringEncoding
                                                         error:NULL];
    listOfHints = (NSMutableArray*)[hints_words componentsSeparatedByString:@"\r\n"];
    
    iBanner.hidden = YES;
    iBanner.delegate = self;
    
    poolOfLetters = [[NSMutableArray alloc] init];
    //[poolOfLetters addObject:@"ASNEQITSUEJDTT"];
    [self PopulatePoolOfLettersToPress];
    
    countryNumberLabel.text = [NSString stringWithFormat:@"%d", levelIndex + 1];
    
    currentWord = [[NSMutableArray alloc] init];
    
    currentPoolOfLetters = [poolOfLetters objectAtIndex:levelIndex];
    
    //By Roey
    countOfDisplayLetters = [[NSMutableArray alloc] init];
    
    // By Roey
    countOfValuesOfDisplayLetters = [[NSMutableArray alloc] init];
    
    // By Roey
    [self putDisplayLettersInArray] ;
    
    //NSLog(@"countOfDisplayLetter 1 %@", [countOfDisplayLetters objectAtIndex:1]) ;
    [self SetCurrentWordTo:[listOfWords objectAtIndex:levelIndex]];
    
    
    [self DEVDisplayCountry];
    [self PopulateButtonLetters];
    
    // By Roey
    if([currentWord count] < [countOfDisplayLetters count])
    {
        // By Roey
        for (int i = [currentWord count]; i < [countOfDisplayLetters count]; i++)
        {
            UIButton *temp = [countOfDisplayLetters objectAtIndex:i] ;
            temp.hidden = YES ;
        }
    }
    
    // By Roey
    // [self InitializeButtonTags] ;
    
    // By Roey
    countOfButtonLetterRows = [[NSMutableArray alloc] init] ;
    // By Roey
    [self putButtonLetterRowsInArray] ;
    
    // By Roey
    [self initializeBanner] ;
    
    // By Roey
    boughtLetter = false ;
    
    // By Roey
    //[self numberOfwrongButtonLetters] ;
    
    // By Roey
    biggerPictureView.hidden = YES ;
    
    //currencyScreen.hidden = YES;
    
    [self SetupInAppPurchase];
    
    //NSLog(@"%d", [listOfWords count]) ;
    //NSLog(@"listOfWords objectAtIndex 0 %@ & 1 %@", [listOfWords objectAtIndex:0], [listOfWords objectAtIndex:1]) ;
    
    boughtHint = true ;
    
    //NSLog(@"listOfHints count: %d", [listOfHints count]) ;
    
    PlayLevelStartDate = [NSDate date];
    
    // By Roey
    numberOfTimes_clicked_hints = 0 ;
    numberOfTimes_clicked_shop = 0 ;
    
    //NSLog(@"promotion: %@", promotionPage);
    
    // By Roey
    [self EnableInAppGUI];
    //[self showPromotion];
    
    
}
// By Roey
-(void)viewWillDisappear
{
    NSLog(@"PlayLevelStartDate: %f", PlayLevelStartDate.timeIntervalSinceNow) ;
    
    float playedOnGame = PlayLevelStartDate.timeIntervalSinceNow * (-1);
    
    totalTimeOnGame = totalTimeOnGame + playedOnGame ;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setFloat:totalTimeOnGame forKey:@"time_Spend_On_Game"] ;
    
   
    float time_on_level_without_completingLevel = [PlayLevelStartDate timeIntervalSinceNow];
    time_on_level_without_completingLevel = time_on_level_without_completingLevel * (-1) ;
    
    NSUserDefaults *timeSpentOnLevels = [NSUserDefaults standardUserDefaults];
    [timeSpentOnLevels setFloat:time_on_level_without_completingLevel forKey:@"time_on_level_without_completingLevel"] ;
    
}
// By Roey
-(void)viewWillAppear
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    float timeSpent = [defaults floatForKey:@"time_Spend_On_Game"] ;
    totalTimeOnGame = timeSpent ;
    
    NSUserDefaults *timeSpentOnLevels = [NSUserDefaults standardUserDefaults];
    restoreTimeCurrentlyOnLevel = [timeSpentOnLevels floatForKey:@"time_on_level_without_completingLevel"] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)LetterPressed:(id)sender
{
    UIButton *button = (UIButton*)sender;
    NSLog(@"letter %@ pressed",button.titleLabel.text );
    
    // append the letter to the leftmost empty slot
    // repeat till we reach the last spot
    // validate the word
    
    if ([self CheckIfItIsFull])
    {
        [self validateDisplayLetters] ;
    }
    else
    {
        // I'm assigning this button(buttonLetter) a number.
        button.tag = index ;
        
        [self appendPressedLetter:button] ;
        
        // I'm hiding the button(buttonLetter).
        button.hidden = YES ;
    }
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(CheckValidateNeed) userInfo:nil repeats:NO];
}


// By Roey
// This method removes some wrong letter options.
-(IBAction)clearAllButtonPressed:(id)sender
{
    UIAlertView *evenNumbers ;
    
    int count = [self numberOfwrongButtonLetters] ;
    NSLog(@"Inside clearAllButtonPressed. Count: %d", count) ;
    
    // If there are 0 buttonLetterRow options ;
    if (count == 0)
    {
        evenNumbers = [[UIAlertView alloc] initWithTitle: @"" message: @"No wrong letters to remove." delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        evenNumbers.delegate = self;
        [evenNumbers show] ;
    }
    // remove 1
    else if((count > 0) && (count < 3))
    {
        evenNumbers = [[UIAlertView alloc] initWithTitle: @"" message: @"Delete some letters which are not part of the solution(80 coins)" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel",nil];
        
        evenNumbers.tag = 2 ;
        evenNumbers.delegate = self;
        [evenNumbers show] ;
    }
    // remove 2
    else if(count > 2 && count < 5)
    {
        evenNumbers = [[UIAlertView alloc] initWithTitle: @"" message: @"Delete some letters which are not part of the solution(80 coins)" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel",nil];
        
        evenNumbers.tag = 3 ;
        evenNumbers.delegate = self;
        [evenNumbers show] ;
    }
    // If 2-5 (2,1,1) remove 4
    else if((count > 4) && (count < 9))
    {
        evenNumbers = [[UIAlertView alloc] initWithTitle: @"" message: @"Delete some letters which are not part of the solution(80 coins)" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel",nil];
        
        evenNumbers.tag = 4;
        evenNumbers.delegate = self;
        [evenNumbers show] ;
    }
    // If 2-9 (4,2,2) remove 6
    else if((count > 8) && (count < 15))
    {
        evenNumbers = [[UIAlertView alloc] initWithTitle: @"" message: @"Delete some letters which are not part of the solution(80 coins)" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel",nil];
        
        evenNumbers.tag = 5 ;
        evenNumbers.delegate = self;
        [evenNumbers show] ;
    }
}

-(IBAction)displayLetterRemove:(id)sender
{
    NSLog(@"I am removing: %@", ((UIButton*)sender).titleLabel.text) ;
    
    // The display button that I was to delete.
    UIButton *buttonRemove = (UIButton*)sender ;
    
    if (![buttonRemove.titleLabel.text isEqualToString:@"_"])
    {
        [self letterRemoveOfDisplay:buttonRemove] ;
    }
    
}

// By Roey
-(void)letterRemoveOfDisplay: (UIButton*) buttonRemove
{
    NSLog(@"Inside letterRemoveOfDisplay %@", buttonRemove.titleLabel.text) ;
    
    //[timeRed invalidate] ;
    //timeRed = nil ;
    //[timeCyan invalidate] ;
    //timeCyan = nil ;
    [self changeBackTheColor] ;
    
    //[self printDisplayLetters] ;
    // To make displayLetter empty again.
    [buttonRemove setTitle:@"_" forState:UIControlStateNormal] ;
    //[self printDisplayLetters] ;
    
    if(buttonRemove.tag < index)
    {
        index = buttonRemove.tag ;
    }
    
    // The number of the displaybutton I deleted.
    int i  = buttonRemove.tag ;
    
    if(buttonLetterRow1_1.tag == i)
    {
        buttonLetterRow1_1.hidden = NO ;
    }
    if(buttonLetterRow1_2.tag == i)
    {
        buttonLetterRow1_2.hidden = NO ;
    }
    if(buttonLetterRow1_3.tag == i)
    {
        buttonLetterRow1_3.hidden = NO ;
    }
    if(buttonLetterRow1_4.tag == i)
    {
        buttonLetterRow1_4.hidden = NO ;
    }
    if(buttonLetterRow1_5.tag == i)
    {
        buttonLetterRow1_5.hidden = NO ;
    }
    if(buttonLetterRow1_6.tag == i)
    {
        buttonLetterRow1_6.hidden = NO ;
    }
    if(buttonLetterRow1_7.tag == i)
    {
        buttonLetterRow1_7.hidden = NO ;
    }
    if(buttonLetterRow2_1.tag == i)
    {
        buttonLetterRow2_1.hidden = NO ;
    }
    if(buttonLetterRow2_2.tag == i)
    {
        buttonLetterRow2_2.hidden = NO ;
    }
    if(buttonLetterRow2_3.tag == i)
    {
        buttonLetterRow2_3.hidden = NO ;
    }
    if(buttonLetterRow2_4.tag == i)
    {
        buttonLetterRow2_4.hidden = NO ;
    }
    if(buttonLetterRow2_5.tag == i)
    {
        buttonLetterRow2_5.hidden = NO ;
    }
    if(buttonLetterRow2_6.tag == i)
    {
        buttonLetterRow2_6.hidden = NO ;
    }
    if(buttonLetterRow2_7.tag == i)
    {
        buttonLetterRow2_7.hidden = NO ;
    }
}

// By Roey
/*-(void) appendPressedLetter :(UIButton*) getButton
 {
 NSLog(@"Inside appendPressedLetter") ;
 NSLog(@"Index: %d", index) ;
 index = 0 ;
 UIButton *currrentDisplayLetter =  [countOfDisplayLetters objectAtIndex:index] ;
 
 if (![currrentDisplayLetter.titleLabel.text caseInsensitiveCompare:@"_"] == 0)
 {
 NSLog(@"Does this get execute?") ;
 for (int i  = index; i < [currentWord count]; i++)
 {
 index++ ;
 currrentDisplayLetter =  [countOfDisplayLetters objectAtIndex:index] ;
 
 if ([currrentDisplayLetter.titleLabel.text caseInsensitiveCompare:@"_"] == 0)
 {
 getButton.tag = index ;
 break ;
 }
 }
 }
 
 NSLog(@"currentDisplayLetter & index: %@ and %d", currrentDisplayLetter.titleLabel.text, index) ;
 NSLog(@"getButton.titleLabel.text: %@", getButton.titleLabel.text) ;
 
 //NSString *ltr = getButton.titleLabel.text;
 [self printActualDisplayLetters] ;
 // Add a the letter to the displayLetter.
 [currrentDisplayLetter setTitle:getButton.titleLabel.text forState:UIControlStateNormal] ;
 [self printActualDisplayLetters] ;
 
 if (boughtLetter)
 {
 NSLog(@"Inside boughtLetter in append") ;
 //currrentDisplayLetter.tag = index ;
 BOOL found3 = false ;
 
 //[currrentDisplayLetter setTitle:@"_" forState:UIControlStateNormal];
 
 for (int i = 0; i < [currentWord count]; i++)
 {
 UIButton *boughtLetterCurrentDisplayLetter = [countOfDisplayLetters objectAtIndex:i] ;
 NSString *tempCurrentLetter = [currentWord objectAtIndex: i] ;
 
 NSLog(@"displayLetter2.tag %d", displayLetter2.tag) ;
 NSLog(@"boughtLetterCurrentDisplayLetter: %@ boughtLetterCurrentDisplayLetter.tag %d", boughtLetterCurrentDisplayLetter.titleLabel.text, boughtLetterCurrentDisplayLetter.tag ) ;
 NSLog(@"currentDisplayLetter: %@ currentDisplayLetter.tag: %d", currrentDisplayLetter.titleLabel.text, currrentDisplayLetter.tag) ;
 
 if (boughtLetterCurrentDisplayLetter.tag == currrentDisplayLetter.tag)
 {
 NSLog(@"boughtLetterCurrentDisplayLetter.tag == currrentDisplayLetter.tag") ;
 if (![boughtLetterCurrentDisplayLetter.titleLabel.text isEqualToString:tempCurrentLetter])
 {
 NSLog(@"![boughtLetterCurrentDisplayLetter.titleLabel.text isEqualToString:tempCurrentLetter]") ;
 [currrentDisplayLetter setTitle:@"_" forState:UIControlStateNormal];                    for (int i  = index; i < [currentWord count]; i++)
 {
 index++ ;
 currrentDisplayLetter =  [countOfDisplayLetters objectAtIndex:index] ;
 
 if ([currrentDisplayLetter.titleLabel.text isEqualToString: @"_"])
 {
 NSLog(@"currrentDisplayLetter.titleLabel.text isEqualToString: ") ;
 getButton.tag = index ;
 [currrentDisplayLetter setTitle: getButton.titleLabel.text forState:UIControlStateNormal];
 found3 = true ;
 index = 0 ;
 break ;
 }
 }
 }
 else
 {
 NSLog(@"Inside else of boughtLetter") ;
 [currrentDisplayLetter setTitle: getButton.titleLabel.text forState:UIControlStateNormal];
 index = 0 ;
 break ;
 }
 }
 if (found3)
 {
 break ;
 }
 }
 
 [currrentDisplayLetter setTitleColor:[UIColor blackColor] forState:UIControlStateNormal] ;
 currrentDisplayLetter.enabled = NO ;
 }
 
 
 // I'm assigning this currentDisplayLetter button a number.
 currrentDisplayLetter.tag = index ;
 
 // Go to the next displayLetter.
 index++ ;
 
 // If I have reached the end.
 if([self CheckIfItIsFull])
 {
 [self validateDisplayLetters] ;
 }
 boughtLetter = false ;
 }*/

// By Roey
-(void)validateDisplayLetters
{
    NSString *populateCharactersAsStrings = @"" ;
    
    for(int i = 0; i < [currentWord count]; i++)
    {
        UIButton *temp = [countOfDisplayLetters objectAtIndex: i] ;
        
        populateCharactersAsStrings = [NSString stringWithFormat:@"%@%@",populateCharactersAsStrings, temp.titleLabel.text] ;
    }
    
    NSLog(@"listOfWords objectAtIndex:levelIndex: %@ populateCharactersAsStrings %@", [listOfWords objectAtIndex:levelIndex], populateCharactersAsStrings) ;
    if([(NSString*)[listOfWords objectAtIndex:levelIndex] caseInsensitiveCompare:populateCharactersAsStrings] == 0)
    {
        NSLog(@"Correct!");
        [continueButton setTitle:@"" forState:UIControlStateNormal];
        endOfGameMassage.text = @"" ;
        
        [self SaveCurrentCountryIndex] ;
        
        
        if(!currencyAddedThisTurn)
        {
            currencyAddedThisTurn = YES;
            [bank Add:5];
            [bank LoadCount];
            bankAmountLabel.text = [NSString stringWithFormat:@"%d", bank.Count] ;
        }
        countryName.text = [[listOfWords objectAtIndex:levelIndex] uppercaseString] ;
        [countryName setTextColor:[UIColor greenColor]] ;
        
        for(int i = 0; i < [currentWord count]; i++)
        {
            UIButton *temp = [countOfDisplayLetters objectAtIndex: i] ;
            
            [temp setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        }
        
        youWinMassage.hidden = NO ;
        
        [bannerImg setAnimationRepeatCount:4] ;
        [bannerImg startAnimating] ;
        
        AudioServicesPlaySystemSound(SoundID) ;
        
        NSLog(@"listOfWords count: %d levelIndex: %d", [listOfWords count], levelIndex) ;
        if ((levelIndex + 1)  == [listOfWords count])//[[listOfWords objectAtIndex:levelIndex + 1] isEqualToString:@"null"])
        {
            NSLog(@"Inside (levelIndex == [listOfWords count])") ;
            //continueButton.hidden = YES ;
            //[continueButton setTitle:@"Restart" forState:UIControlStateNormal];
            endOfGameMassage.text = @"YOU WON THE GAME!" ;
        }
        
    }
    else
    {
        NSLog(@"Wrong!") ;
        
        
        //timeRed = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(wrongAnswer) userInfo:nil repeats:YES];
        
        //timeCyan = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(changeBackTheColor) userInfo:nil repeats:YES];
        
        [self wrongAnswer] ;
        
        //[self changeBackTheColor] ;
        
    }
}

// By Roey
-(void)initializeBanner
{
    youWinMassage.hidden = YES ;
    
    bannerImg.animationImages = [NSArray arrayWithObjects:
                                 [UIImage imageNamed:@"FireWorks1.tiff"],
                                 [UIImage imageNamed:@"FireWorks2.tiff"],
                                 [UIImage imageNamed:@"FireWorks3.tiff"],
                                 [UIImage imageNamed:@"FireWorks4.tiff"],
                                 [UIImage imageNamed:@"FireWorks5.tiff"],
                                 [UIImage imageNamed:@"FireWorks6.tiff"],
                                 [UIImage imageNamed:@"FireWorks7.tiff"],
                                 [UIImage imageNamed:@"FireWorks8.tiff"],
                                 [UIImage imageNamed:@"FireWorks9.tiff"],
                                 [UIImage imageNamed:@"FireWorks10.tiff"],
                                 [UIImage imageNamed:@"FireWorks11.tiff"],
                                 [UIImage imageNamed:@"FireWorks12.tiff"],
                                 [UIImage imageNamed:@"FireWorks13.tiff"],
                                 [UIImage imageNamed:@"FireWorks14.tiff"],
                                 [UIImage imageNamed:@"FireWorks15.tiff"],
                                 [UIImage imageNamed:@"FireWorks16.tiff"],
                                 [UIImage imageNamed:@"FireWorks17.tiff"],
                                 [UIImage imageNamed:@"FireWorks18.tiff"],
                                 [UIImage imageNamed:@"FireWorks19.tiff"],
                                 [UIImage imageNamed:@"FireWorks20.tiff"], nil] ;
    
    NSURL *buttonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Sound" ofType:@"wav"]] ;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)buttonURL, &SoundID) ;
}

// By Roey.
-(void) wrongAnswer
{
    for(int i = 0; i < [currentWord count]; i++)
    {
        UIButton *temp = [countOfDisplayLetters objectAtIndex: i] ;
        
        [temp setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
}

// By Roey
-(void) putDisplayLettersInArray
{
    [countOfDisplayLetters addObject:displayLetter1];
    [countOfDisplayLetters addObject:displayLetter2];
    [countOfDisplayLetters addObject:displayLetter3];
    [countOfDisplayLetters addObject:displayLetter4];
    [countOfDisplayLetters addObject:displayLetter5];
    [countOfDisplayLetters addObject:displayLetter6];
    [countOfDisplayLetters addObject:displayLetter7];
    [countOfDisplayLetters addObject:displayLetter8];
    [countOfDisplayLetters addObject:displayLetter9];
    [countOfDisplayLetters addObject:displayLetter10];
    [countOfDisplayLetters addObject:displayLetter11];
    [countOfDisplayLetters addObject:displayLetter12];
    [countOfDisplayLetters addObject:displayLetter13];
    [countOfDisplayLetters addObject:displayLetter14];
    [countOfDisplayLetters addObject:displayLetter15];
}


-(void)SetCurrentWordTo :(NSString*)word
{
    [currentWord removeAllObjects];
    UIButton *letter ;
    
    for (int i = 0; i < [word length]; i++)
    {
        letter = [countOfDisplayLetters objectAtIndex:i] ;
        NSLog(@"letter: %d %@", i, letter.titleLabel.text) ;
        
        NSString *currentLetter = [NSString stringWithFormat:@"%c",[word characterAtIndex:i]];
        [currentWord addObject:currentLetter];
        
        NSLog(@"word characterAtIndex: i: %c", [word characterAtIndex:i]) ;
        if ([word characterAtIndex:i] == ' ')
        {
            NSLog(@"letter.hidden:") ;
            [letter setTitle: @" " forState:UIControlStateNormal];
            NSLog(@"letter.titleLabel.text: %d %@", i , letter.titleLabel.text) ;
            letter.hidden = YES ;
        }
    }
    
    [self shiftDisplayLetters] ;
}

-(void)shiftDisplayLetters
{
    double midpoint = ceil([currentWord count] / 2) ;
    
    NSLog(@"currentWord count: %d", [currentWord count]) ;
    NSLog(@"midpoint: %f", midpoint) ;
    
    if (midpoint == 1)
    {
        //aView.center = CGPointMake(150, 150);
        forShiftDisplayLetters.center = CGPointMake(288 , 284) ;
        // DONE!
    }
    else if (midpoint == 2)
    {
        //aView.center = CGPointMake(150, 150);
        forShiftDisplayLetters.center = CGPointMake(264 , 284) ;
        // Done!
    }
    else if (midpoint == 3)
    {
        //aView.center = CGPointMake(150, 150);
        forShiftDisplayLetters.center = CGPointMake(244 , 284) ;
        //forShiftDisplayLetters.frame = CGRectMake( 91, 265, forShiftDisplayLetters.frame.size.width, forShiftDisplayLetters.frame.size.height );
        // Done!
    }
    else if (midpoint == 4)
    {
        //aView.center = CGPointMake(150, 150);
        forShiftDisplayLetters.center = CGPointMake(225 , 284) ;
        // Done!
    }
    else if (midpoint == 5)
    {
        //aView.center = CGPointMake(150, 150);
        forShiftDisplayLetters.center = CGPointMake(205 , 284) ;
        // Done!
    }
    else if (midpoint == 6)
    {
        //aView.center = CGPointMake(150, 150);
        NSLog(@"Inside midpoint == 6") ;
        //forShiftDisplayLetters.hidden = YES;
        forShiftDisplayLetters.center = CGPointMake(182 , 284) ;
        //forShiftDisplayLetters.frame = CGRectOffset( forShiftDisplayLetters.frame, 220, 280 );
        //forShiftDisplayLetters.frame = CGRectMake( 91, 265, forShiftDisplayLetters.frame.size.width, forShiftDisplayLetters.frame.size.height );
        // Done!
    }
    else if (midpoint == 7)
    {
        //aView.center = CGPointMake(150, 150);
        forShiftDisplayLetters.center = CGPointMake(175 , 284) ;
        // Done!
    }
}

-(void)DEVDisplayCountry
{
    NSString *country = @"";
    
    for(int i = 0; i < [currentWord count]; i++)
    {
        country = [NSString stringWithFormat:@"%@%@",country,[currentWord objectAtIndex:i]];
    }
    
    //countryNameDEV.text = country;
    NSLog(@"Current country is: %@", country);
}


-(void)PopulateButtonLetters
{
    [buttonLetterRow1_1 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:0]] forState:UIControlStateNormal];
    [buttonLetterRow1_2 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:1]] forState:UIControlStateNormal];
    [buttonLetterRow1_3 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:2]] forState:UIControlStateNormal];
    [buttonLetterRow1_4 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:3]] forState:UIControlStateNormal];
    [buttonLetterRow1_5 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:4]] forState:UIControlStateNormal];
    [buttonLetterRow1_6 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:5]] forState:UIControlStateNormal];
    [buttonLetterRow1_7 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:6]] forState:UIControlStateNormal];
    [buttonLetterRow2_1 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:7]] forState:UIControlStateNormal];
    [buttonLetterRow2_2 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:8]] forState:UIControlStateNormal];
    [buttonLetterRow2_3 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:9]] forState:UIControlStateNormal];
    [buttonLetterRow2_4 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:10]] forState:UIControlStateNormal];
    [buttonLetterRow2_5 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:11]] forState:UIControlStateNormal];
    [buttonLetterRow2_6 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:12]] forState:UIControlStateNormal];
    [buttonLetterRow2_7 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:13]] forState:UIControlStateNormal];
    //[buttonLetterRow2_1 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:0]] forState:UIControlStateNormal];
    //[buttonLetterRow2_1 setTitle:[NSString stringWithFormat:@"%c", [currentPoolOfLetters characterAtIndex:0]] forState:UIControlStateNormal];
    
    
}

-(void)showLetters
{
    buttonLetterRow1_1.hidden = NO ;
    buttonLetterRow1_2.hidden = NO ;
    buttonLetterRow1_3.hidden = NO ;
    buttonLetterRow1_4.hidden = NO ;
    buttonLetterRow1_5.hidden = NO ;
    buttonLetterRow1_6.hidden = NO ;
    buttonLetterRow1_7.hidden = NO ;
    buttonLetterRow2_1.hidden = NO ;
    buttonLetterRow2_2.hidden = NO ;
    buttonLetterRow2_3.hidden = NO ;
    buttonLetterRow2_4.hidden = NO ;
    buttonLetterRow2_5.hidden = NO ;
    buttonLetterRow2_6.hidden = NO ;
    buttonLetterRow2_7.hidden = NO ;
}

/*-(void)InitializeButtonTags
 
 {
 
 buttonLetterRow1_1.tag = -1;
 
 buttonLetterRow1_2.tag = -1;
 
 buttonLetterRow1_3.tag = -1;
 
 buttonLetterRow1_4.tag = -1;
 
 buttonLetterRow1_5.tag = -1;
 
 buttonLetterRow1_6.tag = -1;
 
 buttonLetterRow1_7.tag = -1;
 
 buttonLetterRow2_1.tag = -1;
 
 buttonLetterRow2_2.tag = -1;
 
 buttonLetterRow2_3.tag = -1;
 
 buttonLetterRow2_4.tag = -1;
 
 buttonLetterRow2_5.tag = -1;
 
 buttonLetterRow2_6.tag = -1;
 
 buttonLetterRow2_7.tag = -1;
 
 }
 */

-(void)changeBackTheColor
{
    NSLog(@"Inside changeBackTheColor") ;
    
    for(int i = 0; i < [currentWord count]; i++)
    {
        UIButton *temp = [countOfDisplayLetters objectAtIndex: i] ;
        
        if (temp.isEnabled == 1)
        {
            NSLog(@"Inside temp.isEnabled == 1") ;
            [temp setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
        else if(temp.isEnabled == 0)
        {
            [temp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
}

// By Roey
-(Boolean)CheckIfItIsFull
{
    BOOL found = true;
    
    for (int i = 0; i < [currentWord count]; i++)
    {
        UIButton *temp = [countOfDisplayLetters objectAtIndex:i] ;
        
        if ([temp.titleLabel.text caseInsensitiveCompare:@"_"] == 0)
        {
            found = false ;
            break ;
        }
    }
    return found ;
}

// By Roey
-(void) putButtonLetterRowsInArray
{
    [countOfButtonLetterRows addObject:buttonLetterRow1_1] ;
    [countOfButtonLetterRows addObject:buttonLetterRow1_2] ;
    [countOfButtonLetterRows addObject:buttonLetterRow1_3] ;
    [countOfButtonLetterRows addObject:buttonLetterRow1_4] ;
    [countOfButtonLetterRows addObject:buttonLetterRow1_5] ;
    [countOfButtonLetterRows addObject:buttonLetterRow1_6] ;
    [countOfButtonLetterRows addObject:buttonLetterRow1_7] ;
    [countOfButtonLetterRows addObject:buttonLetterRow2_1] ;
    [countOfButtonLetterRows addObject:buttonLetterRow2_2] ;
    [countOfButtonLetterRows addObject:buttonLetterRow2_3] ;
    [countOfButtonLetterRows addObject:buttonLetterRow2_4] ;
    [countOfButtonLetterRows addObject:buttonLetterRow2_5] ;
    [countOfButtonLetterRows addObject:buttonLetterRow2_6] ;
    [countOfButtonLetterRows addObject:buttonLetterRow2_7] ;
}

// By Roey
-(IBAction)pressedShowACorrectLetter:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"" message: @"Show a correct letter (60 coins)" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel",nil];
    
    alert.tag = 1;
    alert.delegate = self;
    [alert show] ;
    
    //[self getACorrectLetter] ;
}

// By Roey
-(IBAction)pressedContinue:(id)sender
{
    NSLog(@"Inside pressedContinue") ;
    currencyAddedThisTurn = NO;
    [self analytics] ;
    

    UIButton *tempremoveDisplayLetter ;
    UIButton *tempRemoveButtonLetter ;
    
    for (int i = 0; i < [currentWord count]; i++)
    {
        tempremoveDisplayLetter = [countOfDisplayLetters objectAtIndex:i] ;
        tempremoveDisplayLetter.enabled = YES ;
        
        if (![tempremoveDisplayLetter.titleLabel.text isEqualToString:@"_"])
        {
            [self letterRemoveOfDisplay:tempremoveDisplayLetter] ;
        }
    }
    
    for (int i = 0; i < [countOfDisplayLetters count]; i++)
    {
        tempremoveDisplayLetter = [countOfDisplayLetters objectAtIndex:i] ;
        //tempRemoveButtonLetter = [countOfButtonLetterRows objectAtIndex:i] ;
        tempremoveDisplayLetter.hidden = NO ;
        //tempRemoveButtonLetter.hidden = NO ;
        //tempRemoveButtonLetter.tag = 0 ;
    }
    
    for (int j = 0; j < [countOfButtonLetterRows count]; j++)
    {
        tempRemoveButtonLetter = [countOfButtonLetterRows objectAtIndex:j] ;
        tempRemoveButtonLetter.hidden = NO ;
        tempRemoveButtonLetter.tag = 0 ;
    }
    
    if ((levelIndex + 1)  == [listOfWords count])
    {
        levelIndex = 0;
        [self SaveCurrentCountryIndex];
        [self ResetCurrentCountry];
        
    }
    else
    {
        levelIndex++ ;
    }
    
    if(levelIndex % 5 == 0)
    {
        [self ShowAds];
    }
    if(levelIndex % 14 == 0)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        BOOL userLeftReview = [defaults boolForKey:@"userLeftReview"];
        if(!userLeftReview)
        {
            [self AskUserToReviewApp];
        }
    }
    
    if(levelIndex % 8 == 0)
    {
        [self triggerVideo];
    }
    
    currentPoolOfLetters = [poolOfLetters objectAtIndex:levelIndex];
    
    forShiftDisplayLetters.center = CGPointMake(160 , 284) ;
    
    [self SetCurrentWordTo:[listOfWords objectAtIndex:levelIndex]];
    
    
    [self DEVDisplayCountry];
    [self PopulateButtonLetters];
    youWinMassage.hidden = YES ;
    
    // By Roey
    if([currentWord count] < [countOfDisplayLetters count])
    {
        // By Roey
        for (int i = [currentWord count]; i < [countOfDisplayLetters count]; i++)
        {
            UIButton *temp = [countOfDisplayLetters objectAtIndex:i] ;
            temp.hidden = YES ;
        }
    }
    currentCountryIndex++ ;
    countryNumberLabel.text = [NSString stringWithFormat:@"%d", levelIndex + 1] ;
    
    int N = levelIndex + 1;
    NSString * image1 = [NSString stringWithFormat:@"word_%d_image_1.jpg", N];
    NSString * image2 = [NSString stringWithFormat:@"word_%d_image_2.jpg", N];
    NSString * image3 = [NSString stringWithFormat:@"word_%d_image_3.jpg", N];
    NSString * image4 = [NSString stringWithFormat:@"word_%d_image_4.jpg", N];
    NSLog(@"tempStr: %@",image1);
    
    UIImage *pic1 = [UIImage imageNamed:image1];
    UIImage *pic2 = [UIImage imageNamed:image2];
    UIImage *pic3 = [UIImage imageNamed:image3];
    UIImage *pic4 = [UIImage imageNamed:image4];
    
    [imageViewTopLeft setImage:pic1 forState:UIControlStateNormal] ;
    [imageViewTopRight setImage:pic2 forState:UIControlStateNormal] ;
    [imageViewBottomLeft setImage:pic3 forState:UIControlStateNormal] ;
    [imageViewBottomRight setImage:pic4 forState:UIControlStateNormal] ;
    
    biggerPictureView.hidden = YES ;
    
    boughtHint = true ;
    
    //[imageViewTopLeft setImage:pic1 forState:UIControlStateNormal] ;
    //[imageViewTopRight setImage:pic2 forState:UIControlStateNormal] ;
    //[imageViewBottomLeft setImage:pic3 forState:UIControlStateNormal] ;
    //[imageViewBottomRight setImage:pic4 forState:UIControlStateNormal] ;
    
    //imageViewTopLeft.image = [UIImage imageNamed:image1];
    //imageViewTopRight.image = [UIImage imageNamed:image2];
    //imageViewBottomRight.image = [UIImage imageNamed:image3];
    //imageViewBottomLeft.image = [UIImage imageNamed:image4];
    
    
    [bank LoadCount];
    bankAmountLabel.text = [NSString stringWithFormat:@"%d", bank.Count] ;
    if(currentCountryIndex % 15 == 0)
    {
        [self showPromotion];
    }
}


-(void)analytics
{
   
    theTimeSpent = [PlayLevelStartDate timeIntervalSinceNow]; // in seconds
    
    theTimeSpent = theTimeSpent * (-1) ;
    
    // This adds the time user exited level and then returned.
    theTimeSpent = theTimeSpent + restoreTimeCurrentlyOnLevel ;
    
    PlayLevelStartDate = [NSDate date] ;
    
   
    NSUserDefaults *timeSpentOnLevels = [NSUserDefaults standardUserDefaults];
    [timeSpentOnLevels setInteger:0 forKey:@"time_on_level_without_completingLevel"] ;
    
   
    // Resetting variable for new level.
    numberOfTimes_clicked_hints = 0 ;
    
   
    // Resetting variable for new level.
    numberOfTimes_clicked_shop = 0 ;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        if (alertView.tag == 1)
        {
            if(bank.Count < 60)
            {
                InAppPanel.hidden = NO;
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Not enough coins" message: @"No problem. You can get more coins here" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                alert.tag = -1 ;
                alert.delegate = self;
                [alert show] ;
                
            }
            else
            {
                [bank Remove:60];
                [bank LoadCount];
                bankAmountLabel.text = [NSString stringWithFormat:@"%d", bank.Count] ;
                [self getACorrectLetter] ;
            }
        }
        // Another if statement.
        if(alertView.tag == 2)
        {
            if(bank.Count < 80)
            {
                InAppPanel.hidden = NO;
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Not enough coins" message: @"No problem. You can get more coins here" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                alert.tag = -1 ;
                alert.delegate = self;
                [alert show] ;
                
            }
            else
            {
                [bank Remove:80];
                [bank LoadCount];
                bankAmountLabel.text = [NSString stringWithFormat:@"%d", bank.Count] ;
                NSLog(@"Inside alertView.tag == 3") ;
                [self removeWrongLetters:1] ;
            }
        }
        if(alertView.tag == 3)
        {
            if(bank.Count < 80)
            {
                InAppPanel.hidden = NO;
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Not enough coins" message: @"No problem. You can get more coins here" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                alert.tag = -1 ;
                alert.delegate = self;
                [alert show] ;
                
            }
            else
            {
                [bank Remove:80];
                [bank LoadCount];
                bankAmountLabel.text = [NSString stringWithFormat:@"%d", bank.Count] ;
                NSLog(@"Inside alertView.tag == 3") ;
                [self removeWrongLetters:2] ;
            }
        }
        if(alertView.tag == 4)
        {
            if(bank.Count < 80)
            {
                InAppPanel.hidden = NO;
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Not enough coins" message: @"No problem. You can get more coins here" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                alert.tag = -1 ;
                alert.delegate = self;
                [alert show] ;
                
            }
            else
            {
                [bank Remove:80];
                [bank LoadCount];
                bankAmountLabel.text = [NSString stringWithFormat:@"%d", bank.Count] ;
                NSLog(@"Inside alertView.tag == 3") ;
                [self removeWrongLetters:4] ;
            }
        }
        if(alertView.tag == 5)
        {
            if(bank.Count < 80)
            {
                InAppPanel.hidden = NO;
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Not enough coins" message: @"No problem. You can get more coins here" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                alert.tag = -1 ;
                alert.delegate = self;
                [alert show] ;
                
            }
            else
            {
                [bank Remove:80];
                [bank LoadCount];
                bankAmountLabel.text = [NSString stringWithFormat:@"%d", bank.Count] ;
                NSLog(@"Inside alertView.tag == 3") ;
                [self removeWrongLetters:6] ;
            }
        }
        if(alertView.tag == 6)
        {
            [bank Remove:50];
            [bank LoadCount];
            bankAmountLabel.text = [NSString stringWithFormat:@"%d", bank.Count] ;
            NSLog(@"Inside alertView.tag == 6") ;
            [self boughtHint] ;
            boughtHint = false ;
        }
    }
    else
    {
        NSLog(@"I pressed Cancel");
    }
}

-(void)InitializeBank
{
    bank = [[Jokers alloc] init];
    [bank LoadCount];
    
    //NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    //[[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    bankAmountLabel.text = [NSString stringWithFormat:@"%d", bank.Count] ;
    //bankAmountLabel.text = [NSString stringWithFormat:@"%d", bank.Count];
}

-(int)numberOfwrongButtonLetters
{
    NSLog(@"Inside numberOfWrongButtonLetters") ;
    
    int count = 0;
    BOOL exist = true ;
    UIButton *tempButtonLetterRow ;
    NSString *tempLetterOfCurrentWord ;
    
    for (int i = 0; i < [countOfButtonLetterRows count]; i++)
    {
        
        exist = true ;
        tempButtonLetterRow = [countOfButtonLetterRows objectAtIndex:i] ;
        
        NSLog(@"tempButtonLetterRow: %@", tempButtonLetterRow.titleLabel.text) ;
        
        for (int j = 0; j < [currentWord count]; j++)
        {
            tempLetterOfCurrentWord = [currentWord objectAtIndex:j] ;
            NSLog(@"tempButtonLetterRow: %@ tempLetterOfCurrentword %@", tempButtonLetterRow.titleLabel.text, tempLetterOfCurrentWord) ;
            
            if ([tempButtonLetterRow.titleLabel.text isEqualToString:tempLetterOfCurrentWord])
            {
                NSLog(@"Inside tempButtonLetterRow.titleLabel.text isEqualToString:tempLetterOfCurrentWord") ;
                exist = false ;
            }
        }
        if (exist)
        {
            if (tempButtonLetterRow.isHidden == 0)
            {
                NSLog(@"Inside exist. Count: %d", count) ;
                count++ ;
            }
        }
    }
    
    NSLog(@"count %d", count) ;
    return count ;
}

-(void)removeWrongLetters: (int) num
{
    
    NSLog(@"Inside numberOfWrongButtonLetters") ;
    int count = 0 ;
    BOOL exist = true ;
    UIButton *tempButtonLetterRow ;
    NSString *tempLetterOfCurrentWord ;
    
    for (int i = 0; i < [countOfButtonLetterRows count]; i++)
    {
        
        exist = true ;
        tempButtonLetterRow = [countOfButtonLetterRows objectAtIndex:i] ;
        
        NSLog(@"tempButtonLetterRow: %@", tempButtonLetterRow.titleLabel.text) ;
        
        for (int j = 0; j < [currentWord count]; j++)
        {
            tempLetterOfCurrentWord = [currentWord objectAtIndex:j] ;
            NSLog(@"tempButtonLetterRow: %@ tempLetterOfCurrentword %@", tempButtonLetterRow.titleLabel.text, tempLetterOfCurrentWord) ;
            
            if ([tempButtonLetterRow.titleLabel.text isEqualToString:tempLetterOfCurrentWord])
            {
                NSLog(@"Inside tempButtonLetterRow.titleLabel.text isEqualToString:tempLetterOfCurrentWord") ;
                exist = false ;
            }
        }
        if (exist)
        {
            if (tempButtonLetterRow.isHidden == 0)
            {
                NSLog(@"Inside exist");
                tempButtonLetterRow.tag = -1 ;
                tempButtonLetterRow.hidden = YES ;
                count++ ;
            }
        }
        if ((count) == num)
        {
            break ;
        }
    }
}

/*-(void)getACorrectLetter
 {
 UIButton *tempButton ;
 NSString *tempString ;
 
 for (int i = 0; i < [currentWord count]; i++)
 {
 tempButton = [countOfDisplayLetters objectAtIndex:i] ;
 tempString = [currentWord objectAtIndex:i] ;
 
 if (![tempButton.titleLabel.text isEqualToString:tempString])
 {
 if (![tempButton.titleLabel.text isEqualToString:@"_"])
 {
 [self letterRemoveOfDisplay:tempButton] ;
 }
 
 [tempButton setTitle:tempString forState:UIControlStateNormal] ;
 
 [tempButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal] ;
 tempButton.enabled = NO ;
 
 break ;
 }
 
 }
 }*/


-(void)makePictureBigger: (UIButton*) pic
{
    UIImage *image = [pic imageForState:UIControlStateNormal];
    
    [biggerPictureView setImage:image forState:UIControlStateNormal] ;
    
    biggerPictureView.hidden = NO ;
}

-(IBAction)pressedImageView:(id)sender
{
    
    UIButton *imageToMakeBigger = (UIButton*)sender;
    
    [self makePictureBigger:imageToMakeBigger] ;
}

-(IBAction)pressedBiggerImageView:(id)sender
{
    biggerPictureView.hidden = YES ;
}


#pragma mark INAPP purchase

-(void)SetupInAppPurchase
{
    [indicatorA startAnimating];
    [indicatorB startAnimating];
    
    
    tierABuyButton.enabled = NO;
    tierABuyButton.hidden = YES;
    tierBBuyButton.enabled = NO;
    tierBBuyButton.hidden = YES;
    tierCBuyButton.enabled = NO;
    tierCBuyButton.hidden = YES;
    
    [self InitInApp];
    
    
    
}



-(void)InitInApp
{
    storeMgr = [MKStoreManager sharedManager];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ProductDataLoaded) name:@"ProductDataLoaded" object:storeMgr];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buyFeatureSuccessful) name:@"AppPurchaseSuccessful" object:storeMgr.storeObserver];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buyFeatureFail) name:@"AppPurchaseFail" object:storeMgr.storeObserver];
}



-(void)ProductDataLoaded
{
    [self EnableInAppGUI];
    
    tierAFeatureLabel.text = [NSString stringWithFormat:@"%@",storeMgr.productA.price];
    
    tierBFeatureLabel.text = [NSString stringWithFormat:@"%@",storeMgr.productB.price];
    
    tierCFeatureLabel.text = [NSString stringWithFormat:@"%@",storeMgr.productC.price];
    
}



-(void)EnableInAppGUI
{
    tierABuyButton.enabled = YES;
    
    tierABuyButton.hidden = NO;
    
    tierBBuyButton.enabled = YES;
    
    tierBBuyButton.hidden = NO;
    
    tierCBuyButton.enabled = YES;
    
    tierCBuyButton.hidden = NO;
    
    
    
    [indicatorA stopAnimating];
    [indicatorB stopAnimating];
    [indicatorC stopAnimating];
    
    ButtonBackFromInApp.enabled = YES; // close button
    
}



-(void)DisableInAppGUI
{
    
    tierABuyButton.enabled = NO;
    
    tierABuyButton.hidden = YES;
    
    indicatorA.hidden = NO;
    
    
    
    tierBBuyButton.enabled = NO;
    
    tierBBuyButton.hidden = YES;
    
    indicatorB.hidden = NO;
    
    
    
    tierCBuyButton.enabled = NO;
    
    tierCBuyButton.hidden = YES;
    
    indicatorC.hidden = NO;
    
    
    
    ButtonBackFromInApp.enabled = NO;
    
}



-(IBAction)BuyTierA
{
    [self DisableInAppGUI];
    [storeMgr buyFeatureA];
}



-(IBAction)BuyTierB
{
    [self DisableInAppGUI];
    [storeMgr buyFeatureB];
}



-(IBAction)BuyTierC
{
    [self DisableInAppGUI];
    [storeMgr buyFeatureC];
}

// Instant deal
-(IBAction)BuyTierD
{
    promotionViewBuyButton.hidden = YES;
    [storeMgr buyFeatureD];
    
}


-(void)buyFeatureSuccessful
{
    switch (storeMgr.buyingTierIndex)
    {
        case 0:
            [self buyFeatureASuccessful];
            break;
            
        case 1:
            [self buyFeatureBSuccessful];
            break;
            
        case 2:
            [self buyFeatureCSuccessful];
            break;
            
        case 3:
            [self buyFeatureDSuccessful];
            break;
            
            
        default:
            break;
            
    }
    ButtonBackFromInApp.enabled = YES;
    [self showPromotion];
}



-(void)buyFeatureFail
{
    switch (storeMgr.buyingTierIndex)
    {
        case 0:
            [self buyFeatureAFail];
            break;
            
        case 1:
            [self buyFeatureBFail];
            break;
            
        case 2:
            [self buyFeatureCFail];
            break;
            
        case 3:
            [self buyFeatureDFail];
            break;
            
            
            
        default:
            break;
            
    }
    ButtonBackFromInApp.enabled = YES;
    
}



-(void)buyFeatureASuccessful
{
    NSLog(@"buy feature A success");
    [bank Add:100];
    [self ConfigureJokers];
    [self EnableInAppGUI];
    
   
}



-(void)buyFeatureBSuccessful
{
    NSLog(@"buy feature B success");
    [bank Add:500];
    [self ConfigureJokers];
    [self EnableInAppGUI];
    
 }



-(void)buyFeatureCSuccessful
{
    NSLog(@"buy feature C success");
    [bank Add:5000];
    [self ConfigureJokers];
    [self EnableInAppGUI];
    
  }


-(void)buyFeatureDSuccessful
{
    promotionViewBuyButton.hidden = NO;
    promotionPage.hidden = YES;
    
    NSLog(@"buy feature D success");
    [bank Add:1200];
    [self ConfigureJokers];
    

}



-(void)buyFeatureAFail

{
    
    [self EnableInAppGUI];
    
    NSLog(@"buy feature A fail");
    
}



-(void)buyFeatureBFail

{
    
    [self EnableInAppGUI];
    
    NSLog(@"buy feature B fail");
    
}



-(void)buyFeatureCFail

{
    
    [self EnableInAppGUI];
    
    NSLog(@"buy feature C fail");
    
}

-(void)buyFeatureDFail
{
    promotionViewBuyButton.hidden = NO;
    NSLog(@"buy feature D fail");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message:@"Try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    promotionPage.hidden = YES;
}

-(IBAction)HideInAppPanel
{
    InAppPanel.hidden = YES;
}

-(IBAction)DisplayJokersShop
{
    numberOfTimes_clicked_shop++ ;
    
    InAppPanel.hidden = NO;
    NSLog(@"shop displayed");
}



-(void)ConfigureJokers
{
    
    [bank LoadCount];
    
    bankAmountLabel.text = [NSString stringWithFormat:@"%d", [bank Count]];
    
    //jokerCountInAppLabel.text = [@"x" stringByAppendingFormat:@"%d", [jokers Count]];
    
}


// By Roey
-(void)boughtHint
{
    UIAlertView *hint ;
    
    NSString *getHint = [listOfHints objectAtIndex:levelIndex] ;
    
    NSLog(@"getHint: %@", getHint) ;
    
    hint = [[UIAlertView alloc] initWithTitle: @"" message: getHint delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    hint.delegate = self;
    [hint show] ;
}

-(IBAction)pressedHint:(id)sender
{
    
    numberOfTimes_clicked_hints++ ;
    
    if (boughtHint)
    {
        if(bank.Count < 50)
        {
            InAppPanel.hidden = NO;
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Not enough coins" message: @"No problem. You can get more coins here" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            alert.tag = -1 ;
            alert.delegate = self;
            [alert show] ;
            
        }
        else
        {
            UIAlertView *hintMassage ;
            
            hintMassage = [[UIAlertView alloc] initWithTitle: @"" message: @"Buy a hint(50 coins)" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel",nil];
            
            hintMassage.tag = 6 ;
            hintMassage.delegate = self;
            [hintMassage show] ;
        }
    }
    else
    {
        [self boughtHint] ;
    }
}


-(void)SaveCurrentCountryIndex
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //BOOL userAlreadyPlayedThisGame = [defaults boolForKey:@"userAlreadyPlayedThisGame"];
    int level = (levelIndex + 1);
    if(level >= [listOfWords count])
    {
        level = [listOfWords count] - 1;
    }
    NSLog(@"level: %d", level) ;
    [defaults setInteger:level forKey:@"levelIndex"];
}

-(void)LoadCurrentCountryIndex
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    levelIndex = [defaults integerForKey:@"levelIndex"];
    
    NSLog(@"levelIndex in LoadCurrentCountry: %d", levelIndex) ;
}

-(void)ResetCurrentCountry
{
    UIImage *pic1 = [UIImage imageNamed:[NSString stringWithFormat:@"word_%d_image_1.jpg", (levelIndex + 1)]];
    UIImage *pic2 = [UIImage imageNamed:[NSString stringWithFormat:@"word_%d_image_2.jpg", (levelIndex + 1)]];
    UIImage *pic3 = [UIImage imageNamed:[NSString stringWithFormat:@"word_%d_image_3.jpg", (levelIndex + 1)]];
    UIImage *pic4 = [UIImage imageNamed:[NSString stringWithFormat:@"word_%d_image_4.jpg", (levelIndex + 1)]];
    
    [imageViewTopLeft setImage:pic1 forState:UIControlStateNormal] ;
    [imageViewTopRight setImage:pic2 forState:UIControlStateNormal] ;
    [imageViewBottomLeft setImage:pic3 forState:UIControlStateNormal] ;
    [imageViewBottomRight setImage:pic4 forState:UIControlStateNormal] ;
    
    [displayLetter1 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter2 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter3 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter4 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter5 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter6 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter7 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter8 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter9 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter10 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter11 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter12 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter13 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter14 setTitle:@"_" forState:UIControlStateNormal];
    [displayLetter15 setTitle:@"_" forState:UIControlStateNormal];
    
    countryNumberLabel.text = [NSString stringWithFormat:@"%d", levelIndex + 1];
    currentPoolOfLetters = [poolOfLetters objectAtIndex:levelIndex];
    [self SetCurrentWordTo:[listOfWords objectAtIndex:levelIndex]];
    [self PopulateButtonLetters];
    boughtLetter = false ;
    biggerPictureView.hidden = YES ;
    boughtHint = true ;
}


-(void)ShowAds
{
    [[RevMobAds session] showFullscreen];
    revmobShown = YES;
    [Chartboost showInterstitial:CBLocationHomeScreen];
    
}

-(IBAction)ShowMoreGames
{
    [[RevMobAds session] openAdLinkWithDelegate:self];
}


-(void)revmobAdDidFailWithError:(NSError *)error
{
    return;
}

-(void)AskUserToReviewApp
{
    [[ASReviewPopup sharedPopup] setPopupFrequency:ASReviewPopupFrequencyMajorVersion];     // You can set this to ASReviewPopupFrequencyAlways to force the alert to always show when testing
    //[[ASReviewPopup sharedPopup] setPopupFrequency:ASReviewPopupFrequencyAlways];
    
    // Set the number of days to wait before showing the alert
    [[ASReviewPopup sharedPopup] setNumberOfDaysBeforeShowingPopup:14];
    
    // Set the App Store URL - replace the ITUNES_APPLE_ID with your own app's ID (found in iTunes Connect)
    [[ASReviewPopup sharedPopup] setAppStoreURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", ITUNES_APPLE_ID]]];
    
    // Call to trigger
    [[ASReviewPopup sharedPopup] showAlert];
    
}


#pragma mark AdColony-specific
-(void)triggerVideo
{
    [AdColony playVideoAdForZone:ADCOLONY_ZONE_ID withDelegate:nil];
}


- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (iBannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // assumes the banner view is at the top of the screen.
        //banner.frame = CGRectOffset(banner.frame, 0, -banner.frame.size.height);
        iBanner.hidden = YES;
        [UIView commitAnimations];
        iBannerIsVisible = NO;
    }
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    iBanner.hidden = NO;
    iBannerIsVisible = YES;
}

-(void)bannerViewWillLoadAd:(ADBannerView *)banner
{
    NSLog(@"bannerViewWillLoadAd called");
}

-(void)CheckValidateNeed
{
    if ([self CheckIfItIsFull])
    {
        [self validateDisplayLetters] ;
    }
}

-(void)printDisplayLetters
{
    NSString *p ;
    
    for (int i = 0; i < [currentWord count]; i++)
    {
        p = [countOfValuesOfDisplayLetters objectAtIndex:i] ;
        NSLog(@"%@", p) ;
    }
}

-(void)printActualDisplayLetters
{
    UIButton *p ;
    
    for (int i = 0; i < [currentWord count]; i++)
    {
        p = [countOfDisplayLetters objectAtIndex:i] ;
        NSLog(@"%@", p.titleLabel.text) ;
    }
}

// By Roey
-(void) putValuesOfDisplayLettersInArray
{
    NSLog(@"Inside putValuesOfDisplayLettersInArray. Testing displayLetter1.titleLabel.text: %@", displayLetter1.titleLabel.text) ;
    
    [countOfValuesOfDisplayLetters addObject:displayLetter1.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter2.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter3.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter4.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter5.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter6.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter7.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter8.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter9.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter10.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter11.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter12.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter13.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter14.titleLabel.text];
    [countOfValuesOfDisplayLetters addObject:displayLetter15.titleLabel.text];
    
}

// By Roey
-(void)letterRemoveOfDisplayString: (int) buttonRemove
{
    NSLog(@"Inside letterRemoveOfDisplay %d", buttonRemove) ;
    
    //[self->timeRed invalidate] ;
    //timeRed = nil ;
    //[self->timeCyan invalidate] ;
    //timeCyan = nil ;
    [self changeBackTheColor] ;
    
    //[self printDisplayLetters] ;
    // To make displayLetter empty again.
    [countOfValuesOfDisplayLetters replaceObjectAtIndex:buttonRemove withObject:@"_"] ;
    //[buttonRemove setTitle:@"_" forState:UIControlStateNormal] ;
    //[self printDisplayLetters] ;
    
    if(buttonRemove < index)
    {
        index = buttonRemove ;
    }
    
    // The number of the displaybutton I deleted.
    int i  = buttonRemove ;
    
    if(buttonLetterRow1_1.tag == i)
    {
        buttonLetterRow1_1.hidden = NO ;
    }
    if(buttonLetterRow1_2.tag == i)
    {
        buttonLetterRow1_2.hidden = NO ;
    }
    if(buttonLetterRow1_3.tag == i)
    {
        buttonLetterRow1_3.hidden = NO ;
    }
    if(buttonLetterRow1_4.tag == i)
    {
        buttonLetterRow1_4.hidden = NO ;
    }
    if(buttonLetterRow1_5.tag == i)
    {
        buttonLetterRow1_5.hidden = NO ;
    }
    if(buttonLetterRow1_6.tag == i)
    {
        buttonLetterRow1_6.hidden = NO ;
    }
    if(buttonLetterRow1_7.tag == i)
    {
        buttonLetterRow1_7.hidden = NO ;
    }
    if(buttonLetterRow2_1.tag == i)
    {
        buttonLetterRow2_1.hidden = NO ;
    }
    if(buttonLetterRow2_2.tag == i)
    {
        buttonLetterRow2_2.hidden = NO ;
    }
    if(buttonLetterRow2_3.tag == i)
    {
        buttonLetterRow2_3.hidden = NO ;
    }
    if(buttonLetterRow2_4.tag == i)
    {
        buttonLetterRow2_4.hidden = NO ;
    }
    if(buttonLetterRow2_5.tag == i)
    {
        buttonLetterRow2_5.hidden = NO ;
    }
    if(buttonLetterRow2_6.tag == i)
    {
        buttonLetterRow2_6.hidden = NO ;
    }
    if(buttonLetterRow2_7.tag == i)
    {
        buttonLetterRow2_7.hidden = NO ;
    }
}

-(void) putValuesBackFromArrayToDisplayLetters
{
    NSLog(@"Inside putValuesOfDisplayLettersInArray. Testing displayLetter1.titleLabel.text: %@", displayLetter1.titleLabel.text) ;
    UIButton *temp4 ;
    NSString *theStringInTheArray ;
    
    for (int i = 0; i < [countOfDisplayLetters count]; i++)
    {
        temp4 = [countOfDisplayLetters objectAtIndex:i] ;
        theStringInTheArray = [countOfValuesOfDisplayLetters objectAtIndex:i] ;
        [temp4 setTitle:theStringInTheArray forState:UIControlStateNormal] ;
    }
    //[currrentDisplayLetter setTitle:@"_" forState:UIControlStateNormal]
    
}

-(void) appendPressedLetterIntoArray :(UIButton*) getButton
{
    NSLog(@"getButton %@", getButton.titleLabel.text) ;
    
    index = 0 ;
    NSString *currrentDisplayLetterInArray =  [countOfValuesOfDisplayLetters objectAtIndex:index] ;
    
    if (![currrentDisplayLetterInArray caseInsensitiveCompare:@"_"] == 0)
    {
        NSLog(@"Inside ![currrentDisplayLetter.titleLabel.text caseInsensitiveCompare:] == 0") ;
        for (int i  = index; i < [currentWord count]; i++)
        {
            index++ ;
            currrentDisplayLetterInArray =  [countOfValuesOfDisplayLetters objectAtIndex:index] ;
            
            if ([currrentDisplayLetterInArray caseInsensitiveCompare:@"_"] == 0)
            {
                getButton.tag = index ;
                break ;
            }
        }
    }
    
    NSLog(@"currentDisplayLetterInArray: %@", currrentDisplayLetterInArray) ;
    [self printDisplayLetters] ;
    
    // Add a the letter to the displayLetter.
    [countOfValuesOfDisplayLetters replaceObjectAtIndex:index withObject:getButton.titleLabel.text] ;
    
    [self printDisplayLetters] ;
    
}

// By Roey - deal
-(void)showPromotion
{
    [self.view bringSubviewToFront:promotionPage];
    [self.view bringSubviewToFront:countDownClock];
    NSLog(@"Inside showPromotion") ;
    
    promotionPage.hidden = NO ;
    promitionTimer = 26 ;
    
    promotionCountDown = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES] ;
}

// By Roey
-(void)countDown
{
    promitionTimer -= 1 ;
    countDownClock.text = [NSString stringWithFormat:@"%i", promitionTimer] ;
    
    if (promitionTimer == 0)
    {
        [promotionCountDown invalidate] ;
        promotionPage.hidden = YES ;
    }
}

-(void)PopulatePoolOfLettersToPress
{
    //[poolOfLetters addObject:@"ASNEQITSUEJDTT"];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"letters_to_press" ofType:@"txt"];
    NSString* words = [NSString stringWithContentsOfFile:path
                                                encoding:NSUTF8StringEncoding
                                                   error:NULL];
    poolOfLetters = (NSMutableArray*)[words componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    for (int i = 0; i < [poolOfLetters count]; i++)
    {
        NSString *letter = [poolOfLetters objectAtIndex:i];
        NSString *newLetter = [letter uppercaseString];
        [poolOfLetters replaceObjectAtIndex:i withObject:newLetter];
    }
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


-(void)getACorrectLetter
{
    UIButton *temp ;
    NSString *tempCurrentLetter ;
    BOOL found = false ;
    BOOL foundAButton  = true ;
    UIButton *tempButtonLetterRow ;
    
    NSLog(@"Entered ShowCorrectLetter") ;
    
    if ([self CheckIfItIsFull])
    {
        for(int k = 0; k < [countOfDisplayLetters count]; k++)
        {
            tempCurrentLetter = [currentWord objectAtIndex: k] ;
            temp = [countOfDisplayLetters objectAtIndex:k] ;
            
            NSLog(@"In for loop and currently at temp.titlelabel.text: %@ tempcurrentLetter: %@ ",temp.titleLabel.text, tempCurrentLetter) ;
            
            if (![temp.titleLabel.text isEqualToString:tempCurrentLetter])
            {
                NSLog(@"if (![temp.titleLabel.text isEqualToString:tempCurrentLetter])") ;
                
                for (int j = 0; j < [countOfButtonLetterRows count]; j++)
                {
                    tempButtonLetterRow = [countOfButtonLetterRows objectAtIndex:j] ;
                    
                    NSLog(@"tempButtonLetterRow.titleLabel.text %@ tempCurrentLetter %@", tempButtonLetterRow.titleLabel.text, tempCurrentLetter) ;
                    
                    if([tempButtonLetterRow.titleLabel.text isEqualToString: tempCurrentLetter])
                    {
                        NSLog(@"Inside if([tempButtonLetterRow.titleLabel.text isEqualToString: tempCurrentLetter])");
                        
                        if (tempButtonLetterRow.isHidden == 0)
                        {
                            NSLog(@" Inside if (tempButtonLetterRow.isHidden == 0)") ;
                            
                            [self letterRemoveOfDisplay:temp] ;
                            NSLog(@"temp.tag = %d", temp.tag) ;
                            indexToAddInto = temp.tag ;
                            // I'm assigning this button(buttonLetter) a number.
                            tempButtonLetterRow.tag = index ;
                            
                            NSLog(@"I'm assigning this (buttonLetter) a number. %i", tempButtonLetterRow.tag) ;
                            boughtLetter = true ;
                            
                            [self appendPressedLetter2:tempButtonLetterRow] ;
                            
                            tempButtonLetterRow.hidden = YES ;
                            found = true ;
                            foundAButton = false ;
                            break ;
                        }
                    }
                }
                for (int m = 0; (m < [countOfDisplayLetters count]) && (foundAButton); m++)
                {
                    NSLog(@"Inside for (int m = 0; (m < [countOfDisplayLetters count]) && (foundAButton); m++)") ;
                    
                    UIButton *anotherTemp = [countOfDisplayLetters objectAtIndex:m];
                    NSString *anotherTempCurrentLetter = [currentWord objectAtIndex: m] ;
                    
                    NSLog(@"tempCurrentLetter: %@ anotherTemp.titleLabel.text %@", tempCurrentLetter, anotherTemp.titleLabel.text) ;
                    if ([tempCurrentLetter isEqualToString:anotherTemp.titleLabel.text])
                    {
                        NSLog(@"Inside if ([tempCurrentLetter isEqualToString:anotherTemp.titleLabel.text])") ;
                        NSLog(@"anotherTemp.titleLabel.text: %@ anotherTempCurrentLetter %@", anotherTemp.titleLabel.text, anotherTempCurrentLetter) ;
                        
                        if (![anotherTemp.titleLabel.text isEqualToString:anotherTempCurrentLetter])
                        {
                            NSLog(@"inside if (![anotherTemp.titleLabel.text isEqualToString:anotherTempCurrentLetter])") ;
                            
                            [self letterRemoveOfDisplay:anotherTemp] ;
                            [self letterRemoveOfDisplay:temp] ;
                            indexToAddInto = temp.tag ;
                            
                            for (int n = 0; n < [countOfButtonLetterRows count]; n++)
                            {
                                UIButton *finalTempOfButtonLetterRows = [countOfButtonLetterRows objectAtIndex:n] ;
                                
                                if ([tempCurrentLetter isEqualToString:finalTempOfButtonLetterRows.titleLabel.text])
                                {
                                    if (finalTempOfButtonLetterRows.isHidden == 0)
                                    {
                                        // I'm assigning this button(buttonLetter) a number.
                                        finalTempOfButtonLetterRows.tag = index ;
                                        
                                        NSLog(@"tempButtonLetterRow.titleLabel.text %@", finalTempOfButtonLetterRows.titleLabel.text) ;
                                        boughtLetter = true ;
                                        
                                        [self appendPressedLetter2:finalTempOfButtonLetterRows] ;
                                        
                                        [self changeBackTheColor] ;
                                        finalTempOfButtonLetterRows.hidden = YES ;
                                        found = true ;
                                        foundAButton = false ;
                                        
                                        break ;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (found)
            {
                break ;
            }
        }
    }
    else
    {
        NSLog(@"Inside else") ;
        for (int i = 0; i < [currentWord count]; i++)
        {
            NSLog(@"i: %d", i) ;
            foundAButton = false ;
            tempCurrentLetter = [currentWord objectAtIndex: i] ;
            temp = [countOfDisplayLetters objectAtIndex:i] ;
            
            if ([temp.titleLabel.text isEqualToString:@"_"])
            {
                for (int j = 0; j < [countOfButtonLetterRows count]; j++)
                {
                    UIButton *tempButtonLetterRow = [countOfButtonLetterRows objectAtIndex:j] ;
                    
                    if([tempButtonLetterRow.titleLabel.text isEqualToString: tempCurrentLetter])
                    {
                        NSLog(@"tempButtonLetterRow.titleLabel.text %@ tempCurrentLetter %@", tempButtonLetterRow.titleLabel.text, tempCurrentLetter) ;
                        foundAButton = true ;
                        if (tempButtonLetterRow.isHidden == 0)
                        {
                            // I'm assigning this button(buttonLetter) a number.
                            tempButtonLetterRow.tag = index ;
                            boughtLetter = true ;
                            
                            [self appendPressedLetter:tempButtonLetterRow] ;
                            
                            // I'm hiding the button(buttonLetter).
                            tempButtonLetterRow.hidden = YES ;
                            NSLog(@"I'm in the inner for loop. It should exit.") ;
                            found = true ;
                            foundAButton = false ;
                            
                            break ;
                        }
                    }
                }
            }
            // I added this.
            
            for (int m = 0; (m < [currentWord count]) && (foundAButton); m++)
            {
                NSLog(@"Inside for (int m = 0; (m < [countOfDisplayLetters count]) && (foundAButton); m++)") ;
                
                UIButton *anotherTemp = [countOfDisplayLetters objectAtIndex:m];
                NSString *anotherTempCurrentLetter = [currentWord objectAtIndex: m] ;
                
                NSLog(@"tempCurrentLetter: %@ anotherTemp.titleLabel.text %@", tempCurrentLetter, anotherTemp.titleLabel.text) ;
                if ([tempCurrentLetter isEqualToString:anotherTemp.titleLabel.text])
                {
                    NSLog(@"Inside if ([tempCurrentLetter isEqualToString:anotherTemp.titleLabel.text])") ;
                    NSLog(@"anotherTemp.titleLabel.text: %@ anotherTempCurrentLetter %@", anotherTemp.titleLabel.text, anotherTempCurrentLetter) ;
                    
                    if (![anotherTemp.titleLabel.text isEqualToString:anotherTempCurrentLetter])
                    {
                        NSLog(@"inside if (![anotherTemp.titleLabel.text isEqualToString:anotherTempCurrentLetter])") ;
                        
                        [self letterRemoveOfDisplay:anotherTemp] ;
                        // I need to take this out.
                        //[self letterRemoveOfDisplay:temp] ;
                        
                        for (int n = 0; n < [countOfButtonLetterRows count]; n++)
                        {
                            UIButton *finalTempOfButtonLetterRows = [countOfButtonLetterRows objectAtIndex:n] ;
                            
                            if ([tempCurrentLetter isEqualToString:finalTempOfButtonLetterRows.titleLabel.text])
                            {
                                if (finalTempOfButtonLetterRows.isHidden == 0)
                                {
                                    NSLog(@"Inside mush Morabia") ;
                                    //I'm assigning this button(buttonLetter) a number.
                                    finalTempOfButtonLetterRows.tag = index ;
                                    
                                    NSLog(@"tempButtonLetterRow.titleLabel.text %@", finalTempOfButtonLetterRows.titleLabel.text) ;
                                    boughtLetter = true ;
                                    
                                    [self appendPressedLetter:finalTempOfButtonLetterRows] ;
                                    index = 0 ;
                                    
                                    finalTempOfButtonLetterRows.hidden = YES ;
                                    
                                    found = true ;
                                    foundAButton = false ;
                                    
                                    break ;
                                }
                            }
                        }
                    }
                }
            }
            if (found)
            {
                break ;
            }
        }
    }
}


// By Roey
-(void) appendPressedLetter :(UIButton*) getButton
{
    NSLog(@"Inside appendPressedLetter") ;
    NSLog(@"Index: %d", index) ;
    index = 0 ;
    UIButton *currrentDisplayLetter =  [countOfDisplayLetters objectAtIndex:index] ;
    
    if (![currrentDisplayLetter.titleLabel.text isEqualToString: @"_"])
    {
        for (int i  = index; i < [currentWord count]; i++)
        {
            index++ ;
            currrentDisplayLetter =  [countOfDisplayLetters objectAtIndex:index] ;
            
            if ([currrentDisplayLetter.titleLabel.text isEqualToString: @"_"])
            {
                getButton.tag = index ;
                break ;
            }
        }
    }
    
    NSLog(@"currestDisplayLetter: %@", currrentDisplayLetter.titleLabel.text) ;
    //[self printDisplayLetters] ;
    // Add a the letter to the displayLetter.
    [currrentDisplayLetter setTitle: getButton.titleLabel.text forState:UIControlStateNormal];
    NSLog(@"Letter %@ Inserted", getButton.titleLabel.text) ;
    //[self printDisplayLetters] ;
    
    if (boughtLetter)
    {
        [currrentDisplayLetter setTitleColor:[UIColor blackColor] forState:UIControlStateNormal] ;
        currrentDisplayLetter.enabled = NO ;
    }
    
    // I'm assigning this currentDisplayLetter button a number.
    currrentDisplayLetter.tag = index ;
    
    // Go to the next displayLetter.
    index++ ;
    
    // If I have reached the end.
    if([self CheckIfItIsFull])
    {
        [self validateDisplayLetters] ;
    }
    boughtLetter = false ;
}

// By Roey
-(void) appendPressedLetter2 :(UIButton*) getButton
{
    NSLog(@"Inside appendPressedLetter2") ;
    NSLog(@"Index: %d", index) ;
    //index = 0 ;
    UIButton *currrentDisplayLetter =  [countOfDisplayLetters objectAtIndex:index] ;
    
    if (currrentDisplayLetter.tag != indexToAddInto)
    {
        for (int i  = index; i < [currentWord count]; i++)
        {
            index++ ;
            currrentDisplayLetter =  [countOfDisplayLetters objectAtIndex:index] ;
            
            if (currrentDisplayLetter.tag == indexToAddInto)
            {
                getButton.tag = index ;
                break ;
            }
        }
    }
    
    NSLog(@"currestDisplayLetter: %@", currrentDisplayLetter.titleLabel.text) ;
    //[self printDisplayLetters] ;
    // Add a the letter to the displayLetter.
    [currrentDisplayLetter setTitle: getButton.titleLabel.text forState:UIControlStateNormal];
    NSLog(@"Letter %@ Inserted", getButton.titleLabel.text) ;
    //[self printDisplayLetters] ;
    
    if (boughtLetter)
    {
        [currrentDisplayLetter setTitleColor:[UIColor blackColor] forState:UIControlStateNormal] ;
        currrentDisplayLetter.enabled = NO ;
    }
    
    // I'm assigning this currentDisplayLetter button a number.
    currrentDisplayLetter.tag = index ;
    
    // Go to the next displayLetter.
    index++ ;
    
    // If I have reached the end.
    if([self CheckIfItIsFull])
    {
        [self validateDisplayLetters] ;
    }
    boughtLetter = false ;
}

@end



