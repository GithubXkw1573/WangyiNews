//
//  MenuItemButton.m
//  WangyiNews
//
//  Created by 许开伟 on 14/12/3.
//  Copyright (c) 2014年 许开伟. All rights reserved.
//

#import "MenuItemButton.h"

@implementation MenuItemButton
@synthesize selected;

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withImage:(NSString *)imageName
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *newsImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-30, 22.5, 15, 15)];
        newsImage.tag = 1;
        newsImage.image = [UIImage imageNamed:@"小箭头"];
        newsImage.backgroundColor = [UIColor clearColor];
        [self addSubview:newsImage];
        [newsImage release];
        
        UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2, 0, 80, 60)];
        newLabel.alpha = 0.6;
        newLabel.text = title;
        newLabel.tag = 2;
        newLabel.textColor = [UIColor whiteColor];
        newLabel.backgroundColor = [UIColor clearColor];
        newLabel.font = font(16);
        [self addSubview:newLabel];
        [newLabel release];
        
    }
    return self;
}

-(void)setSelected:(BOOL)_selected
{
    UIImageView *newsImage = (UIImageView*) [self viewWithTag:1];
    UILabel *newLabel = (UILabel*) [self viewWithTag:2];
    if (_selected) {
        newsImage.transform = CGAffineTransformMakeScale(0.1, 0.1);
        [UIView animateWithDuration:0.25 animations:^(){
            newLabel.font = bold_font(20);
            newLabel.alpha = 1.0f;
            newsImage.transform = CGAffineTransformMakeScale(2, 2);
        } completion:^(BOOL flag){
            //        newLabel.transform = CGAffineTransformMakeScale(1.2, 1.2);
            newsImage.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }];
    }else{
        newsImage.transform = CGAffineTransformMakeScale(0.1, 0.1);
        [UIView animateWithDuration:0.25 animations:^(){
            newLabel.font = font(16);
            newLabel.alpha = 0.6f;
            newsImage.transform = CGAffineTransformMakeScale(1.3, 1.3);
        } completion:^(BOOL flag){
            //        newLabel.transform = CGAffineTransformMakeScale(1.2, 1.2);
            newsImage.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }
    
}

@end
