//
//  Card.h
//  Matchismo_t
//
//  Created by 鹏 刘 on 2017/7/10.
//  Copyright © 2017年 鹏 刘. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (nonatomic,getter = isFaceUp) BOOL faceUp;
@property (nonatomic,getter = isUnPlayable) BOOL unPlayable;
@property (nonatomic,strong) NSString *contents;

- (int)matchCard:(NSArray *)otherCards;
@end
