//
//  RealmObjectClass.m
//  iPhronesis
//
//  Created by Dhiraj Jadhao on 08/01/16.
//  Copyright © 2016 Optra Systems. All rights reserved.
//

#import "RealmObjectClass.h"


@implementation wordLibrary1

+ (NSString *)primaryKey
{
    return @"index";
}

@end




@implementation wordLibrary2

+ (NSString *)primaryKey
{
    return @"index";
}

@end



@implementation wordLibrary3

+ (NSString *)primaryKey
{
    return @"index";
}


@end


@implementation Test

+ (NSString *)primaryKey
{
    return @"testIndex";
}

@end


@implementation Test4

+ (NSString *)primaryKey
{
    return @"testIndex";
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"testQ1Result":@"0",@"testQ2Result":@"0",@"testQ3Result":@"0",@"testQ4Result":@"0",@"testQ5Result":@"0",@"testQ6Result":@"0",@"testQ7Result":@"0",@"testQ8Result":@"0",@"testQ9Result":@"0",@"testQ10Result":@"0",@"testTotalResult":@"0"};
}

@end
