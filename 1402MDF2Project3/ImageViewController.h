//
//  ImageViewController.h
//  1402MDF2Project3
//
//  Created by Eric Garcia on 2/18/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

@property (nonatomic) NSDictionary *imageInfo;
@property (nonatomic) UIImage *originalImg;
@property (nonatomic) UIImage *scaledImg;

@end
