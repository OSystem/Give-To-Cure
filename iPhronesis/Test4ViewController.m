//
//  Test4ViewController.m
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 09/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import "Test4ViewController.h"
#import "RealmObjectClass.h"
#import "Test4ResultViewController.h"

@interface Test4ViewController ()<UIScrollViewDelegate>
{
    NSMutableArray *questionArray;
    NSString *currentTestIndex;
}
@end

@implementation Test4ViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.pageControl.currentPage = 0;
    CGPoint scrollPoint = CGPointMake(0, 0);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    // Do any additional setup after loading the view.
    questionArray = [[NSMutableArray alloc] init];
    
    [questionArray addObject:@"1. Writing checks, paying bills, balancing checkbook"];
    [questionArray addObject:@"2. Assembling tax records, business affairs, or papers"];
    [questionArray addObject:@"3. Shopping alone for clothes, household necessities, or groceries"];
    [questionArray addObject:@"4. Playing a game of skill, working on a hobby"];
    [questionArray addObject:@"5. Heating water, making a cup of coffee, turning off stove after use"];
    [questionArray addObject:@"6. Preparing a balanced meal"];
    [questionArray addObject:@"7. Keeping track of current events"];
    [questionArray addObject:@"8. Paying attention to, understanding, discussing TV, book, magazine"];
    [questionArray addObject:@"9. Remembering appointments, family occasions, holidays,medications"];
    [questionArray addObject:@"10. Traveling out of neighborhood, driving, arranging to take buses"];

    
    RLMRealm *realm = RLMRealm.defaultRealm;
    
    [realm transactionWithBlock:^{
        
        Test4 *testObject = [[Test4 alloc] init];
        Test4 *tempTestObject = [[[Test4 allObjects] sortedResultsUsingProperty:@"testIndex" ascending:YES] lastObject];
        currentTestIndex = [NSString stringWithFormat:@"%d",[tempTestObject.testIndex intValue]+1];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-MMM-yyyy hh:mm a"];
        NSString *updateString = [dateFormatter stringFromDate:[NSDate date]];
        
        testObject.testIndex = currentTestIndex;
        testObject.testDate = [dateFormatter dateFromString:updateString];
        
        [realm addOrUpdateObject:testObject];
        
        
    }];
    
    [self prepareTest4Session];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"test4Result"])
    {
        Test4ResultViewController *destinationView = segue.destinationViewController;
        destinationView.currentTestIndex = currentTestIndex;
    }
}


#pragma  mark Test 4 Session Methods


- (void)prepareTest4Session
{
   
    
    self.actionButton.titleLabel.text = @"Next";
    [self.actionButton addTarget:self action:@selector(showNextQuestion) forControlEvents:UIControlEventTouchUpInside];
    

    if (self.pageControl.currentPage > 8)
    {
        [self.actionButton setTitle:@"Finish" forState:UIControlStateNormal];
    }
    else
    {
        self.actionButton.titleLabel.text = @"Next";
    }
    self.actionButton.layer.cornerRadius = 8.0;
    self.actionButton.clipsToBounds =YES;
    
    self.pageControl.numberOfPages = 10;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.clipsToBounds = NO;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.bounds.size.width*self.pageControl.numberOfPages, self.scrollView.bounds.size.height)];

    
    UILabel *questionLabel;
    
    
    for (int i=0; i<[questionArray count]; i++)
    {
        questionLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.scrollView.bounds.size.width*i)+15, 0, self.scrollView.bounds.size.width-30, self.scrollView.bounds.size.height)];
        [questionLabel setText:[questionArray objectAtIndex:i]];
        [questionLabel setTextColor:[UIColor whiteColor]];
        [questionLabel setTextAlignment:NSTextAlignmentCenter];
        [questionLabel setNumberOfLines:0];
        [questionLabel setBackgroundColor:[UIColor colorWithRed:247/255.0 green:147/255.0 blue:30/255.0 alpha:1.0]];
        [questionLabel.layer setCornerRadius:20.0];
        [questionLabel.layer setMasksToBounds:YES];
        [questionLabel setFont:[UIFont fontWithName:@"Avenir" size:20.0]];
        
        [self.scrollView addSubview:questionLabel];
    }
    
    
}

-(void)finishTest4Session
{
    [self performSegueWithIdentifier:@"test4Result" sender:self];
}


#pragma mark - Scroll View Methods



-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    self.ratingSegmentControl.selectedSegmentIndex = 0;

    if (self.pageControl.currentPage > 8)
    {
        [self.actionButton setTitle:@"Finish" forState:UIControlStateNormal];
        [self.actionButton addTarget:self action:@selector(finishTest4Session) forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        self.actionButton.titleLabel.text = @"Next";
        [self.actionButton addTarget:self action:@selector(ratingSegmentControlValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    }

 
    [self setResultForCurrentQuestion];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    self.pageControl.currentPage = roundf(pageFraction);

    
    if (self.pageControl.currentPage > 8)
    {
        [self.actionButton setTitle:@"Finish" forState:UIControlStateNormal];
        [self.actionButton addTarget:self action:@selector(finishTest4Session) forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        self.actionButton.titleLabel.text = @"Next";
        [self.actionButton addTarget:self action:@selector(ratingSegmentControlValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    NSLog(@"Page1: %ld",(long)self.pageControl.currentPage);

}

-(void)showNextQuestion{
    
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    
    self.pageControl.currentPage = roundf(pageFraction);
    if (pageFraction == self.pageControl.numberOfPages-1)
    {
        //[self.scrollView setContentOffset:CGPointMake(0,0) animated:YES];
        
    }
    else
    {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.bounds.size.width*(pageFraction+1), 0) animated:YES];
    }
    

    
}

#pragma mark - SegmentControl

- (IBAction)ratingSegmentControlValueChanged:(id)sender
{

    [self setResultForCurrentQuestion];
    //[self showNextQuestion];
    
}

-(void)setResultForCurrentQuestion
{
    
    RLMRealm *realm = RLMRealm.defaultRealm;
    
    [realm transactionWithBlock:^{
        
        Test4 *testObject = [Test4 objectForPrimaryKey:currentTestIndex];
        
        if (self.pageControl.currentPage+1 == 1)
        {
            testObject.testQ1Result = [NSString stringWithFormat:@"%ld",(long)self.ratingSegmentControl.selectedSegmentIndex];
        }
        
        else if (self.pageControl.currentPage+1 == 2)
        {
            testObject.testQ2Result = [NSString stringWithFormat:@"%ld",(long)self.ratingSegmentControl.selectedSegmentIndex];
        }
        
        else if (self.pageControl.currentPage+1 == 3)
        {
            testObject.testQ3Result = [NSString stringWithFormat:@"%ld",(long)self.ratingSegmentControl.selectedSegmentIndex];
        }
        
        else if (self.pageControl.currentPage+1 == 4)
        {
            testObject.testQ4Result = [NSString stringWithFormat:@"%ld",(long)self.ratingSegmentControl.selectedSegmentIndex];
        }
        
        else if (self.pageControl.currentPage+1 == 5)
        {
            testObject.testQ5Result = [NSString stringWithFormat:@"%ld",(long)self.ratingSegmentControl.selectedSegmentIndex];
        }
        
        else if (self.pageControl.currentPage+1 == 6)
        {
            testObject.testQ6Result = [NSString stringWithFormat:@"%ld",(long)self.ratingSegmentControl.selectedSegmentIndex];
        }
        
        else if (self.pageControl.currentPage+1 == 7)
        {
            testObject.testQ7Result = [NSString stringWithFormat:@"%ld",(long)self.ratingSegmentControl.selectedSegmentIndex];
        }
        
        else if (self.pageControl.currentPage+1 == 8)
        {
            testObject.testQ8Result = [NSString stringWithFormat:@"%ld",(long)self.ratingSegmentControl.selectedSegmentIndex];
        }
        
        else if (self.pageControl.currentPage+1 == 9)
        {
            testObject.testQ9Result = [NSString stringWithFormat:@"%ld",(long)self.ratingSegmentControl.selectedSegmentIndex];
        }
        
        else if (self.pageControl.currentPage+1 == 10)
        {
            testObject.testQ10Result = [NSString stringWithFormat:@"%ld",(long)self.ratingSegmentControl.selectedSegmentIndex];
        }
        
        
        testObject.testTotalResult = [NSString stringWithFormat:@"%d",[testObject.testQ1Result intValue] + [testObject.testQ2Result intValue] + [testObject.testQ3Result intValue] + [testObject.testQ4Result intValue] + [testObject.testQ5Result intValue] + [testObject.testQ6Result intValue] + [testObject.testQ7Result intValue] + [testObject.testQ8Result intValue] + [testObject.testQ9Result intValue] + [testObject.testQ10Result intValue]];
        
        [realm addOrUpdateObject:testObject];
        
        
        
    }];
}


@end
