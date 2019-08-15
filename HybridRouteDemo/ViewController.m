//
//  ViewController.m
//  HybridRouteDemo
//
//  Created by Hang Chen on 2019/7/26.
//  Copyright © 2019 Hang Chen. All rights reserved.
//

#import "ViewController.h"
#import "FlutterHomeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Main Native Page";
    [self.view addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 30)];
        label.text = @"Native Main ViewController";
        label.textAlignment = NSTextAlignmentCenter;
        label;
    })];
    
    [self.view addSubview:({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
        button.frame = CGRectMake(50, 250, 120, 30);

        button.adjustsImageWhenHighlighted = NO;
        button.adjustsImageWhenDisabled = NO;
        button.showsTouchWhenHighlighted = YES;
        [button setTitle:@"Open Flutter" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(openFlutterVC) forControlEvents:UIControlEventTouchUpInside];
        button;
        
    })];
}

- (void)openFlutterVC {
    FlutterHomeViewController *vc = [[FlutterHomeViewController alloc]init];
    [vc setInitialRoute:@"defaultPage"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
