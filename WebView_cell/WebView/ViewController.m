//
//  ViewController.m
//  WebView
//
//  Created by 张雷 on 16/4/26.
//  Copyright (c) 2016年 zlcode.com. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UIWebViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableDictionary *heightDic;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.heightDic = [[NSMutableDictionary alloc] init];
    
    // 注册加载完成高度的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti:) name:@"WEBVIEW_HEIGHT" object:nil];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
}

#pragma mark - table delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.tag = indexPath.row;
    
    NSString *str = @"<p><img src=\"http://210.14.79.98:8065//uploads/LCatProduct/201603/8083ceea-9377-4dbf-99eb-d2c0f168aaa2.jpg\"/></p><p><img src=\"http://210.14.79.98:8065//uploads/LCatProduct/201603/3b5b546a-ad56-4e15-9c9e-25eb94eff064.jpg\"/></p><p><img src=\"http://210.14.79.98:8065//uploads/LCatProduct/201603/5bd193d4-8bcf-4264-96d7-7363cb23c5d0.jpg\"/></p><p><img src=\"http://210.14.79.98:8065//uploads/LCatProduct/201603/3f21d70e-e748-4731-bdce-71e504f590a3.jpg\"/></p>";
    
    // 赋值 把需要的html放里面就好了，不需要其他操作
    cell.contentStr = str;

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self.heightDic objectForKey:[NSString stringWithFormat:@"%ld",indexPath.row]] floatValue];;
}

#pragma mark - 通知
- (void)noti:(NSNotification *)sender
{
    TableViewCell *cell = [sender object];
    NSLog(@"%@",@(cell.tag));
    
    if (![self.heightDic objectForKey:[NSString stringWithFormat:@"%ld",cell.tag]]||[[self.heightDic objectForKey:[NSString stringWithFormat:@"%ld",cell.tag]] floatValue] != cell.height)
    {
        [self.heightDic setObject:[NSNumber numberWithFloat:cell.height] forKey:[NSString stringWithFormat:@"%ld",cell.tag]];
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:cell.tag inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    }
}

@end
