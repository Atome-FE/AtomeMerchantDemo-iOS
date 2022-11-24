//
//  ViewController.m
//  AtomeMerchantDemo-OC
//
//  Created by boye on 2022/11/24.
//

#import "ViewController.h"
#import <AtomeSDK/AtomeSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL* url = [[NSURL alloc] initWithString:@"atome url"];
    [[AtomeManager sharedManager] handPaymentURL:url options:nil completionHandler:nil];
    
    if ([[AtomeManager sharedManager] isAtomeInstalled]) {
        NSLog(@"Atome already installed");
    } else {
        NSLog(@"Atome not installed, please go to download");
    }
}


@end
