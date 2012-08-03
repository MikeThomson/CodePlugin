//
//  PlainTextPlugin.m
//  PlainTextPlugin
//
//  Created by Mike Thomson on 09/11/08.
//  Copyright 2012 Mike Thomson. All rights reserved.
//

#import "AdiumCodePlugin.h"
#import "WindowController.h"



@implementation AdiumCodePlugin

WindowController * pop;

- (void)installPlugin
{	
	NSLog(@"PlainTextPlugin installed");
    
	// Changes actual message and non-message content
	[[adium contentController] registerContentFilter:self ofType:AIFilterContent direction:AIFilterOutgoing];
	[[adium contentController] registerContentFilter:self ofType:AIFilterContent direction:AIFilterIncoming];
}

- (void)uninstallPlugin
{
	NSLog(@"PlainTextPlugin uninstalled");
    
	[[adium contentController] unregisterContentFilter:self];
}


- (NSAttributedString *)filterAttributedString:(NSAttributedString *)inAttributedString context:(id)context
{
	NSMutableAttributedString *newMessage = [[NSMutableAttributedString alloc] initWithAttributedString:inAttributedString];
    
    // Detect the %CODE marker
    NSString *temp = [newMessage string];
    if ([temp hasPrefix:@"%CODE"]) {
    
        // remove bold, italics and underline
        [newMessage applyFontTraits:NSUnboldFontMask range:NSMakeRange(0, [newMessage length])];
        [newMessage applyFontTraits:NSUnitalicFontMask range:NSMakeRange(0, [newMessage length])];
        [newMessage removeAttribute:NSUnderlineStyleAttributeName range:NSMakeRange(0, [newMessage length])];
    
        pop = [[WindowController alloc] initWithWindowNibName:@"WindowController"];
        temp = [temp stringByAppendingString:[pop getTestString]];
        [pop showWindow:self];
        [pop setMyCodeText:temp];
        
        return newMessage;
    }
    return inAttributedString;
}

- (float)filterPriority
{
	return DEFAULT_FILTER_PRIORITY;
}


- (NSString *)pluginAuthor
{
	return @"Mike Thomson";
}

- (NSString *)pluginVersion
{
	return @"0.1";
}

- (NSString *)pluginDescription
{
	return @"This plugin makes it easier to read pasted code blocks";
}

- (NSString *)pluginURL
{
	return @"http://www.bluetempest.net";
}
@end