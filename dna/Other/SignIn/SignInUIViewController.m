//
//  SignInUIViewController.m
//  dna
//
//  Created by 雪念飞叶 on 15/12/28.
//  Copyright © 2015年 雪念飞叶. All rights reserved.
//

#import "SignInUIViewController.h"
#import "BaseImp.h"

@implementation SignInUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    self.title = @"登录";
    
    UIBarButtonItem *regItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(showRegView)];
    self.navigationItem.rightBarButtonItem = regItem;
    
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(closeView)];
    self.navigationItem.leftBarButtonItem = closeItem;
    
}


@end
