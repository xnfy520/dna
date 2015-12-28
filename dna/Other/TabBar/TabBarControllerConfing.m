//
//  TabBarControllerConfing.m
//  dna
//
//  Created by 雪念飞叶 on 15/12/28.
//  Copyright © 2015年 雪念飞叶. All rights reserved.
//

#import "TabBarControllerConfing.h"
#import "SupplierViewController.h"
#import "OrderViewController.h"
#import "MineViewController.h"

@interface TabBarControllerConfing ()

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@end

@implementation TabBarControllerConfing

/**
 *  lazy load tabBarController
 *
 *  @return CYLTabBarController
 */
- (CYLTabBarController *)tabBarController
{
    if (_tabBarController == nil) {
        SupplierViewController *firstViewController = [[SupplierViewController alloc] init];
        UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:firstViewController];
        
        OrderViewController *secondViewController = [[OrderViewController alloc] init];
        UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                        initWithRootViewController:secondViewController];
        
        MineViewController *thirdViewController = [[MineViewController alloc] init];
        UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:thirdViewController];
        
        CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
        
        /*
         *
         在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
         *
         */
        [self setUpTabBarItemsAttributesForController:tabBarController];
        
        [tabBarController setViewControllers:@[
                                               firstNavigationController,
                                               secondNavigationController,
                                               thirdNavigationController
                                               ]];
        /**
         *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
         */
        // [[self class] customizeTabBarAppearance];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

/*
 *
 在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
 *
 */
- (void)setUpTabBarItemsAttributesForController:(CYLTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"home_normal",
                            CYLTabBarItemSelectedImage : @"home_highlight",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"同城",
                            CYLTabBarItemImage : @"mycity_normal",
                            CYLTabBarItemSelectedImage : @"mycity_highlight",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"消息",
                            CYLTabBarItemImage : @"message_normal",
                            CYLTabBarItemSelectedImage : @"message_highlight",
                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       dict3
                                       ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
 */
+ (void)customizeTabBarAppearance {
    
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateHighlighted];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    [[UITabBar appearance] setSelectionIndicatorImage:[self imageFromColor:[UIColor colorWithRed:26/255.0 green:163/255.0 blue:133/255.0 alpha:1] forSize:CGSizeMake([UIScreen mainScreen].bounds.size.width/5.0f, 49) withCornerRadius:0]];
    
    // set the bar background color
    // 设置背景图片
    // UITabBar *tabBarAppearance = [UITabBar appearance];
    // [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background_ios7"]];
}

+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContext(size);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:rect];
    
    // Get the image, here setting the UIImageView image
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return image;
}

@end
