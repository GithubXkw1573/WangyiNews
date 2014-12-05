//
//  VedioViewController.m
//  WangyiNews
//
//  Created by 许开伟 on 14/12/3.
//  Copyright (c) 2014年 许开伟. All rights reserved.
//

#import "VedioViewController.h"
#import "WNAppDelegate.h"

@interface VedioViewController ()

@end

@implementation VedioViewController
@synthesize menuBtnDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initNaviWithTitle:@"视频"];
    self.menuBtnDelegate = (WNAppDelegate*)[UIApplication sharedApplication].delegate;
    [self initComponents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initNaviWithTitle:(NSString*)title
{
    if (iOS7Later) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"背景.png"]];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"标题栏%i.png",[[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0?7:6]] forBarMetrics:UIBarMetricsDefault];
    UILabel *titlelabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80*widthRate, 44)];
    titlelabel.backgroundColor=[UIColor clearColor];
    titlelabel.textColor=[UIColor whiteColor];
    titlelabel.text=title;
    titlelabel.textAlignment=NSTextAlignmentCenter;
    titlelabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:19];
    self.navigationItem.titleView=titlelabel;
    [titlelabel release];
    
    //菜单按钮
    UIView *rightbtnview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    [rightbtnview setBackgroundColor:[UIColor clearColor]];
    
    UIButton *rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame=CGRectMake(-10, 0, 60, 44);
    rightbtn.tag = 1;
    [rightbtn setBackgroundImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [rightbtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [rightbtnview addSubview:rightbtn];
    
    UIBarButtonItem *myrightitem = [[UIBarButtonItem alloc] initWithCustomView:rightbtnview];
    self.navigationItem.leftBarButtonItem = myrightitem;
    [myrightitem release];
    [rightbtnview release];
}

-(void)initComponents
{
    UISwipeGestureRecognizer *leftswift = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showMenuView:)];
    leftswift.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:leftswift];
    [leftswift release];
    
    UIImageView *bigview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, applicationwidth, applicationheight-44)];
    bigview.image = [UIImage imageNamed:@"example4.jpg"];
    [self.view addSubview:bigview];
    [bigview release];
}

-(void)buttonClicked:(UIButton*)btn
{
    if (btn.tag == 1) {
        if (menuBtnDelegate && [menuBtnDelegate respondsToSelector:@selector(MenuButtonPressed)]) {
            [menuBtnDelegate performSelector:@selector(MenuButtonPressed)];
        }
        
    }
}

-(void)showMenuView:(id)sender
{
    if (menuBtnDelegate && [menuBtnDelegate respondsToSelector:@selector(MenuButtonPressed)]) {
        [menuBtnDelegate performSelector:@selector(MenuButtonPressed)];
    }
}

@end
