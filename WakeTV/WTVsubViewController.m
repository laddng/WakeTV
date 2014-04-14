//
//  WTVsubViewController.m
//  WakeTV
//
//  Created by stem mobile on 4/2/14.
//
//

#import "WTVsubViewController.h"

@interface WTVsubViewController ()

@end

@implementation WTVsubViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set navigation bar title to say channel number and channel name
    self.navigationItem.title = [_channelInfo[2] stringByAppendingString:_channelInfo[3]];
    
    // Label - category
    _cat.text = _channelInfo[0];
    
    // Label - HD or no HD
    // If HD == 1
    if([_channelInfo[1] isEqual: @" 1"]){
        _hd.text = @"HD";
    }
    // Else, say no HD
    else {
        _hd.text = @"";

    }
    
    // Text View - Channel description
    _desc.text = [_desc.text stringByAppendingString:_channelInfo[4]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
