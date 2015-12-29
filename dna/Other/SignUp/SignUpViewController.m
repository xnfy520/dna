//
//  SignUpViewController.m
//  dna
//
//  Created by 雪念飞叶 on 15/12/28.
//  Copyright © 2015年 雪念飞叶. All rights reserved.
//

#import "SignUpViewController.h"

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"注册";
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(closeView)];
    self.navigationItem.leftBarButtonItem = closeItem;
    
}

@end
