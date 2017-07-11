//
//  CardMatchingGame.h
//  Matchismo_t
//
//  Created by 鹏 刘 on 2017/7/10.
//  Copyright © 2017年 鹏 刘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
@property (nonatomic,readonly) int score;

- (void)flipCardAtIndex:(NSInteger)index;

- (Card *)cardAtIndex:(NSInteger)index;

- (id)initWithCardCount:(NSInteger)cardCount usingDeck:(Deck *)deck;
@end
