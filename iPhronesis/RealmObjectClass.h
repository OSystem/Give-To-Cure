//
//  RealmObjectClass.h
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 08/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import <Realm/Realm.h>

#pragma mark Word Library Objects

@interface wordLibrary1 : RLMObject
@property NSString *index;
@property NSString *word;
@end

RLM_ARRAY_TYPE(wordLibrary1)



@interface wordLibrary2 : RLMObject
@property NSString *index;
@property NSString *word;
@end

RLM_ARRAY_TYPE(wordLibrary2)



@interface wordLibrary3 : RLMObject
@property NSString *index;
@property NSString *word;
@end

RLM_ARRAY_TYPE(wordLibrary3)




@interface Test : RLMObject
@property NSString *testIndex;
@property NSString *testWord1;
@property NSString *testWord2;
@property NSString *testWord3;
@property NSString *testResult;
@property NSString *testAttempts;
@property NSDate * testDate;
@end

RLM_ARRAY_TYPE(Test)



@interface Test4 : RLMObject
@property NSString *testIndex;
@property NSString *testQ1Result;
@property NSString *testQ2Result;
@property NSString *testQ3Result;
@property NSString *testQ4Result;
@property NSString *testQ5Result;
@property NSString *testQ6Result;
@property NSString *testQ7Result;
@property NSString *testQ8Result;
@property NSString *testQ9Result;
@property NSString *testQ10Result;
@property NSString *testTotalResult;
@property NSDate * testDate;
@end

RLM_ARRAY_TYPE(Test4)
