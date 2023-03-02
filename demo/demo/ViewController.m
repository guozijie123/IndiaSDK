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
}

- (IBAction)fblogin:(id)sender {
    
    [[IndiaServer getStartServer] openTheFbloginwithBlock:^(NSString *userid, NSString *errorInfo) {
        
        
        
        
    }];
    
}

@end
