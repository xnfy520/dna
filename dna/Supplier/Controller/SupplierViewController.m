//
//  SupplierViewController.m
//  dna
//
//  Created by 雪念飞叶 on 15/12/28.
//  Copyright © 2015年 雪念飞叶. All rights reserved.
//

#import "SupplierViewController.h"

@interface SupplierViewController ()

@end

@implementation SupplierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MHNetworkManager postReqeustWithURL:DEF_GetHomepage params:@{@"account":@"13103859179",@"sign":@"0c1fc7f08389e844a62d428152caedf6",@"token":@"26713f368ced59a9a25e3afd077e3a05"} successBlock:^(NSDictionary *returnData) {
        
    } failureBlock:^(NSError *error) {
        NSLog(@"error");
    } showHUD:NO];
    
}

- (void)finishedRequest
{
    NSLog(@"hello");
}

@end
