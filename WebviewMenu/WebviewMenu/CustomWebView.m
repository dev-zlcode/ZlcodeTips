//
//  CustomWebView.m
//  WebviewTest
//
//  Created by admin on 16/9/13.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "CustomWebView.h"

@implementation CustomWebView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 全代码时入口
        [self addMenu];
    }
    
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    // xib时入口
    [self addMenu];
}

- (void)addMenu
{
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    
    UIMenuItem *menuItemCopy = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyT:)];
    
    UIMenuItem *menuItemNote = [[UIMenuItem alloc] initWithTitle:@"笔记" action:@selector(noteT:)];
    
    UIMenuItem *menuItemSearch = [[UIMenuItem alloc] initWithTitle:@"搜索" action:@selector(searchT:)];
    
    UIMenuItem *menuItemShare = [[UIMenuItem alloc] initWithTitle:@"分享" action:@selector(shareT:)];
    
    NSArray *mArray = [NSArray arrayWithObjects:menuItemCopy,menuItemNote,menuItemSearch,menuItemShare,nil];
    [menuController setMenuItems:mArray];
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if(action == @selector(copyT:) || action == @selector(noteT:) || action == @selector(searchT:) || action == @selector(shareT:))
    {
        return YES;
    }
    
    return NO;
}

-(void)copyT:(id)sender
{
    NSLog(@"复制");
}

-(void)noteT:(id)sender
{
    NSLog(@"笔记");
}

-(void)searchT:(id)sender
{
    NSLog(@"搜索");
}

-(void)shareT:(id)sender
{
    NSLog(@"分享");
}

@end
