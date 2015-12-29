//
//  MineViewController.m
//  dna
//
//  Created by 雪念飞叶 on 15/12/28.
//  Copyright © 2015年 雪念飞叶. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [bt setTitle:@"login" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(regViews) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
    }];
    [self showLoginView];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)regViews
{
    [self showLoginView];
}



@end
