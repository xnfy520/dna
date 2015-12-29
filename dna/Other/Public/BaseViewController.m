//
//  BaseViewController.m
//  dna
//
//  Created by 雪念飞叶 on 15/12/28.
//  Copyright © 2015年 雪念飞叶. All rights reserved.
//

#import "BaseViewController.h"
#import "SignInUIViewController.h"
#import "SignUpViewController.h"
#import "BaseDef.h"

@interface BaseViewController ()<UITabBarControllerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarController.delegate = self;
}

- (void)showLoginView
{
    SignInUIViewController *signIn = [[SignInUIViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:signIn];
    signIn.hidesBottomBarWhenPushed = YES;
    [self.navigationController presentViewController:nav animated:YES completion:^{
        
    }];
    NSLog(@"LoginView");
}

- (void)showRegView
{
    SignUpViewController *signUp = [[SignUpViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:signUp];
    signUp.hidesBottomBarWhenPushed = YES;
    [self.navigationController presentViewController:nav animated:YES completion:^{
        
    }];
    NSLog(@"RegView");
}

- (void)closeView
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (viewController.tabBarItem.tag == kTabBarItemMine) {
        [self showLoginView];
        return NO;
    }
    return YES;
}

@end
