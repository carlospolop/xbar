//
//  PluginTest.m
//  BitBar
//
//  Created by Mat Ryer on 11/12/13.
//  Copyright (c) 2013 Bit Bar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Plugin.h"
#import "PluginManager.h"

@interface PluginTest : XCTestCase

@end

@implementation PluginTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testStatusItem {
  
  PluginManager *manager = [[PluginManager alloc] initWithPluginPath:@"~/Work/bitbar/BitBar/BitBarTests/TestPlugins"];
  Plugin *p = [[Plugin alloc] initWithManager:manager];
  NSStatusItem *item = p.statusItem;
  XCTAssertNotNil(item, @"item nil?");
  XCTAssertEqual((CGFloat)NSVariableStatusItemLength, item.length, @"length == NSVariableStatusItemLength");
  
}

- (void)testExample
{

  Plugin *p = [[Plugin alloc]init];
  
  p.name = @"name.10s.sh";
  p.refreshIntervalSeconds = nil;
  XCTAssertEqual((double)10, [p.refreshIntervalSeconds doubleValue], @"10s");
  
  p.name = @"name.10m.sh";
  p.refreshIntervalSeconds = nil;
  XCTAssertEqual((double)(10*60), [p.refreshIntervalSeconds doubleValue], @"10m");
  
  p.name = @"name.10h.sh";
  p.refreshIntervalSeconds = nil;
  XCTAssertEqual((double)(10*60*60), [p.refreshIntervalSeconds doubleValue], @"10h");
  
  p.name = @"name.10d.sh";
  p.refreshIntervalSeconds = nil;
  XCTAssertEqual((double)(10*60*60*24), [p.refreshIntervalSeconds doubleValue], @"10d");
  
  p.name = @"name.10S.sh";
  p.refreshIntervalSeconds = nil;
  XCTAssertEqual((double)10, [p.refreshIntervalSeconds doubleValue], @"10S");
  
  p.name = @"name.10M.sh";
  p.refreshIntervalSeconds = nil;
  XCTAssertEqual((double)(10*60), [p.refreshIntervalSeconds doubleValue], @"10M");
  
  p.name = @"name.10H.sh";
  p.refreshIntervalSeconds = nil;
  XCTAssertEqual((double)(10*60*60), [p.refreshIntervalSeconds doubleValue], @"10H");
  
  p.name = @"name.10D.sh";
  p.refreshIntervalSeconds = nil;
  XCTAssertEqual((double)(10*60*60*24), [p.refreshIntervalSeconds doubleValue], @"10D");
  
  // and some failures
  
  p.name = @"name.10.sh";
  p.refreshIntervalSeconds = nil;
  XCTAssertEqual((double)(60), [p.refreshIntervalSeconds doubleValue], @"10");
  
  p.name = @"name.sh";
  p.refreshIntervalSeconds = nil;
  XCTAssertEqual((double)(60), [p.refreshIntervalSeconds doubleValue], @"name.sh");
 
  p.name = @"name.bollocks.sh";
  p.refreshIntervalSeconds = nil;
  XCTAssertEqual((double)(60), [p.refreshIntervalSeconds doubleValue], @"name.sh");
  
}

@end