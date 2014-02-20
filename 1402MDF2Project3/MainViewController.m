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
    UIImagePickerController *capturePhoto = [[UIImagePickerController alloc] init];
    if (capturePhoto != nil) {
        //Set type of control
        capturePhoto.sourceType = UIImagePickerControllerSourceTypeCamera;
        //Set delagate
        capturePhoto.delegate = self;
        //Set editing
        capturePhoto.allowsEditing = YES;
        //Show camera
        [self presentViewController:capturePhoto animated:YES completion:^(void){
//            if (error == nil) {
//                NSLog(@"There was an error: %@", error.description);
//            }else{
//                NSLog(@"Photo was captured and saved succesfully");
//            }
        }];
        
    }
    
}

- (IBAction)videoButton:(id)sender
{
    
}

- (IBAction)albumButton:(id)sender
{
    UIImagePickerController *albumPicker = [[UIImagePickerController alloc] init];
    if (albumPicker != nil) {
        albumPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        albumPicker.delegate = self;
        
        albumPicker.allowsEditing = YES;
        
        [self presentViewController:albumPicker animated:YES completion:NULL];
    } 
}

#pragma mark - Picker Controll

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (selectedImage) {
        self.photoImageView.image = selectedImage;
        
    }
    UIImage *scaledImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (scaledImage) {
        self.scaledImageView.image = scaledImage;
        
        //Save image to photo album
        UIImageWriteToSavedPhotosAlbum(scaledImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        
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
        NSLog(@"Save was successful");
    }
}

@end
