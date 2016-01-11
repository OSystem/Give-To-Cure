//
//  Test1ActivityViewController.m
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 08/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import "Test1ActivityViewController.h"
#import "Test1ActivityViewCustomCell.h"
#import "Test1ResultViewController.h"

@interface Test1ActivityViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *answerOption;
    Test *testObject;
}
@end

@implementation Test1ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Test ID: %@",self.currentTestIndex);
    
    [self prepareTestSessionWithIndex:self.currentTestIndex];
    
}


#pragma  mark Test 1 Session Methods

-(void)prepareTestSessionWithIndex:(NSString*)testIndex
{
  
    testObject = [Test objectForPrimaryKey:testIndex];
    
    self.wordList1 = [wordLibrary1 allObjects];
    self.wordList2 = [wordLibrary2 allObjects];
    self.wordList3 = [wordLibrary3 allObjects];
    
    wordLibrary1 *word1Object = [self.wordList1 objectAtIndex:arc4random()%[self.wordList1 count]];
    
    wordLibrary2 *word2Object = [self.wordList2 objectAtIndex:arc4random()%[self.wordList2 count]];
    
    wordLibrary3 *word3Object = [self.wordList3 objectAtIndex:arc4random()%[self.wordList3 count]];
    
     answerOption = [[NSMutableArray alloc] init];
    [answerOption addObject:testObject.testWord1];
    [answerOption addObject:testObject.testWord2];
    [answerOption addObject:testObject.testWord3];
    
    
    // List 1
    if (![answerOption containsObject:word1Object.word])
    {
        [answerOption addObject:word1Object.word];
    }
    else
    {
        [answerOption addObject:[self getRandomReplacementWordFromList1ForWord:word1Object.word]];
    }
    
    
    // List 2
    if (![answerOption containsObject:word2Object.word])
    {
        [answerOption addObject:word2Object.word];
    }
    else
    {
        [answerOption addObject:[self getRandomReplacementWordFromList2ForWord:word2Object.word]];
    }
    
    
    // List 3
    if (![answerOption containsObject:word3Object.word])
    {
        [answerOption addObject:word3Object.word];
    }
    else
    {
        [answerOption addObject:[self getRandomReplacementWordFromList3ForWord:word3Object.word]];
    }
    
    
    [self shuffleOptions:answerOption];
}


#pragma mark Random Word Picker Methods

-(NSString*)getRandomWordFromList1
{
    wordLibrary1 *word1Object = [self.wordList1 objectAtIndex:arc4random()%[self.wordList1 count]];
    return word1Object.word;
    
}

-(NSString*)getRandomReplacementWordFromList1ForWord:(NSString*)word
{
    wordLibrary1 *word1Object = [[self.wordList1 objectsWhere:@"word != %@ AND word != %@",word,testObject.testWord1] firstObject];
    return word1Object.word;
    
}



-(NSString*)getRandomWordFromList2
{
    wordLibrary2 *word2Object = [self.wordList2 objectAtIndex:arc4random()%[self.wordList2 count]];
    return word2Object.word;
    
}

-(NSString*)getRandomReplacementWordFromList2ForWord:(NSString*)word
{
    wordLibrary2 *word2Object = [[self.wordList2 objectsWhere:@"word != %@ AND word != %@",word,testObject.testWord2] firstObject];
    return word2Object.word;
    
}



-(NSString*)getRandomWordFromList3
{
    wordLibrary3 *word3Object = [self.wordList3 objectAtIndex:arc4random()%[self.wordList3 count]];
    return word3Object.word;
    
}

-(NSString*)getRandomReplacementWordFromList3ForWord:(NSString*)word
{
    wordLibrary3 *word3Object = [[self.wordList3 objectsWhere:@"word != %@ AND word != %@",word,testObject.testWord3] firstObject];
    return word3Object.word;
    
}




-(NSString*)getLibraryNameForWord:(NSString*)word
{

    if ([wordLibrary1 objectsWhere:@"word == %@",word].count > 0)
    {
        return @"wordLibrary1";
    }
    
    else if ([wordLibrary2 objectsWhere:@"word == %@",word].count > 0)
    {
        return @"wordLibrary2";
    }
    
    else if ([wordLibrary3 objectsWhere:@"word == %@",word].count > 0)
    {
        return @"wordLibrary2";
    }
    
   return @"Not Found";
}


#pragma mark Shuffle Answer Options Method

-(NSMutableArray*)shuffleOptions:(NSMutableArray*)option
{
    for (int x = 0; x < [option count]; x++)
    {
        int randInt = (arc4random() % ([option count] - x)) + x;
        [option exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }

    [self.tableView reloadData];
    return option;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"test1Result"]) {
        
        Test1ResultViewController *destinationView = segue.destinationViewController;
        destinationView.currentTestIndex = self.currentTestIndex;
        
    }
    
}



#pragma mark Table View Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return answerOption.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Test1ActivityViewCustomCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.wordLabel.text = [answerOption objectAtIndex:indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSString* wordSelected = [answerOption objectAtIndex:indexPath.row];
    
    
    RLMRealm *realm = RLMRealm.defaultRealm;
    
    [realm transactionWithBlock:^{
        
        testObject.testAttempts = [NSString stringWithFormat:@"%d",[testObject.testAttempts intValue]+1];
        
    }];
    

    if ([testObject.testWord1 isEqualToString:wordSelected] || [testObject.testWord2 isEqualToString:wordSelected] || [testObject.testWord3 isEqualToString:wordSelected])
    {
        NSLog(@"Score: 1");
        [answerOption removeObject:wordSelected];
        
        if ([[self getLibraryNameForWord:wordSelected] isEqualToString:@"wordLibrary1"])
        {
            [answerOption addObject:[self getRandomReplacementWordFromList1ForWord:wordSelected]];
        }
        
        else if ([[self getLibraryNameForWord:wordSelected] isEqualToString:@"wordLibrary2"])
        {
            [answerOption addObject:[self getRandomReplacementWordFromList2ForWord:wordSelected]];
        }
        
        else if ([[self getLibraryNameForWord:wordSelected] isEqualToString:@"wordLibrary3"])
        {
            [answerOption addObject:[self getRandomReplacementWordFromList3ForWord:wordSelected]];
        }
        
        [self shuffleOptions:answerOption];
        
        RLMRealm *realm = RLMRealm.defaultRealm;
        
        [realm transactionWithBlock:^{
            
            testObject.testResult = [NSString stringWithFormat:@"%d",[testObject.testResult intValue]+1];
            
        }];
        
    }
    
    else
    {
        NSLog(@"Wrong Answer");
        [self shuffleOptions:answerOption];
    }
    
    if ([testObject.testAttempts intValue] == 5 || [testObject.testResult intValue] == 3)
    {
        [self performSegueWithIdentifier:@"test1Result" sender:self];
    }
    
}

@end
