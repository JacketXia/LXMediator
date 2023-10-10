//
//  ViewController.m
//  LXLib
//
//  Created by JacketXia on 2022/12/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.yellowColor;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UIViewController *vc = LXGetController(@"/first", @{@"name" : @"aaaaaa"});
//    [self.navigationController pushViewController:vc animated:YES];
    LXRouter.onName(@"/first",@{@"name" : @"cccccc"}).onReplace(true);
//    LXRouter.onVC([[ViewController alloc] init]).onPush(true);
}

-(void)lx_initializeParams:(NSDictionary *)param {
    NSLog(@"home %@",param);
}

@end

LXController("/home", ViewController)
LXController("/home/tab", ViewController)


