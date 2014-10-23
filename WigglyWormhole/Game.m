//
//  Game.m
//  WigglyWormhole
//
//  Created by Alex on 21/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "Game.h"

//game constants
#define GAME_TITLE (@"Wiggly Wormhole")
  

@implementation Game

-(id)init
{
    self=[super init];
    if (self) {
        _title=GAME_TITLE;
        _score=0;
    }
    return self;
}
@end
