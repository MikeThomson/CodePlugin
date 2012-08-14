//
//  WindowController.h
//  AdiumCodePlugin
//
//  Created by sparemaclappy on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WindowController : NSWindowController {
    NSScrollView *scrollView;
}

@property (unsafe_unretained) IBOutlet NSTextView *codeText;
@property (assign) IBOutlet NSScrollView *scrollView;
- (void) setMyCodeText:(NSString *)newText;
@end
