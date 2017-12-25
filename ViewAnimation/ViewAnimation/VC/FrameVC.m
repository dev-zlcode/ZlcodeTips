//
//  FrameVC.m
//  ViewAnimation
//
//  Created by admin on 2017/11/17.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FrameVC.h"

@interface FrameVC ()
@property (nonatomic,strong) UIView *bigView;
@property (nonatomic,strong) UIView *smallView;
@property (nonatomic,strong) UIButton *startButton;
@end

@implementation FrameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self changeFrame];
}

- (void)initView{
    
    self.bigView = [UIView new];
    self.bigView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.bigView];
    
    self.smallView = [UIView new];
    self.smallView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.smallView];
    
    self.startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.startButton setTitle:@"开始动画" forState:UIControlStateNormal];
    [self.startButton addTarget:self action:@selector(startButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startButton];
    
    CGFloat edge = 50;
    self.bigView.frame = CGRectMake(edge, StatusBarAndNavigationBarHeight+edge, ScreenWidth-edge*2, (ScreenWidth-edge*2)/2);
    
    self.smallView.frame = CGRectMake(edge, GET_BOTTOM(self.bigView)+edge, GET_WIDTH(self.bigView)*0.5, GET_HEIGHT(self.bigView)*0.5);
    
    self.startButton.frame = CGRectMake(0, ScreenHeight-50, ScreenWidth, 50);
}

- (void)startButtonClick:(UIButton *)sender{
    [self changeFrame];
}

- (void)changeFrame {
    [UIView beginAnimations:@"FrameAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(animationStart:)];
    [UIView setAnimationDidStopSelector:@selector(animationStop:)];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.smallView.frame = self.bigView.frame;
    [UIView commitAnimations];
}

#pragma mark - anmaiton delegate
- (void)animationWillStart:(NSString *)animationID context:(void *)context{
    NSLog(@"%@ xxx",animationID);
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    NSLog(@"%@ yyy",animationID);
}

#pragma SEL
- (void)animationStart:(NSString *)animationID {
    NSLog(@"%@ start",animationID);
}

- (void)animationStop:(NSString *)animationID {
    NSLog(@"%@ stop",animationID);
}

@end
