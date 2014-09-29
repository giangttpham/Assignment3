//
//  CS646ViewController.m
//  Assignment3
//
//  Created by Tra` Beo' on 9/26/14.
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
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateButtonPressed:(UIButton *)sender {

     _movingLabel.text = inputText.text;
    if ([inputX.text length]>0 && [inputY.text length]>0)
    {
        CGFloat xCoor = (CGFloat) [inputX.text floatValue];
        CGFloat yCoor = (CGFloat) [inputY.text floatValue];
        _movingLabel.center = CGPointMake(xCoor, yCoor);
    }
   
    [self.inputText resignFirstResponder];
    [self.inputX resignFirstResponder];
    [self.inputY resignFirstResponder];

    //    [self.view endEditing:YES];

}

- (NSString *) saveFilePath
{
    NSArray *path =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [[path objectAtIndex:0] stringByAppendingPathComponent:@"savefile.plist"];
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSArray *values = [[NSArray alloc] initWithObjects:inputText.text,inputX.text ,inputY.text,nil];
    [values writeToFile:[self saveFilePath] atomically:YES];
}
@end
