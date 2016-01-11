//
//  Test1ActivityViewController.h
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 08/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RealmObjectClass.h"

@interface Test1ActivityViewController : UIViewController

@property (strong,nonatomic) RLMResults *wordList1;
@property (strong,nonatomic) RLMResults *wordList2;
@property (strong,nonatomic) RLMResults *wordList3;

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (strong,nonatomic) NSString *currentTestIndex;

@end
