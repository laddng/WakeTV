//
//  WTVentertainmentViewController.m
//  WakeTV
//
//  Created by Nick Ladd on 4/15/14.
//
//

#import "WTVentertainmentViewController.h"
#import "WTVChannel.h"
#import "WTVsubViewController.h"

@interface WTVentertainmentViewController ()

@property NSMutableArray *channelguide;

@end

@implementation WTVentertainmentViewController

- (void)loadInitialData {
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"channels"
                                                     ofType:@"txt"];
    NSString* fileContents = [NSString stringWithContentsOfFile:path
                                                       encoding:NSUTF8StringEncoding
                                                          error:NULL];
    NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];
    
    for (int i=0; i<[lines count]; i++) {
        NSArray *lineItem = [lines[i] componentsSeparatedByString:@"|"];
        
        // If this channel belongs in the sports category, add it
        if ([[lineItem objectAtIndex:0] isEqualToString:@"1"]) {
            WTVChannel *item = [[WTVChannel alloc] init];
            item.category = [lineItem objectAtIndex:0];
            item.channelName = [lineItem objectAtIndex:1];
            item.channel = [lineItem objectAtIndex:2];
            item.HD = [lineItem objectAtIndex:3];
            item.description = [lineItem objectAtIndex:4];
            [self.channelguide addObject:item];
        }
        
    }
}

@end
