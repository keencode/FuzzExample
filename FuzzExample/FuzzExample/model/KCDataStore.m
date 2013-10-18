//
//  KCDataStore.m
//  FuzzExample
//
//  Created by Yee Peng Chia on 10/15/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "KCDataStore.h"

@implementation KCDataStore

+ (KCDataStore *)sharedInstance
{
    static KCDataStore *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[KCDataStore alloc] init];
    });
    
    return _sharedInstance;
}

- (NSArray *)textItems
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"type == %@", @"text"];
    NSArray *filteredItems = [self.allItems filteredArrayUsingPredicate:predicate];
    return filteredItems;
}

- (NSArray *)imageItems
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"type == %@", @"image"];
    NSArray *filteredItems = [self.allItems filteredArrayUsingPredicate:predicate];
    return filteredItems;
}

@end
