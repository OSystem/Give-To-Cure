//
//  Test1ViewController.h
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 08/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RealmObjectClass.h"

@interface Test1ViewController : UIViewController

@property (strong,nonatomic) RLMResults *wordList1;
@property (strong,nonatomic) RLMResults *wordList2;
@property (strong,nonatomic) RLMResults *wordList3;


@property (strong, nonatomic) IBOutlet UILabel *word1Label;
@property (strong, nonatomic) IBOutlet UILabel *word2Label;
@property (strong, nonatomic) IBOutlet UILabel *word3Label;


@property (strong, nonatomic) IBOutlet UIButton *memorizeButton;
- (IBAction)memorizeButtonPressed:(id)sender;


@end
