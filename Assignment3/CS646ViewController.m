//
//  CS646ViewController.m
//  Assignment3
//
//  Created by Giang Pham on 9/26/14.
//  Copyright (c) 2014 Giang Pham. All rights reserved.
//

#import "CS646ViewController.h"

@interface CS646ViewController ()

@end

@implementation CS646ViewController
@synthesize inputText, inputX, inputY;
- (void)viewDidLoad
{
    NSString *myPath = [self saveFilePath];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:myPath];
    
    //if the data file for the app exists (not the first time running), load data on screen
    if (fileExists)
    {
        NSArray *values = [[NSArray alloc] initWithContentsOfFile:myPath];
        inputText.text = [values objectAtIndex:0];
        inputX.text = [values objectAtIndex:1];
        inputY.text = [values objectAtIndex:2];
    }
    
    UIApplication *myApp = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:myApp];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    // Dispose of any resources that can be recreated.
    [super didReceiveMemoryWarning];
}

- (IBAction)updateButtonPressed:(UIButton *)sender {

     _movingLabel.text = inputText.text;
    
    //if the X and Y textboxes are not empty, set label to new coordinates
    if ([inputX.text length]>0 && [inputY.text length]>0)
    {
        CGFloat xCoor = (CGFloat) [inputX.text floatValue];
        CGFloat yCoor = (CGFloat) [inputY.text floatValue];
        _movingLabel.center = CGPointMake(xCoor, yCoor);
    }

    //close the keyboard
    [self.view endEditing:YES];
}

// create a path to save the current textbox data before quitting app
- (NSString *) saveFilePath
{
    NSArray *path =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [[path objectAtIndex:0] stringByAppendingPathComponent:@"savefile.plist"];
    
}

// create an array that holds the app data before it quits
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSArray *values = [[NSArray alloc] initWithObjects:inputText.text,inputX.text ,inputY.text,nil];
    [values writeToFile:[self saveFilePath] atomically:YES];
}
@end
