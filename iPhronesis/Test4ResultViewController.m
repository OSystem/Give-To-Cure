//
//  Test4ResultViewController.m
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 11/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import "Test4ResultViewController.h"
#import "RealmObjectClass.h"

@interface Test4ResultViewController ()
{
    Test4 *testObject;
}
@end

@implementation Test4ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    testObject = [Test4 objectForPrimaryKey:self.currentTestIndex];
    
    self.repeatButton.layer.cornerRadius = 8.0;
    self.repeatButton.clipsToBounds = YES;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %@",testObject.testTotalResult];
    
    if ([testObject.testTotalResult intValue] >= 9)
    {
        self.resultOutcomeLabel.text = @"It's a possible indication of impaired function or cognitive impairment";
    }
    else
    {
        self.resultOutcomeLabel.text = @"You are a Healthy Soul!";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)repeatTestButtonPressed:(id)sender {
    
    
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm transactionWithBlock:^{
        
        testObject.testQ1Result = @"0";
        testObject.testQ2Result = @"0";
        testObject.testQ3Result = @"0";
        testObject.testQ4Result = @"0";
        testObject.testQ5Result = @"0";
        testObject.testQ6Result = @"0";
        testObject.testQ7Result = @"0";
        testObject.testQ8Result = @"0";
        testObject.testQ9Result = @"0";
        testObject.testQ10Result = @"0";
        testObject.testTotalResult = @"0";
        
    }];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
