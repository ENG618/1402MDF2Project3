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
@synthesize imageInfo, originalImg, scaledImg;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    originalImg = [imageInfo objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (originalImg) {
        self.originalImage.image = originalImg;
    }
    scaledImg = [imageInfo objectForKey:@"UIImagePickerControllerEditedImage"];
    if (scaledImg) {
        self.scaledImage.image = scaledImg;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)               image: (UIImage *) image
    didFinishSavingWithError: (NSError *) error
                 contextInfo: (void *) contextInfo
{
    if (error != nil) {
        NSLog(@"Error: %@", [error description]);
    }else{
        UIAlertView *saveSuccess = [[UIAlertView alloc] initWithTitle:@"Success"
                                                              message:@"Both images were saved!"
                                                             delegate:nil
                                                    cancelButtonTitle:nil
                                                    otherButtonTitles:@"Okay", nil];
        [saveSuccess show];
        NSLog(@"Save was successful");
    }
}

#pragma mark - Buttons

- (IBAction)cancelButton:(id)sender {
    //DismissViewController
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButton:(id)sender {
    //Save image to photo album
    UIImageWriteToSavedPhotosAlbum(originalImg, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    UIImageWriteToSavedPhotosAlbum(scaledImg, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

@end
