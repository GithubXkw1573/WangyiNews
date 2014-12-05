//
//  VedioViewController.h
//  WangyiNews
//
//  Created by 许开伟 on 14/12/3.
//  Copyright (c) 2014年 许开伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Screenshot.h"
#import "UIImageView+LBBlurredImage.h"
#import "WNdelegate.h"

@interface VedioViewController : UIViewController
{
    UIImageView *_blurView;
}

@property (assign,nonatomic) id<WNdelegate> menuBtnDelegate;
@end
