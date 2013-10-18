//
//  KCPropertyResponseSerializer.m
//  TabletExample
//
//  Created by Yee Peng Chia on 10/16/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "KCItemResponseSerializer.h"

@implementation KCItemResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error
{
    NSArray *json = [super responseObjectForResponse:response data:data error:error];
    NSArray *items = [self parseItemsJSON:json];
    return items;
}

- (NSArray *)parseItemsJSON:(NSArray *)json;
{
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:[json count]];
    
    for (NSDictionary *itemInfo in json) {
        KCItem *item = [[KCItem alloc] init];
        [self updateItem:item withJSON:itemInfo];
        [items addObject:item];
    }
    
    return [NSArray arrayWithArray:items];
}

- (void)updateItem:(KCItem *)item withJSON:(NSDictionary *)json
{
    item.uid = [json objectForKey:@"id"];
    item.type = [json objectForKey:@"type"];
    item.data = [json objectForKey:@"data"];
}

@end
