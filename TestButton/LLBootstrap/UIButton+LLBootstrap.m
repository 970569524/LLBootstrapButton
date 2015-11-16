//
//  LLBootstrapButton.m
//  MyTest
//
//  Created by admin on 15/7/30.
//  Copyright (c) 2015年 LL. All rights reserved.
//

#import "UIButton+LLBootstrap.h"
#import "NSString+LLBootstrapString.h"


@implementation UIButton(LLBootstrapButton)


/**
 *  基本属性
 */
- (void)buttonBase {
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 4.0;
    self.layer.masksToBounds = YES;
    [self setAdjustsImageWhenHighlighted:NO];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}


- (void)bs_buttonDefault {
    [self buttonBase];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    self.layer.borderColor = [[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1] CGColor];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1]] forState:UIControlStateHighlighted];
    
}

- (void)bs_buttonDefaultEnable:(BOOL)enbale{
    [self bs_buttonDefault];
    if(!enbale) {
        self.userInteractionEnabled = NO;
        self.alpha = 0.647;
    }
}

- (void)bs_buttonPrimary {
    [self buttonBase];
    self.layer.borderColor = [[UIColor colorWithRed:53/255.0 green:126/255.0 blue:189/255.0 alpha:1] CGColor];
    [self setBackgroundColor:[UIColor colorWithRed:66/255.0 green:139/255.0 blue:202/255.0 alpha:1]];
    [self setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:51/255.0 green:119/255.0 blue:172/255.0 alpha:1]] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:51/255.0 green:119/255.0 blue:172/255.0 alpha:0.64]] forState:UIControlStateDisabled];
}

- (void)bs_buttonPrimaryEnable:(BOOL)enbale{
    [self bs_buttonPrimary];
    if(!enbale) {
        self.userInteractionEnabled = NO;
        self.alpha = 0.647;
    }
}

- (void)bs_buttonInfo {
    [self buttonBase];
    self.layer.borderColor = [[UIColor colorWithRed:70/255.0 green:184/255.0 blue:218/255.0 alpha:1] CGColor];
    [self setBackgroundColor:[UIColor colorWithRed:91/255.0 green:192/255.0 blue:222/255.0 alpha:1]];
    [self setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:57/255.0 green:180/255.0 blue:211/255.0 alpha:1]] forState:UIControlStateHighlighted];
}

- (void)bs_buttonInfoEnable:(BOOL)enbale{
    [self bs_buttonInfo];
    if(!enbale) {
        self.userInteractionEnabled = NO;
        self.alpha = 0.647;
    }
}

- (void)bs_buttonSuccess {
    [self buttonBase];
    self.layer.borderColor = [[UIColor colorWithRed:76/255.0 green:174/255.0 blue:76/255.0 alpha:1] CGColor];
    [self setBackgroundColor:[UIColor colorWithRed:92/255.0 green:184/255.0 blue:92/255.0 alpha:1]];
    [self setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:69/255.0 green:164/255.0 blue:84/255.0 alpha:1]] forState:UIControlStateHighlighted];
}

- (void)bs_buttonSuccessEnable:(BOOL)enbale{
    [self bs_buttonSuccess];
    if(!enbale) {
        self.userInteractionEnabled = NO;
        self.alpha = 0.647;
    }
}

- (void)bs_buttonWarning {
    [self buttonBase];
    self.layer.borderColor = [[UIColor colorWithRed:238/255.0 green:162/255.0 blue:54/255.0 alpha:1] CGColor];
    [self setBackgroundColor:[UIColor colorWithRed:240/255.0 green:173/255.0 blue:78/255.0 alpha:1]];
    [self setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:237/255.0 green:155/255.0 blue:67/255.0 alpha:1]] forState:UIControlStateHighlighted];
}

- (void)bs_buttonWarningEnable:(BOOL)enbale{
    [self bs_buttonWarning];
    if(!enbale) {
        self.userInteractionEnabled = NO;
        self.alpha = 0.647;
    }
}

- (void)bs_buttonDanger {
    [self buttonBase];
    self.layer.borderColor = [[UIColor colorWithRed:212/255.0 green:63/255.0 blue:58/255.0 alpha:1] CGColor];
    [self setBackgroundColor:[UIColor colorWithRed:217/255.0 green:83/255.0 blue:79/255.0 alpha:1]];
    [self setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:210/255.0 green:48/255.0 blue:51/255.0 alpha:1]] forState:UIControlStateHighlighted];
}

- (void)bs_buttonDangerEnable:(BOOL)enbale{
    [self bs_buttonDanger];
    if(!enbale) {
        self.userInteractionEnabled = NO;
        self.alpha = 0.647;
    }
}

/**
 *  将UIColor转化成UIImage
 *
 *  @param color 要转化的UIColor
 *
 *  @return 获取到的UIImage
 */
- (UIImage *) imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


- (void)bs_buttonAddIcon:(NSString *)icon isBefore:(BOOL)before{
    [self.titleLabel setFont:[UIFont fontWithName:@"fontawesome" size:self.titleLabel.font.pointSize]];
    NSString *strIcon = [NSString stringWithIcon:icon];
    
    if(self.titleLabel.text) {
        if (before) {
            strIcon = [strIcon stringByAppendingString:[NSString stringWithFormat:@" %@", self.titleLabel.text]];
        } else {
            strIcon = [self.titleLabel.text stringByAppendingString:[NSString stringWithFormat:@" %@", strIcon]];
        }
    }
    [self setTitle:strIcon forState:UIControlStateNormal];
}



@end
