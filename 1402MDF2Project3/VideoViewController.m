//
//  VideoViewController.m
//  1402MDF2Project3
//
//  Created by Eric Garcia on 2/21/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController
@synthesize videoInfo;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear, and vidio info is: %@", [videoInfo description]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil) {
        NSLog(@"There was an error saving the file. Error: %@", error);
    }else{
        [self dismissViewControllerAnimated:YES completion:^(void){
            [self dismessSavingAlert];
            //Create alert to tell video was saved successfully
            UIAlertView *saveAlert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your video was saved successfully" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Okay", nil];
            [saveAlert show];
        }];
    }
}

- (void)showSavingAlert
{
    saving = [[UIAlertView alloc] initWithTitle:@"Saving"
                                                     message:@"Please wait while we save your video"
                                                    delegate:self
                                           cancelButtonTitle:nil
                                           otherButtonTitles:nil, nil];
    [saving show];
}

- (void)dismessSavingAlert
{
    [saving dismissWithClickedButtonIndex:0 animated:YES];
}

# pragma mark - Buttons

- (IBAction)cancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButton:(id)sender
{
    [self showSavingAlert];
    NSURL *urlString = [videoInfo valueForKey:UIImagePickerControllerMediaURL];
    if (urlString != nil) {
        NSString *videoPath = [urlString path];
        NSLog(@"The url path is: %@", videoPath);
        //Save video
        UISaveVideoAtPathToSavedPhotosAlbum(videoPath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    }
}

@end
