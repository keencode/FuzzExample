//
//  FuzzExampleTests.m
//  FuzzExampleTests
//
//  Created by Yee Peng Chia on 10/15/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KCItemResponseSerializer.h"
#import "FixtureHelper.h"
#import "KCItem.h"

@interface ItemSerializerTests : XCTestCase
{
    NSArray *responseJSON;
    KCItemResponseSerializer *responseSerializer;
}

@end

@implementation ItemSerializerTests

- (void)setUp
{
    [super setUp];
    
    FixtureHelper *fixtureHelper = [[FixtureHelper alloc] init];
    NSData *data = [fixtureHelper validDataFromFixture];
    responseJSON = [NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingMutableLeaves
                                                     error:nil];
    
    responseSerializer = [KCItemResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableLeaves];
}

- (void)tearDown
{
    responseJSON = nil;
    responseSerializer = nil;

    [super tearDown];
}

#pragma mark - itemsFromResponse

- (void)testItemsFromResponseShouldReturnNonNilObject
{
    id items = [responseSerializer parseItemsJSON:responseJSON];
    
    XCTAssertNotNil(items, @"items should NOT be nil");
}

- (void)testItemsFromResponseShouldReturnAnArray
{
    id items = [responseSerializer parseItemsJSON:responseJSON];
    
    XCTAssertTrue([items isKindOfClass:[NSArray class]], @"items should be an NSArray");
}

- (void)testItemsFromResponseShouldReturnTheCorrectCount
{
    NSUInteger expectedItemsCount = [responseJSON count];
    
    NSArray *items = [responseSerializer parseItemsJSON:responseJSON];
    
    XCTAssertEqual([items count], expectedItemsCount, @"items count should equal expectedItemsCount");
}

#pragma mark - updateItemWithJSON

- (void)testUpdateItemWithJSONShouldAssignCorrectUID
{
    NSDictionary *itemInfo = [responseJSON objectAtIndex:0];
    NSString *expectedUID = [itemInfo objectForKey:@"id"];
    
    KCItem *item = [[KCItem alloc] init];
    [responseSerializer updateItem:item withJSON:itemInfo];
    
    XCTAssertEqualObjects(item.uid, expectedUID, @"item.uid should match expectedUID");
}

- (void)testUpdateItemWithJSONShouldAssignCorrectType
{
    NSDictionary *itemInfo = [responseJSON objectAtIndex:0];
    NSString *expectedType = [itemInfo objectForKey:@"type"];
    
    KCItem *item = [[KCItem alloc] init];
    [responseSerializer updateItem:item withJSON:itemInfo];
    
    XCTAssertEqualObjects(item.type, expectedType, @"item.type should match expectedType");
}

- (void)testUpdateItemWithJSONShouldAssignCorrectData
{
    NSDictionary *itemInfo = [responseJSON objectAtIndex:0];
    NSString *expectedData = [itemInfo objectForKey:@"data"];
    
    KCItem *item = [[KCItem alloc] init];
    [responseSerializer updateItem:item withJSON:itemInfo];
    
    XCTAssertEqualObjects(item.data, expectedData, @"item.data should match expectedData");
}

@end
