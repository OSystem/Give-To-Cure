//
//  Test1ResultViewController.h
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 09/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Test1ResultViewController : UIViewController

@property (strong,nonatomic) NSString *currentTestIndex;

@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *noOfAttemptsLabel;


- (IBAction)repeatTestButtonPressed:(id)sender;

@end
