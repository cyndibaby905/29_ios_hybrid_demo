//
//  FlutterHomeViewController.m
//  HybridRouteDemo
//
//  Created by Hang Chen on 2019/7/26.
//  Copyright © 2019 Hang Chen. All rights reserved.
//

#import "FlutterHomeViewController.h"
#import "SomeOtherNativeViewController.h"

@interface FlutterHomeViewController ()

@end

@implementation FlutterHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"samples.chenhang/navigation" binaryMessenger:self];
    
    [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        // Note: this method is invoked on the UI thread.
        if([call.method isEqualToString:@"openNativePage"]) {
    
            SomeOtherNativeViewController *vc = [[SomeOtherNativeViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            result(@0);
        }
        else if([call.method isEqualToString:@"closeFlutterPage"]) {
            [self.navigationController popViewControllerAnimated:YES];
            result(@0);
        }
        else {
            result(FlutterMethodNotImplemented);
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:animated];

}

@end
