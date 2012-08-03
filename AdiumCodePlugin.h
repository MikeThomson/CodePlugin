//
//  AdiumCodePlugin.h
//  AdiumCodePlugin
//
//  Created by Mike Thomson on 8/2/12.
//  Copyright (c) 2012 Mike Thomson. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <Adium/AIPlugin.h>
#import <Adium/AISharedAdium.h>
#import <Adium/AIContentControllerProtocol.h>

@protocol AIContentFilter;

@interface AdiumCodePlugin : AIPlugin <AIContentFilter> {}

@end
