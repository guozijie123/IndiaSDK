//
//  ViewController.m
//  demo
//
//  Created by Douglas on 2023/2/17.
//

#import "ViewController.h"
#import <IndiaSDK/IndiaServer.h>
#import <IndiaSDK/AESCipher.h>
#import <IndiaSDK/HandleTheString.h>
#import <WebKit/WebKit.h>
@interface ViewController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>

@property (nonatomic,strong)WKWebView * webView;
@property (nonatomic,strong)WKUserContentController *userController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"begin~~~~~~~~");
}

- (IBAction)fblogin:(id)sender {
    
    [[IndiaServer getStartServer] openTheFbloginwithBlock:^(NSString *userid, NSString *errorInfo) {
        
        
        
        
    }];
    
}

- (IBAction)payAction:(id)sender {
    
    [[IndiaServer getStartServer] pushTheAmount:@"100" payAmount:@"49.9" Couponid:@"" userid:@"13" channelId:@"1" boxid:@"aaaaa" count:@"1" Block:^(NSString *payUrl, NSString *payOrder, NSString *error) {
        
        NSLog(@"根据返回的url，使用webview来打开进行支付");
        [self showThewebView:payUrl];
    }];
    
    
}

-(void)showThewebView:(NSString *)urllink{
    
    WKWebViewConfiguration *confi = [[WKWebViewConfiguration alloc] init];
    _userController = [[WKUserContentController alloc] init];
    confi.userContentController = _userController;
    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) configuration:confi];
    [_userController addScriptMessageHandler:self name:@"openView"];
    _webView.center = self.view.center;
    _webView.opaque = NO;
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.navigationDelegate = self;
    _webView.UIDelegate = self;
    _webView.multipleTouchEnabled = YES;
//    _webView.scrollView.backgroundColor = [UIColor clearColor];
    NSURL * url = [NSURL URLWithString:urllink];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
    
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
   
}
//加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
   
}
//加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    if([message.name isEqualToString:@"openView"]){
        NSLog(@"%@",message.body);
        NSData *jsonData = [message.body dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        if (error) {
          
        }
        NSString * url = [[dic objectForKey:@"param"] objectForKey:@"url"];
        NSLog(@"需要打开的开盒链接: %@",url);
    }
}

@end
