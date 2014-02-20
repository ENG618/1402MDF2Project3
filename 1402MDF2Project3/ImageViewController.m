//
//  ImageViewController.m
//  1402MDF2Project3
//
//  Created by Eric Garcia on 2/18/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *originalImage;
@property (strong, nonatomic) IBOutlet UIImageView *scaledImage;

@end

@implementation ImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Buttons

- (IBAction)cancelButton:(id)sender {
}

- (IBAction)saveButton:(id)sender {
}

@end
