//
//  LXViewController.m
//  LXMediator
//
//  Created by xiawenbin on 11/05/2022.
//  Copyright (c) 2022 xiawenbin. All rights reserved.
//

#import "LXViewController.h"
#import <LXMediator/LXRouter.h>
@interface LXViewController ()

@end

@implementation LXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.whiteColor;
}

- (IBAction)onPush:(id)sender {
    LXRouterPush(@"SecondViewController", @{@"message" : @"push"}, YES);
}


- (IBAction)onPresnet:(id)sender {
    LXRouterPresent(@"SecondViewController", @{@"message" : @"present"}, YES);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
