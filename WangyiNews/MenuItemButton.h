//
//  MenuItemButton.h
//  WangyiNews
//
//  Created by 许开伟 on 14/12/3.
//  Copyright (c) 2014年 许开伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuItemButton : UIButton
@property (nonatomic,assign) BOOL selected;
- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withImage:(NSString *)imageName;
@end
