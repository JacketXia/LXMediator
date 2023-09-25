//
//  ViewController.m
//  LXLib
//
//  Created by JacketXia on 2022/12/23.
//

#import "ViewController.h"
#import "LXMediator.h"
#import "TempProtocol.h"

@interface ViewController ()

@end

@implementation ViewController

//- (void)lx_loadParam:(NSDictionary *)param {
//    NSLog(@"%@",param);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.yellowColor;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *vc = LXGetController(@"/first", @{@"name" : @"aaaaaa"});
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)lx_initializeParam:(NSDictionary *)param {
    NSLog(@"home %@",param);
}

@end

LXController("/home", ViewController)
LXController("/home/tab", ViewController)


