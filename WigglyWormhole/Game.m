//
//  Game.m
//  WigglyWormhole
//
//  Created by Alex on 21/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "Game.h"
#import "Macro.h"

//game constants
#define GAME_TITLE (@"Wiggly Wormhole")
  

@implementation Game

-(id)init
{
    self=[super init];
    if (self) {
        _title=GAME_TITLE;
        _score=0;
        _wormDirection=DOWN;
        _wormSpeed=SPEED;
        _wormPosX=10+SCENE_WIDTH/2;
        _wormPosY=-10+SCENE_HEIGHT/2;
        
    }
    return self;
}

-(void)update
{
    NSLog(@"direction:%d",_wormDirection);
    switch (_wormDirection) {
        case UP:
            _wormPosY-=_wormSpeed;
            break;
        case DOWN:
            _wormPosY+=_wormSpeed;
            break;
        case RIGHT:
            _wormPosX+=_wormSpeed;
            break;
        case LEFT:
            _wormPosX-=_wormSpeed;
            break;
        default:
            break;
    }
    NSLog(@"x:%d,y:%d:",_wormPosX,_wormPosY);
}

-(void)wormDown
{
    _wormDirection=DOWN;
}
-(void)wormUp
{
    _wormDirection=UP;
}
-(void)wormLeft
{
    _wormDirection=LEFT;
}
-(void)wormRight
{
    _wormDirection=RIGHT;
}
@end
