//
//  Created by Mike Thomson on 09/11/08.
//  Copyright 2012 Mike Thomson. All rights reserved.
//

#import "AdiumCodePlugin.h"
#import "WindowController.h"



@implementation AdiumCodePlugin

NSMutableArray * windowArray;

- (void)installPlugin
{	
	NSLog(@"CodePlugin installed");
    windowArray = [NSMutableArray alloc];
	// Changes actual message and non-message content
	[[adium contentController] registerContentFilter:self ofType:AIFilterContent direction:AIFilterOutgoing];
	[[adium contentController] registerContentFilter:self ofType:AIFilterContent direction:AIFilterIncoming];
}

- (void)uninstallPlugin
{
	NSLog(@"CodePlugin uninstalled");
    
	[[adium contentController] unregisterContentFilter:self];
}


- (NSAttributedString *)filterAttributedString:(NSAttributedString *)inAttributedString context:(id)context
{
	NSMutableAttributedString *newMessage = [[NSMutableAttributedString alloc] initWithAttributedString:inAttributedString];
    
    // Detect the %CODE marker
    NSString *temp = [newMessage string] ;
    if ([temp hasPrefix:@"%CODE "]) {
        
        WindowController * pop;
        pop = [[WindowController alloc] initWithWindowNibName:@"WindowController"];
        temp = [temp substringFromIndex:6];
        [pop showWindow:self];
        [pop setMyCodeText:temp];
        [windowArray addObject:pop];
        [temp release];
        return [[NSAttributedString alloc] initWithString:@"Replaced by CodePlugin"] ;
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