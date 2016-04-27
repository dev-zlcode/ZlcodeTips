//
//  TableViewCell.h
//  WebView
//
//  Created by zhanglei on 16/4/26.
//  Copyright © 2016年 zlcode.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell<UIWebViewDelegate>

@property (nonatomic,strong) NSString *contentStr;
@property (nonatomic,assign) CGFloat height;
@property (strong, nonatomic) UIWebView *webView;

@end
