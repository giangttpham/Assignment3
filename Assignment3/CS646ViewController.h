//
//  CS646ViewController.h
//  Assignment3
//
//  Created by Giang Pham on 9/26/14.
//  Copyright (c) 2014 Giang Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CS646ViewController : UIViewController
@property (nonatomic, retain) IBOutlet UITextField *inputText;
@property (nonatomic, retain) IBOutlet UITextField *inputX;
@property (nonatomic, retain) IBOutlet UITextField *inputY;
@property (nonatomic) IBOutlet UILabel *movingLabel;

- (IBAction)updateButtonPressed:(UIButton *)sender;
- (NSString *) saveFilePath;
- (void)applicationDidEnterBackground:(UIApplication *)application;

@end
