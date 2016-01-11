//
//  DefaultTableDataViewController.m
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 08/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import "DefaultTableDataViewController.h"
#import "RealmObjectClass.h"

@interface DefaultTableDataViewController ()
{
    id defaultWordLibrary1,defaultWordLibrary2,defaultWordLibrary3;
}
@end

@implementation DefaultTableDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
}


-(void)loadDefaultWordsIntoDatabase
{
    defaultWordLibrary1 = [NSJSONSerialization JSONObjectWithData:[@"[{\"id\":\"1\",\"name\":\"Lamp\"},{\"id\":\"2\",\"name\":\"Bulb\"},{\"id\":\"3\",\"name\":\"Table\"},{\"id\":\"4\",\"name\":\"Pen\"},{\"id\":\"5\",\"name\":\"Charger\"},{\"id\":\"6\",\"name\":\"Charger\"},{\"id\":\"7\",\"name\":\"Book\"},{\"id\":\"8\",\"name\":\"Mug\"},{\"id\":\"9\",\"name\":\"Glass\"},{\"id\":\"10\",\"name\":\"Diary\"}]" dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    
    
    defaultWordLibrary2 = [NSJSONSerialization JSONObjectWithData:[@"[{\"id\":\"1\",\"name\":\"Bob\"},{\"id\":\"2\",\"name\":\"Ron\"},{\"id\":\"3\",\"name\":\"Jassie\"},{\"id\":\"4\",\"name\":\"William\"},{\"id\":\"5\",\"name\":\"Josh\"},{\"id\":\"6\",\"name\":\"Jane\"},{\"id\":\"7\",\"name\":\"Ashley\"},{\"id\":\"8\",\"name\":\"Scott\"},{\"id\":\"9\",\"name\":\"Stuart\"},{\"id\":\"10\",\"name\":\"Jason\"}]" dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    
    
    defaultWordLibrary3 = [NSJSONSerialization JSONObjectWithData:[@"[{\"id\":\"1\",\"name\":\"Orange\"},{\"id\":\"2\",\"name\":\"Banana\"},{\"id\":\"3\",\"name\":\"Watermelon\"},{\"id\":\"4\",\"name\":\"Apple\"},{\"id\":\"5\",\"name\":\"Lemon\"},{\"id\":\"6\",\"name\":\"Cherry\"},{\"id\":\"7\",\"name\":\"Olive\"},{\"id\":\"8\",\"name\":\"Blackberry\"},{\"id\":\"9\",\"name\":\"Mango\"},{\"id\":\"10\",\"name\":\"Fig\"}]" dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    
    
    
    
    
    RLMRealm *realm = RLMRealm.defaultRealm;
    
    [realm transactionWithBlock:^{
        
        
        // Word Library 1
        
        for (int i=0; i<[defaultWordLibrary1 count];i++)
        {
            wordLibrary1 *wordLibrary1Object = [[wordLibrary1 alloc] init];
            
            wordLibrary1Object.index = [[defaultWordLibrary1 objectAtIndex:i] objectForKey:@"id"];
            wordLibrary1Object.word = [[defaultWordLibrary1 objectAtIndex:i] objectForKey:@"name"];
            
            [realm addOrUpdateObject:wordLibrary1Object];
        }
        
        
        
        
        
        // Word Library 2
        
        for (int i=0; i<[defaultWordLibrary2 count];i++)
        {
            wordLibrary2 *wordLibrary2Object = [[wordLibrary2 alloc] init];
            
            wordLibrary2Object.index = [[defaultWordLibrary2 objectAtIndex:i] objectForKey:@"id"];
            wordLibrary2Object.word = [[defaultWordLibrary2 objectAtIndex:i] objectForKey:@"name"];
            
            [realm addOrUpdateObject:wordLibrary2Object];
        }
        
        
        
        
        // Word Library 3
        
        for (int i=0; i<[defaultWordLibrary3 count];i++)
        {
            wordLibrary3 *wordLibrary3Object = [[wordLibrary3 alloc] init];
            
            wordLibrary3Object.index = [[defaultWordLibrary3 objectAtIndex:i] objectForKey:@"id"];
            wordLibrary3Object.word = [[defaultWordLibrary3 objectAtIndex:i] objectForKey:@"name"];
            
            [realm addOrUpdateObject:wordLibrary3Object];
        }
    
    
    
    }];

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

@end
