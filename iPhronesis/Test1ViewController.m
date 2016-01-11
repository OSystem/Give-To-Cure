//
//  Test1ViewController.m
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 08/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import "Test1ViewController.h"
#import "Test1ActivityViewController.h"


@interface Test1ViewController ()
{
    NSString *currentTestIndex;
}
@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.wordList1 = [wordLibrary1 allObjects];
    self.wordList2 = [wordLibrary2 allObjects];
    self.wordList3 = [wordLibrary3 allObjects];
    
    wordLibrary1 *word1Object = [self.wordList1 objectAtIndex:arc4random()%[self.wordList1 count]];
    
    wordLibrary2 *word2Object = [self.wordList2 objectAtIndex:arc4random()%[self.wordList2 count]];
    
    wordLibrary3 *word3Object = [self.wordList3 objectAtIndex:arc4random()%[self.wordList3 count]];
    
    
    self.word1Label.text = word1Object.word;
    self.word2Label.text = word2Object.word;
    self.word3Label.text = word3Object.word;
    
    
    RLMRealm *realm = RLMRealm.defaultRealm;
    
    [realm transactionWithBlock:^{

        Test *testObject = [[Test alloc] init];
        Test *tempTestObject = [[[Test allObjects] sortedResultsUsingProperty:@"testIndex" ascending:YES] lastObject];
        currentTestIndex = [NSString stringWithFormat:@"%d",[tempTestObject.testIndex intValue]+1];
        
        testObject.testIndex = currentTestIndex;
        testObject.testWord1 = word1Object.word;
        testObject.testWord2 = word2Object.word;
        testObject.testWord3 = word3Object.word;
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-MMM-yyyy hh:mm a"];
        NSString *updateString = [dateFormatter stringFromDate:[NSDate date]];
        
        testObject.testDate = [dateFormatter dateFromString:updateString];
        
        [realm addOrUpdateObject:testObject];

        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"test1Activity"]) {
        
        Test1ActivityViewController *destinationView = segue.destinationViewController;
        destinationView.currentTestIndex = currentTestIndex;
    }
}


- (IBAction)memorizeButtonPressed:(id)sender {
    
    [self performSegueWithIdentifier:@"test1Activity" sender:self];
}
@end
