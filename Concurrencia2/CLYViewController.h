//
//  CLYViewController.h
//  Concurrencia2
//
//  Created by Carlos Eduardo López Mercado on 5/31/14.
//  Copyright (c) 2014 Carlyeah. All rights reserved.
//



@interface CLYViewController : UIViewController

@property(weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property(weak, nonatomic) IBOutlet UIImageView *image;

- (IBAction)downloadImage:(id)sender;
@end
