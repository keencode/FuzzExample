//
//  Item.m
//  FuzzExample
//
//  Created by Yee Peng Chia on 10/15/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "KCItem.h"

@implementation KCItem

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.uid = [dictionary objectForKey:@"id"];
        self.type = [dictionary objectForKey:@"type"];
        self.data = [dictionary objectForKey:@"data"];
    }
    
    return self;
}

@end
