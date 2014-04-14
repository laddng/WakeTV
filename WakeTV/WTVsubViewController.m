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
    
    _cat.text = _channelInfo[0];
    _hd.text = _channelInfo[1];
    _channel.text = _channelInfo[2];
    
   // NSMutableAttributedString * text = [NSString stringWithFormat:@"%@\n%@",
    //_desc.attributedText = text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
