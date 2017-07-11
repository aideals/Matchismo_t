//
//  CardMatchingGame.m
//  Matchismo_t
//
//  Created by 鹏 刘 on 2017/7/10.
//  Copyright © 2017年 鹏 刘. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic) int score;
@property (nonatomic,strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSInteger)cardCount usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < self.cards.count; i++) {
            Card *card = [deck drawRandomCard];
            
            if (!card) {
                self = nil;
            }
            else {
                self.cards[i] = card;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void)flipCardAtIndex:(NSInteger)index
{
    Card *card = [self cardAtIndex:index];

    if (!card.isFaceUp) {
        if (!card.isUnPlayable) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.unPlayable) {
                    int matchScore = [card matchCard:@[otherCard]];
                    if (matchScore) {
                        card.unPlayable = YES;
                        otherCard.unPlayable = YES;
                        self.score += MATCH_BONUS;
                    }
                    else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                  }
                }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
  
}

@end
