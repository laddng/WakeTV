//
//  WTVsubViewController.h
//  WakeTV
//
//  Created by stem mobile on 4/2/14.
//
//

#import <UIKit/UIKit.h>
#import "WTVChannel.h"
#import "WTVmainViewController.h"

@interface WTVsubViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *channel;
@property (weak, nonatomic) IBOutlet UILabel *hd;
@property (weak, nonatomic) IBOutlet UILabel *cat;
@property (weak, nonatomic) IBOutlet UITextView *desc;
@property (strong, nonatomic) IBOutlet UILabel *number;


@property (strong, nonatomic) NSArray *channelInfo;

@end
