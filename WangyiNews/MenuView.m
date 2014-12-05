//
//  MenuView.m
//  WangyiNews
//
//  Created by 许开伟 on 14/12/3.
//  Copyright (c) 2014年 许开伟. All rights reserved.
//

#import "MenuView.h"
#import "WNAppDelegate.h"

@implementation MenuView
@synthesize selectedIndex;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.85f;
        [self initComponents];
        self.selectedIndex = 0;
    }
    return self;
}

-(id)init
{
    CGRect frame = CGRectMake(-applicationwidth*0.75, 0, applicationwidth*0.75, applicationheight+20);
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.85f;
        [self initComponents];
        self.selectedIndex = 0;
    }
    return self;
}

-(WNAppDelegate*)appDelegate
{
    return (WNAppDelegate*)[UIApplication sharedApplication].delegate;
}

-(void)initComponents
{
    UISwipeGestureRecognizer *leftswift = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftswift:)];
    leftswift.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:leftswift];
    [leftswift release];
    
    MenuItemButton *news = [[MenuItemButton alloc] initWithFrame:CGRectMake(0, 80, self.frame.size.width, 60) withTitle:@"新闻" withImage:@"小箭头"];
    news.tag = 10;
    news.selected = YES;
    [news addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:news];
    [news release];
    
    MenuItemButton *subcri = [[MenuItemButton alloc] initWithFrame:CGRectMake(0, 80+50, self.frame.size.width, 60) withTitle:@"订阅" withImage:@"小箭头"];
    subcri.tag = 11;
    [subcri addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:subcri];
    [subcri release];
    
    MenuItemButton *pic = [[MenuItemButton alloc] initWithFrame:CGRectMake(0, 80+100, self.frame.size.width, 60) withTitle:@"图片" withImage:@"小箭头"];
    pic.tag = 12;
    [pic addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:pic];
    [pic release];
    
    MenuItemButton *vedio = [[MenuItemButton alloc] initWithFrame:CGRectMake(0, 80+150, self.frame.size.width, 60) withTitle:@"视频" withImage:@"小箭头"];
    vedio.tag = 13;
    [vedio addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:vedio];
    [vedio release];
    
    MenuItemButton *raido = [[MenuItemButton alloc] initWithFrame:CGRectMake(0, 80+200, self.frame.size.width, 60) withTitle:@"电台" withImage:@"小箭头"];
    raido.tag = 14;
    [raido addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:raido];
    [raido release];
}

-(void)leftswift:(id)sender
{
    isRefresh = NO;
    [self hidenMenuView];
}

-(void)hidenMenuView
{
    WNAppDelegate *root = [self appDelegate];
    [root._blurView removeFromSuperview];
    
    [UIView animateWithDuration:0.25f animations:^{
        CGRect myframe = self.frame;
        self.frame= CGRectMake(-myframe.size.width, 0, myframe.size.width, myframe.size.height);
    } completion:^(BOOL flag){
        if (isRefresh) {
            [self swichChanel];
        }
    }];
}

-(MenuItemButton*)currentMenuItem:(NSInteger)index
{
    return (MenuItemButton*)[self viewWithTag:(index+10)];
}

-(void)buttonClicked:(id)sender
{
    isRefresh = NO;
    MenuItemButton *currItem = sender;
    if (self.selectedIndex!=currItem.tag-10) {
        self.selectedIndex = currItem.tag-10;
        isRefresh = YES;
    }
    [self showButtonsAnimate];
    [self hidenMenuView];
    
}

-(void)swichChanel
{
    WNAppDelegate *root = [self appDelegate];
    if (selectedIndex==0) {
        self.window.rootViewController = root.nav1;
    }else if (selectedIndex==1){
        self.window.rootViewController = root.nav2;
    }else if (selectedIndex==2){
        self.window.rootViewController = root.nav3;
    }else if (selectedIndex==3){
        self.window.rootViewController = root.nav4;
    }else if (selectedIndex==4){
        self.window.rootViewController = root.nav5;
    }
    [root.window makeKeyAndVisible];
}

-(void)showButtonsAnimate
{
    for (int i=0; i<5; i++) {
        MenuItemButton *item = [self currentMenuItem:i];
        if (i!=selectedIndex) {
            item.selected = NO;
        }else{
            item.selected = YES;
        }
    }
}

@end
