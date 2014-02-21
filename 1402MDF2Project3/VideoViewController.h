//
//  VideoViewController.h
//  1402MDF2Project3
//
//  Created by Eric Garcia on 2/21/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewController : UIViewController
{
    UIAlertView *saving;
    MPMoviePlayerController *player;
}

@property (nonatomic) NSDictionary *videoInfo;

@end
