//
//  MenuView.h
//  WangyiNews
//
//  Created by 许开伟 on 14/12/3.
//  Copyright (c) 2014年 许开伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItemButton.h"

@interface MenuView : UIView
{
    BOOL isRefresh;
}
@property (nonatomic,assign) NSInteger selectedIndex;
-(MenuItemButton*)currentMenuItem:(NSInteger)index;
-(void)showButtonsAnimate;
@end
