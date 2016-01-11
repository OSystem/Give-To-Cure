//
//  Test4ViewController.h
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 09/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Test4ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;


@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *ratingSegmentControl;

- (IBAction)ratingSegmentControlValueChanged:(id)sender;


@end
