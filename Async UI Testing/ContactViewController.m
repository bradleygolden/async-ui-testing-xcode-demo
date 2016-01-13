//
//  ContactViewController.m
//  Async UI Testing
//
//  Created by Bradley Golden on 1/12/16.
//  Copyright © 2016 Bradley Golden. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@property (weak, nonatomic) IBOutlet UILabel *contactLabel;

@end

@implementation ContactViewController

- (IBAction)contactButtonTouched:(id)sender {
    self.contactLabel.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
