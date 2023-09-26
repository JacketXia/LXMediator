//
//  FirstViewController.m
//  LXLib
//
//  Created by JacketXia on 2023/1/3.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.greenColor;
}

- (void)lx_initializeParam:(NSDictionary *)param {
    NSLog(@"first %@",param);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *vc = LXGetController(@"/home", @{@"name" : @"bbbbbb"});
    [self.navigationController pushViewController:vc animated:YES];
}

@end

LXController("/first", FirstViewController);



