//
//  KCPropertyResponseSerializer.h
//  TabletExample
//
//  Created by Yee Peng Chia on 10/16/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "AFURLResponseSerialization.h"
#import "KCItem.h"

@interface KCItemResponseSerializer : AFJSONResponseSerializer

- (NSArray *)parseItemsJSON:(NSArray *)json;

- (void)updateItem:(KCItem *)item withJSON:(NSDictionary *)json;

@end
