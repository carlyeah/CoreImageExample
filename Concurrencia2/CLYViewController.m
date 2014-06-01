//
//  CLYViewController.m
//  Concurrencia2
//
//  Created by Carlos Eduardo López Mercado on 5/31/14.
//  Copyright (c) 2014 Carlyeah. All rights reserved.
//

#import "CLYViewController.h"
#import "CLYImageDownloader.h"
#import "CLYCoreImageFilter.h"

@interface CLYViewController ()
@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation CLYViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        _queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loading setHidden:YES];
}


- (IBAction)downloadImage:(id)sender {

    [self.loading setHidden:NO];

    [self.loading startAnimating];

    CLYImageDownloader *downloader = [[CLYImageDownloader alloc] initWithImageViewController: self];

    CLYCoreImageFilter *imageFilter = [[CLYCoreImageFilter alloc] initWithImageViewController: self];


    //link between the operations (do imagefilter after download the image)
    [imageFilter addDependency: downloader];

    //add operations to queue
    [self.queue addOperation: downloader];
    [self.queue addOperation: imageFilter];
}
@end
