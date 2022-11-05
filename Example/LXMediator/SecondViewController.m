//
//  SecondViewController.m
//  LXMediator_Example
//
//  Created by xiawenbin on 2022/11/5.
//  Copyright © 2022 xiawenbin. All rights reserved.
//

#import "SecondViewController.h"
#import <LXRouter.h>
@interface SecondViewController (){
    NSString *_message;
}

@end

@implementation SecondViewController

- (instancetype)initWithParams:(NSDictionary *)params {
    self = [super init];
    if (self) {
        _message = params[@"message"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.font = [UIFont systemFontOfSize:28 weight:UIFontWeightSemibold];
    label.text = [NSString stringWithFormat:@"message:%@",_message];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = UIColor.blackColor;
    [self.view addSubview:label];
    
    UIStackView *stackView = [[UIStackView alloc] initWithFrame:self.view.bounds];
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.axis = UILayoutConstraintAxisVertical;
    [self.view addSubview:stackView];
    
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        [button setTitle:@"present" forState:UIControlStateNormal];
        [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onPresent) forControlEvents:UIControlEventTouchUpInside];
        [stackView addArrangedSubview:button];
    }
    
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        [button setTitle:@"back" forState:UIControlStateNormal];
        [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
        [stackView addArrangedSubview:button];
    }
    
}

- (void)onPresent {
    LXRouterPresent(@"SecondViewController", @{@"message" : [NSString stringWithFormat:@"present%d",arc4random() / 10000]}, YES);
}

- (void)onBack {
    LXRouterGoBack(YES);
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
