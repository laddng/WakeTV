//
//  WTVmainViewController.m
//  WakeTV
//
//  Created by stem mobile on 3/19/14.
//
//
//
#import "WTVmainViewController.h"
#import "WTVChannel.h"
#import "WTVsubViewController.h"

@interface WTVmainViewController ()

@property NSMutableArray *channelguide;

@end

@implementation WTVmainViewController

- (void)loadInitialData {
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"channels"
                                                     ofType:@"txt"];
    NSString* fileContents = [NSString stringWithContentsOfFile:path
                                                                           encoding:NSUTF8StringEncoding
                                                                              error:NULL];
    NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];
    
    // Categories translation
    NSArray *categories = [NSArray arrayWithObjects: @"All", @"Entertainment", @"News", @"Sports", @"Movies", @"6", @"7", @"8", @"9", @"10", nil];

    // Tab id #
    NSInteger id = self.tabBarController.tabBar.selectedItem.tag;
    NSString *tab = [NSString stringWithFormat:@"%ld", (long)id];

    // if it's the main window, load everything
    if([tab isEqualToString:@"0"]){
        for (int i=0; i<[lines count]; i++) {
            NSArray *lineItem = [lines[i] componentsSeparatedByString:@"|"];
            WTVChannel *item = [[WTVChannel alloc] init];
            item.category = [categories objectAtIndex:[[lineItem objectAtIndex:0] intValue]];
            item.channelName = [lineItem objectAtIndex:1];
            item.channel = [lineItem objectAtIndex:2];
            item.HD = [lineItem objectAtIndex:3];
            item.description = [lineItem objectAtIndex:4];
            [self.channelguide addObject:item];
        }

    }
    
    // else make selections
    else {
        for (int i=0; i<[lines count]; i++) {
           NSArray *lineItem = [lines[i] componentsSeparatedByString:@"|"];
           if ([[lineItem objectAtIndex:0] isEqualToString:tab]) {
            WTVChannel *item = [[WTVChannel alloc] init];
            item.category = [categories objectAtIndex:[[lineItem objectAtIndex:0] intValue]];
            item.channelName = [lineItem objectAtIndex:1];
            item.channel = [lineItem objectAtIndex:2];
            item.HD = [lineItem objectAtIndex:3];
            item.description = [lineItem objectAtIndex:4];
            [self.channelguide addObject:item];
           }
        }
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.channelguide = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.channelguide count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    WTVChannel *channelItem = [self.channelguide objectAtIndex:indexPath.row];
    cell.textLabel.text = [[channelItem.channel stringByAppendingString:@" "] stringByAppendingString:channelItem.channelName];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if([[segue identifier] isEqualToString:@"showChannel"]){
        
        WTVsubViewController *subViewController = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        WTVChannel *channelItem = [self.channelguide objectAtIndex:myIndexPath.row];
        
        subViewController.channelInfo = @[channelItem.category, channelItem.HD, channelItem.channel, channelItem.channelName, channelItem.description];        

    }

}

@end
