//
//  MainViewController.m
//  1402MDF2Project3
//
//  Created by Eric Garcia on 2/18/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) IBOutlet UIImageView *scaledImageView;

@end

@implementation MainViewController

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
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if (imagePicker != nil) {
        //Set type of control
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //Set delagate
        imagePicker.delegate = self;
        //Set editing
        imagePicker.allowsEditing = YES;
        //Show camera
        [self presentViewController:imagePicker animated:YES completion:^(void){
            //[self prepareForSegueWithIdentifier:@"imageSegue" sender:self];
        }];
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
    if ([[info objectForKey:UIImagePickerControllerMediaType]  isEqual: @"public.image"]) {
        //Obtain original image
        UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        if (selectedImage) {
            self.photoImageView.image = selectedImage;
        }
        //Obtain scaled image
        UIImage *scaledImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        if (scaledImage) {
            self.scaledImageView.image = scaledImage;
            
            //Save image to photo album
            UIImageWriteToSavedPhotosAlbum(scaledImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }
    }else if ([[info objectForKey:UIImagePickerControllerMediaType]  isEqual: @"public.movie"]){
        //Obtain url for video
        NSURL *urlString = [info valueForKey:UIImagePickerControllerMediaURL];
        if (urlString) {
            //Convert video url to a path
            NSString *videoPath = [urlString path];
            NSLog(@"%@", videoPath);
        }
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"Image has been selected...Image info: %@ ... Description: %@", info, [info description]);
}

- (void)               image: (UIImage *) image
    didFinishSavingWithError: (NSError *) error
                 contextInfo: (void *) contextInfo
{
    if (error != nil) {
        NSLog(@"Error: %@", [error description]);
    }else{
        UIAlertView *saveSuccess = [[UIAlertView alloc] initWithTitle:@"Save successful"
                                                              message:nil
                                                             delegate:nil
                                                    cancelButtonTitle:nil
                                                    otherButtonTitles:@"Okay", nil];
        [saveSuccess show];
        NSLog(@"Save was successful");
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (segue) {
        
    }
}

@end
