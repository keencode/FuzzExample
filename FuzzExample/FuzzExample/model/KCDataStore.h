//
//  KCDataStore.h
//  FuzzExample
//
//  Created by Yee Peng Chia on 10/15/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCDataStore : NSObject

@property (nonatomic, strong) NSArray *allItems;

+ (KCDataStore *)sharedInstance;

- (NSArray *)textItems;
- (NSArray *)imageItems;

@end
