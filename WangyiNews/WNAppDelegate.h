//
//  WNAppDelegate.h
//  WangyiNews
//
//  Created by 许开伟 on 14/12/3.
//  Copyright (c) 2014年 许开伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsViewController.h"
#import "MenuView.h"
#import "WNdelegate.h"
#import "SubcribeViewController.h"
#import "PictrueViewController.h"
#import "VedioViewController.h"
#import "RadioViewController.h"

@interface WNAppDelegate : UIResponder <UIApplicationDelegate,WNdelegate>
{
    UIImageView *_blurView;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MenuView *myMenuView;
@property (strong, nonatomic) UIImageView *_blurView;
@property (strong,nonatomic) UINavigationController *nav1;
@property (strong,nonatomic) UINavigationController *nav2;
@property (strong,nonatomic) UINavigationController *nav3;
@property (strong,nonatomic) UINavigationController *nav4;
@property (strong,nonatomic) UINavigationController *nav5;
@end
