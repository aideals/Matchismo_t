//
//  ViewController.m
//  Matchismo_t
//
//  Created by 鹏 刘 on 2017/7/10.
//  Copyright © 2017年 鹏 刘. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (nonatomic,strong) CardMatchingGame *game;
@property (nonatomic,strong) UILabel *flipsLabel;
@property (nonatomic,strong) UILabel *scoreLabel;
@property (nonatomic,strong) NSMutableArray *cardButtons;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
}

- (NSMutableArray *)cardButtons
{
    if (!_cardButtons) _cardButtons = [[NSMutableArray alloc] init];
    return _cardButtons;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createLabel];
    [self updateUI];
    NSLog(@"%@",self.view.subviews);
}

- (void)createLabel
{
    self.flipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 600, 100, 55)];
    self.flipsLabel.textColor = [UIColor blackColor];
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    [self.view addSubview:self.flipsLabel];

    self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(270, 600, 100, 55)];
    self.scoreLabel.textColor = [UIColor blackColor];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
    [self.view addSubview:self.scoreLabel];
}

#define x_space 25
#define y_space 45

- (void)updateUI
{
    if (self.cardButtons.count == 0) {
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                [self.cardButtons addObject:btn];
                btn.layer.cornerRadius = 5.0;
                btn.frame = CGRectMake(x_space + (x_space + 60) * j, y_space + (y_space + 95) * i, 70, 95);
                [btn setBackgroundColor:[UIColor colorWithRed:0.3 green:0.7 blue:0.4 alpha:1.0]];
               // [btn setBackgroundColor:[UIColor blueColor]];
                [btn addTarget:self action:@selector(flipCard:) forControlEvents:UIControlEventTouchDown];
                [btn setTitle:@"★" forState:UIControlStateNormal];
                [self.view addSubview:btn];
            }
        }
    }
    else {
        for (UIButton *button in self.cardButtons) {
            Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
            [button setTitle:card.contents forState:UIControlStateSelected];
            [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
            button.selected = card.isFaceUp;
            button.enabled = !card.isUnPlayable;
            button.alpha = card.isUnPlayable ? 0.3 : 1.0;
        }
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
}

- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    NSLog(@"%d",self.flipCount);
}
@end
