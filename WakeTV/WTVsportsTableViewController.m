//
//  WTVsportsTableViewController.m
//  WakeTV
//
//  Created by Nick Ladd on 4/14/14.
//
//

#import "WTVsportsTableViewController.h"

#import "WTVChannel.h"
#import "WTVsubViewController.h"
@interface WTVsportsTableViewController ()
@property NSMutableArray *channelguide;


@end

@implementation WTVsportsTableViewController

- (void)loadInitialData {
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"channels"
                                                     ofType:@"txt"];
    NSString* fileContents = [NSString stringWithContentsOfFile:path
                                                       encoding:NSUTF8StringEncoding
                                                          error:NULL];
    NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];
    
    for (int i=0; i<[lines count]; i++) {
        NSArray *lineItem = [lines[i] componentsSeparatedByString:@","];
        WTVChannel *item = [[WTVChannel alloc] init];
        if([[lineItem objectAtIndex:0] isEqual: @"1"]){
            item.category = [lineItem objectAtIndex:0];
            item.channelName = [lineItem objectAtIndex:1];
            item.channel = [lineItem objectAtIndex:2];
            item.HD = [lineItem objectAtIndex:3];
            item.description = [lineItem objectAtIndex:4];
            [self.channelguide addObject:item];
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

#pragma mark - Table view data source

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
    cell.textLabel.text = [channelItem.channel stringByAppendingString:channelItem.channelName];
    
    return cell;
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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
