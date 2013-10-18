//
//  KCItem+Network.h
//  FuzzExample
//
//  Created by Yee Peng Chia on 10/17/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "KCItem.h"

@interface KCItem (Network)

+ (void)remoteItemsOnSuccess:(void (^)(NSArray *items))successBlock
                   onFailure:(void (^)(NSError *error))failureBlock;

@end
