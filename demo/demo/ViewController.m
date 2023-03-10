//
//  ViewController.m
//  demo
//
//  Created by Douglas on 2023/2/17.
//

#import "ViewController.h"
#import <IndiaSDK/IndiaServer.h>
@interface ViewController ()

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
    
    [[IndiaServer getStartServer] pushTheAmount:@"100" payAmount:@"49.9" Couponid:@"" userid:@"12" channelId:@"1" boxid:@"aaaaa" count:@"1" Block:^(NSString *payUrl, NSString *payOrder, NSString *error) {
        
        NSLog(@"根据返回的url，使用webview来打开进行支付");
        
    }];
    
    
}



@end
