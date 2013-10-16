//
//  KCModel.m
//  FuzzExample
//
//  Created by Yee Peng Chia on 10/15/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "KCModel.h"

@implementation KCModel

+ (KCModel *)sharedModel
{
    static KCModel *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[KCModel alloc] init];
    });
    
    return _sharedInstance;
}

- (void)loadDataOnSuccess:(void (^)(NSArray *items))successBlock
                onFailure:(void (^)(NSError *error))failureBlock
{
    
}

- (NSArray *)textItems
{
    return nil;
}

- (NSArray *)imageItems
{
    return nil;
}

@end
