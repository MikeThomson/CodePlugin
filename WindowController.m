//
//  WindowController.m
//  AdiumCodePlugin
//
//  Created by sparemaclappy on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WindowController.h"

@interface WindowController ()

@end

@implementation WindowController
@synthesize codeText;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    NSWindow *window = [self window];
    [window setTitle:@"CodePlugin"];
}

- (void) setMyCodeText:(NSString *)newText {
    [codeText setString:newText];
}

@end
