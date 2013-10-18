//
//  DataStoreTests.m
//  FuzzExample
//
//  Created by Yee Peng Chia on 10/17/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KCDataStore.h"
#import "FixtureHelper.h"
#import "KCItemResponseSerializer.h"

@interface DataStoreTests : XCTestCase
{
    NSArray *responseJSON;
    KCItemResponseSerializer *responseSerializer;
    KCDataStore *dataStore;
}

@end

@implementation DataStoreTests

- (void)setUp
{
    [super setUp];
    
    FixtureHelper *fixtureHelper = [[FixtureHelper alloc] init];
    NSData *data = [fixtureHelper validDataFromFixture];
    responseJSON = [NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingMutableLeaves
                                                     error:nil];
    
    responseSerializer = [KCItemResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableLeaves];
    
    dataStore = [KCDataStore sharedInstance];
}

- (void)tearDown
{
    responseJSON = nil;
    responseSerializer = nil;
    
    [super tearDown];
}

#pragma mark - textItems

- (void)testTextItemsShouldReturnANonNilObject
{
    dataStore.allItems = [responseSerializer parseItemsJSON:responseJSON];
    
    id textItems = [dataStore textItems];

    XCTAssertNotNil(textItems, @"textItems should NOT be nil");
}

- (void)testTextItemsShouldReturnAnArray
{
    dataStore.allItems = [responseSerializer parseItemsJSON:responseJSON];
    
    id textItems = [dataStore textItems];
    
    XCTAssertTrue([textItems isKindOfClass:[NSArray class]], @"textItems should be an NSArray");
}

- (void)testTextItemsShouldMatchTheExpectedArray
{
    dataStore.allItems = [responseSerializer parseItemsJSON:responseJSON];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"type == %@", @"text"];
    NSArray *expectedTextItems = [dataStore.allItems filteredArrayUsingPredicate:predicate];
    
    NSArray *textItems = [dataStore textItems];
    
    XCTAssertEqualObjects(textItems, expectedTextItems, @"textItems should be the same as expectedTextItems");
}

- (void)testTextItemsShouldReturnItemsOfTypeText
{
    dataStore.allItems = [responseSerializer parseItemsJSON:responseJSON];

    NSArray *textItems = [dataStore textItems];
    KCItem *firstItem = [textItems objectAtIndex:0];
    
    XCTAssertEqualObjects(firstItem.type, @"text", @"firstItem should be of type text");
}

#pragma mark - imageItems

- (void)testImageItemsShouldReturnANonNilObject
{
    dataStore.allItems = [responseSerializer parseItemsJSON:responseJSON];
    
    id imageItems = [dataStore imageItems];
    
    XCTAssertNotNil(imageItems, @"imageItems should NOT be nil");
}

- (void)testImageItemsShouldReturnAnArray
{
    dataStore.allItems = [responseSerializer parseItemsJSON:responseJSON];
    
    id imageItems = [dataStore imageItems];
    
    XCTAssertTrue([imageItems isKindOfClass:[NSArray class]], @"imageItems should be an NSArray");
}

- (void)testImageItemsShouldMatchTheExpectedArray
{
    dataStore.allItems = [responseSerializer parseItemsJSON:responseJSON];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"type == %@", @"image"];
    NSArray *expectedImageItems = [dataStore.allItems filteredArrayUsingPredicate:predicate];
    
    NSArray *imageItems = [dataStore imageItems];
    
    XCTAssertEqualObjects(imageItems, expectedImageItems, @"imageItems should be the same as expectedImageItems");
}

- (void)testImageItemsShouldReturnItemsOfTypeText
{
    dataStore.allItems = [responseSerializer parseItemsJSON:responseJSON];
    
    NSArray *imageItems = [dataStore imageItems];
    KCItem *firstItem = [imageItems objectAtIndex:0];
    
    XCTAssertEqualObjects(firstItem.type, @"image", @"firstItem should be of type image");
}

@end
