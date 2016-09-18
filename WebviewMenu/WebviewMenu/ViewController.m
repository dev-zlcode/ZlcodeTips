//
//  ViewController.m
//  WebviewMenu
//
//  Created by admin on 16/9/18.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "CustomWebView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    CustomWebView *webview = [CustomWebView new];
    webview.frame = self.view.bounds;
    [self.view addSubview:webview];
    NSURL *url = [NSURL URLWithString:@"http://www.feheadline.com/webapp/detail.html?id=3374280"];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    [webview loadRequest:req];
}

@end
