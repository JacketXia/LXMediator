//
//  SecondViewController.m
//  LXLib
//
//  Created by JacketXia on 2023/1/3.
//

#import "SecondViewController.h"
#import "LXRouter.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.cyanColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *vc = LXGetController(@"/home", @{@"name" : @"cccccc"});
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)lx_initializeParam:(NSDictionary *)param {
    NSLog(@"section %@",param);
}

@end

LXController("/section", SecondViewController);
