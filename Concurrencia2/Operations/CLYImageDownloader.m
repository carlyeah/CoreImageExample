//
//  CLYImageDownloader.m
//  Concurrencia2
//
//  Created by Carlos Eduardo López Mercado on 5/31/14.
//  Copyright (c) 2014 Carlyeah. All rights reserved.
//

#import "CLYImageDownloader.h"
#import "CLYViewController.h"

@interface CLYImageDownloader()

@property (strong, nonatomic) CLYViewController *iVC;

@end

@implementation CLYImageDownloader

-(id) initWithImageViewController:(CLYViewController *) vc{
    if(self = [super init]){
        self.iVC = vc;

    }

    return self;
}

-(void) main{
    NSURL *url = [NSURL URLWithString:@"http://74211.com/wallpaper/picture_big/free_wallpaper_of_actressEllen_Page.jpg"];

    NSData *data = [NSData dataWithContentsOfURL:url];

    UIImage *image = [UIImage imageWithData: data];

    [self performSelectorOnMainThread:@selector(updateViewControllerWithImage:)
                           withObject:image
                        waitUntilDone:NO];
}

-(void) updateViewControllerWithImage:(UIImage *) image{
    self.iVC.image.image = image;
    [self.iVC.loading setHidden:YES];
    [self.iVC.loading stopAnimating];
}

@end
