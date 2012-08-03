//
//  WindowController.h
//  AdiumCodePlugin
//
//  Created by sparemaclappy on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WindowController : NSWindowController
@property (unsafe_unretained) IBOutlet NSTextView *codeText;
- (NSString *) getTestString;
- (void) setMyCodeText:(NSString *)newText;
@end
