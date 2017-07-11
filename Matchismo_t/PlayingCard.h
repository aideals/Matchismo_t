//
//  PlayingCard.h
//  Matchismo_t
//
//  Created by 鹏 刘 on 2017/7/10.
//  Copyright © 2017年 鹏 刘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card
@property (nonatomic,strong) NSString *suit;
@property (nonatomic) NSInteger rank;

+ (NSArray *)validSuits;
+ (NSInteger)maxRank;
@end
