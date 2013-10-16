//
//  KCModel.h
//  FuzzExample
//
//  Created by Yee Peng Chia on 10/15/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCModel : NSObject

@property (nonatomic, strong) NSArray *allItems;

+ (KCModel *)sharedModel;

- (void)loadDataOnSuccess:(void (^)(NSArray *items))successBlock
                onFailure:(void (^)(NSError *error))failureBlock;

- (NSArray *)textItems;
- (NSArray *)imageItems;

@end
