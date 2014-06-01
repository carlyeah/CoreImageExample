//
//  CLYCoreImageFilter.m
//  Concurrencia2
//
//  Created by Carlos Eduardo López Mercado on 5/31/14.
//  Copyright (c) 2014 Carlyeah. All rights reserved.
//

#import "CLYCoreImageFilter.h"
#import "CLYViewController.h"

@interface CLYCoreImageFilter()

@property (strong, nonatomic) CLYViewController *iVC;

@end

@implementation CLYCoreImageFilter

-(id) initWithImageViewController:(CLYViewController *) vc{
    if(self = [super init]){
        self.iVC = vc;
        
    }
    return self;
}

-(void) updateViewControllerBeforeBackground{
    [self.iVC.loading setHidden:NO];
    [self.iVC.loading startAnimating];
}

-(void) updateViewControllerAfterBackgroundWithImage:(UIImage *) image{
    [self.iVC.loading setHidden:YES];
    [self.iVC.loading stopAnimating];
    self.iVC.image.image = image;
}

-(void) main{

    [self performSelectorOnMainThread: @selector(updateViewControllerBeforeBackground)
                              withObject:nil
                           waitUntilDone:NO];

    CIContext *context = [CIContext contextWithOptions:nil];

    CIImage *image = [CIImage imageWithCGImage: self.iVC.image.image.CGImage];


    //sepia filter
    CIFilter *falseColor = [CIFilter filterWithName: @"CIFalseColor"];

    [falseColor setDefaults];

    [falseColor setValue: image
                  forKey: kCIInputImageKey];

    //another filter
    CIFilter *vignette = [CIFilter filterWithName: @"CIVignette"];
    [vignette setDefaults];
    [vignette setValue: @"8"
                forKey:kCIInputIntensityKey];

    //output image
    CIImage *output = falseColor.outputImage;

    //chain filters
    [vignette setValue: output
                forKey:kCIInputImageKey];

    output = vignette.outputImage;

    CGImageRef res = [context createCGImage: output
                                   fromRect: [output extent]];

    [self performSelectorOnMainThread:@selector(updateViewControllerAfterBackgroundWithImage:)
                           withObject: [UIImage imageWithCGImage: res]
                        waitUntilDone:NO];

    CGImageRelease(res);
}

@end
