//
//  Test1ResultViewController.m
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 09/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import "Test1ResultViewController.h"
#import "RealmObjectClass.h"

@interface Test1ResultViewController ()
{
    Test *testObject;
}
@end

@implementation Test1ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    testObject = [Test objectForPrimaryKey:self.currentTestIndex];
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %@/3",testObject.testResult];
    
    self.noOfAttemptsLabel.text = [NSString stringWithFormat:@"Attempts: %@",testObject.testAttempts];
    
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
        
        testObject.testResult = @"0";
        testObject.testAttempts = @"0";
        
    }];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
