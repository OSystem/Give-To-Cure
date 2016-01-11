//
//  Test4ResultViewController.h
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 11/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Test4ResultViewController : UIViewController

@property (strong,nonatomic) NSString *currentTestIndex;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;


@property (strong, nonatomic) IBOutlet UILabel *resultOutcomeLabel;


@property (strong, nonatomic) IBOutlet UIButton *repeatButton;

- (IBAction)repeatTestButtonPressed:(id)sender;

@end
