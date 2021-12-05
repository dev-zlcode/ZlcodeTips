### 主要代码 

CustomWebView.h

```
@interface CustomWebView : UIWebView


@end

```

CustomWebView.m

```
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
```

### 代码示例

```
	CustomWebView *webview = [CustomWebView new];
    webview.frame = self.view.bounds;
    [self.view addSubview:webview];
    NSURL *url = [NSURL URLWithString:@"http://www.feheadline.com/webapp/detail.html?id=3374280"];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    [webview loadRequest:req];

```

刚开始在CustomWebView.m的initWithFrame方法中,但是长按后菜单栏一直没有出来,后来发现,如果是通过xib添加此控件的话,通过断点跟踪就可发现,它是不会执行initWithFrame方法的,所以那段代码应该写在-(void)awakeFromNib方法中,如果是通过代码添加的,就应该写在initWithFrame方法中,否则不执行添加菜单的操作。

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender这个方法可以筛选出需要的菜单项,而自定义的WebView中已经重写了这个方法,所以在webview中弹出的菜单是需要的菜单项,在其他控件中例如TextField控件,弹出的依旧会是系统默认的菜单项,只是出于程序可读性,可维护性考虑,最好在自定义的控件中修改菜单性,单独封装起来。
	
### 图片示例：

![uiwebview-menu-1](http://blog.zlcode.com/wp-content/uploads/2016/09/uiwebview-menu-1.png)

[完整代码下载](https://github.com/YiQieSuiYuan/Demo/tree/master/WebviewMenu)

### 参考
[http://jingyan.baidu.com/article/ac6a9a5e7d3e282b653eac1b.html](http://jingyan.baidu.com/article/ac6a9a5e7d3e282b653eac1b.html)
