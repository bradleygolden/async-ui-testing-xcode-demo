//
//  ViewController.m
//  Async UI Testing
//
//  Created by Bradley Golden on 1/12/16.
//  Copyright © 2016 Bradley Golden. All rights reserved.
//

#import "SubmitViewController.h"

@interface SubmitViewController () {
    
    dispatch_queue_t myQueue;
    __weak IBOutlet UIActivityIndicatorView *activityView;
    
}

@end

@implementation SubmitViewController

- (IBAction)submitButtonTouched:(id)sender {
    
    [activityView startAnimating];
    
    // do async operation
    if (!myQueue) {
        myQueue = dispatch_queue_create("me.submit.bradleygolden", NULL);
    }
    [activityView stopAnimating];
    
    dispatch_async(myQueue, ^{ [self submitOperation]; });
}

- (void)submitOperation {
    
    [activityView startAnimating];
    
    [NSThread sleepForTimeInterval:5]; // simulate time to reach out to server
    
    // upon completion of sleep
    dispatch_async(dispatch_get_main_queue(), ^{
        [activityView stopAnimating];
        [self performSegueWithIdentifier:@"contactSegue" sender:NULL];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [activityView stopAnimating];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
