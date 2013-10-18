//
//  KCItem+Network.m
//  FuzzExample
//
//  Created by Yee Peng Chia on 10/17/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "KCItem+Network.h"
#import "AFHTTPRequestOperation.h"
#import "KCItemResponseSerializer.h"
#import "KCDataStore.h"

@implementation KCItem (Network)

+ (void)remoteItemsOnSuccess:(void (^)(NSArray *items))successBlock
                   onFailure:(void (^)(NSError *error))failureBlock
{
    NSURL *requestURL = [NSURL URLWithString:@"http://dev.fuzzproductions.com/MobileTest/test.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [KCItemResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *items = (NSArray *)responseObject;
        [[KCDataStore sharedInstance] setAllItems:items];
        successBlock(items);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         failureBlock(error);
    }];
    
    [operation start];
}

@end
