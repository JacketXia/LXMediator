//
//  ErrorViewController.m
//  RouteDemo
//
//  Created by xiawenbin on 2022/11/4.
//

#import "LXErrorViewController.h"

@interface LXErrorViewController ()

@end

@implementation LXErrorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:28 weight:UIFontWeightSemibold];
    label.text = self.message ?: @"路由错误";
    label.textColor = UIColor.blackColor;
    [self.view addSubview:label];
}

@end
