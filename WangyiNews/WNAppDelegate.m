//
//  WNAppDelegate.m
//  WangyiNews
//
//  Created by 许开伟 on 14/12/3.
//  Copyright (c) 2014年 许开伟. All rights reserved.
//

#import "WNAppDelegate.h"
#import "MenuItemButton.h"

@implementation WNAppDelegate
@synthesize myMenuView,_blurView;
@synthesize nav1,nav2,nav3,nav4,nav5;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    NewsViewController *news = [[NewsViewController alloc] init];
    SubcribeViewController *sub = [[SubcribeViewController alloc] init];
    PictrueViewController *pic = [[PictrueViewController alloc] init];
    VedioViewController *vedio = [[VedioViewController alloc] init];
    RadioViewController *radio = [[RadioViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:news];
    self.nav1 = nav;
    self.window.rootViewController = nav;
    [nav release];
    
    UINavigationController *_nav2 = [[UINavigationController alloc] initWithRootViewController:sub];
    self.nav2 = _nav2;
    [_nav2 release];
    
    UINavigationController *_nav3 = [[UINavigationController alloc] initWithRootViewController:pic];
    self.nav3 = _nav3;
    [_nav3 release];
    
    UINavigationController *_nav4 = [[UINavigationController alloc] initWithRootViewController:vedio];
    self.nav4 = _nav4;
    [_nav4 release];
    
    UINavigationController *_nav5 = [[UINavigationController alloc] initWithRootViewController:radio];
    self.nav5 = _nav5;
    [_nav5 release];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //添加菜单视图
    MenuView *menuView = [[MenuView alloc] init];
    self.myMenuView = menuView;
    [self.window addSubview:menuView];
    [menuView release];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)MenuButtonPressed
{
    //背景模糊效果
    UIImage *currimage = [self.window convertViewToImage];
    _blurView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, applicationwidth, applicationheight+20)];
    _blurView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeBlurview:)];
    UISwipeGestureRecognizer *leftswift = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(closeBlurview:)];
    leftswift.direction = UISwipeGestureRecognizerDirectionLeft;
    [_blurView addGestureRecognizer:tap];
    [_blurView addGestureRecognizer:leftswift];
    [tap release];
    [leftswift release];
    _blurView.backgroundColor = [UIColor clearColor];
    [self.window addSubview:_blurView];
    [self.window bringSubviewToFront:myMenuView];
    [_blurView setImageToBlur:currimage blurRadius:10 completionBlock:^(NSError *error){
        NSLog(@"The blurred image has been setted");
    }];
    
    [UIView animateWithDuration:0.25f animations:^{
        CGRect myframe = self.myMenuView.frame;
        self.myMenuView.frame= CGRectMake(0, 0, myframe.size.width, myframe.size.height);
    } completion:^(BOOL flag){
        [self.myMenuView showButtonsAnimate];
    }];
}

-(void)closeBlurview:(id)sender
{
    for(UIView *v in _blurView.subviews)
        [v removeFromSuperview];
    [_blurView removeFromSuperview];
    [UIView animateWithDuration:0.25f animations:^{
        CGRect myframe = self.myMenuView.frame;
        self.myMenuView.frame= CGRectMake(-myframe.size.width, 0, myframe.size.width, myframe.size.height);
    }];
}

@end
