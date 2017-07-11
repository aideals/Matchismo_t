//
//  ViewController.h
//  Matchismo_t
//
//  Created by 鹏 刘 on 2017/7/10.
//  Copyright © 2017年 鹏 刘. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardGameViewController : UIViewController
@property (nonatomic,assign) int flipCount;

- (IBAction)flipCard:(UIButton *)sender;
@end

