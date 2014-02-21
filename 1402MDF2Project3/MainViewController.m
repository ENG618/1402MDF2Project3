//
//  MainViewController.m
//  1402MDF2Project3
//
//  Created by Eric Garcia on 2/18/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize imageInfo, videoInfo;

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

# pragma mark - Buttons

- (IBAction)photoButton:(id)sender
{
    //Instanciate picker controll
    UIImagePickerController *capturePicker = [[UIImagePickerController alloc] init];
    if (capturePicker != nil) {
        //Set type of control
        capturePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //Set delagate
        capturePicker.delegate = self;
        //Set editing
        capturePicker.allowsEditing = YES;
        //Show camera
        [self presentViewController:capturePicker animated:YES completion:nil];
    }
    
}

- (IBAction)videoButton:(id)sender
{
    UIImagePickerController *videoPicker = [[UIImagePickerController alloc]init];
    if (videoPicker != nil) {
        videoPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        videoPicker.delegate = self;
        videoPicker.allowsEditing = NO;
        videoPicker.videoQuality = UIImagePickerControllerQualityTypeHigh;
        videoPicker.mediaTypes = [NSArray arrayWithObjects:(NSString *) kUTTypeMovie, nil];
        
        [self presentViewController:videoPicker animated:YES completion:nil];
    }
}

- (IBAction)albumButton:(id)sender
{
    UIImagePickerController *albumPicker = [[UIImagePickerController alloc] init];
    if (albumPicker != nil) {
        albumPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        albumPicker.delegate = self;
        albumPicker.allowsEditing = YES;
        
        [self presentViewController:albumPicker animated:YES completion:nil];
    }
}

#pragma mark - Picker Controll

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqual: @"public.image"]) {
        imageInfo = info;
        //Dismess pickerView
        [picker dismissViewControllerAnimated:YES completion:^(void){
            //Once
            [self performSegueWithIdentifier:@"imageSegue" sender:self];
        }];
        
        
    }else if ([[info objectForKey:UIImagePickerControllerMediaType]  isEqual: @"public.movie"]){
        //Obtain url for video
        NSURL *urlString = [info valueForKey:UIImagePickerControllerMediaURL];
        if (urlString) {
            //Convert video url to a path
            NSString *videoPath = [urlString path];
            NSLog(@"%@", videoPath);
            
            [picker dismissViewControllerAnimated:YES completion:^(void){
                //ImageViewController *ivc = [[ImageViewController alloc] init];
                //[self presentViewController:ivc animated:YES completion:nil];
            }];
        }
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"Image has been selected...Image info: %@ ... Description: %@", info, [info description]);
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual: @"imageSegue"]) {
        
        ImageViewController *ivc = [segue destinationViewController];
        ivc.imageInfo = self.imageInfo;
    }else if ([segue.identifier isEqual:@"videoSegue"]){
        VideoViewController *vvc = [segue destinationViewController];
        vvc.videoInfo = self.videoInfo;
    }
}

@end
