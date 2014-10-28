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



@implementation Game
{
    int xSpecialPoints[14];
    int ySpecialPoints[20];
}

-(id)init
{
    if (self=[super init]) {
        _title=GAME_TITLE;
        _score=0;
        _wormDirection=DOWN;
        _wormSpeed=35;
        _wormPosX=10+SCENE_WIDTH/2;
        _wormPosY=-10+SCENE_HEIGHT/2;
        
        for (int i=0; i<14; i++) {
            xSpecialPoints[i]=10+20*i;
        }
        for (int j=0; j<20; j++) {
            ySpecialPoints[j]=10+20*j;
        }
        [self initMap];
        
        
    }
    return self;
}

-(void) initMap
{
    NSLog(@"here!");
    _map=[NSMutableArray arrayWithCapacity:20];
    for (int i=0; i<20; i++) {
        NSMutableArray*line=[NSMutableArray arrayWithCapacity:14];
        [_map addObject:line];
        for (int j=0; j<14; j++) {
            [line addObject:[NSNumber numberWithInt:0]];
        }
    }
    
    
    for (int i=0; i<WORM_HOLE_NUMBER;) {
        int x=RAND_FROM_TO(0, 19);
        int y=RAND_FROM_TO(0, 13);
        if ([_map[x][y] integerValue]==GRASS_LAND_INDEX) {
            _map[x][y]=[NSNumber numberWithInt:WORM_HOLE_INDEX];
            i++;
        }
    }
    
    for (int i=0; i<MUSHROOM_NUMBER; ) {
        int x=RAND_FROM_TO(0, 19);
        int y=RAND_FROM_TO(0, 13);
        if ([_map[x][y] integerValue]==GRASS_LAND_INDEX) {
            _map[x][y]=[NSNumber numberWithInt:MUSHROOM_INDEX];
            i++;
        }

    }
    
}

-(int) isYOnTrack:(int) y
{
    for (int i=0; i<14; i++) {
        if (y==ySpecialPoints[i]) {
            return 1;
        }
    }
    return 0;
}
-(int) isXOnTrack:(int)x
{
    for (int j=0; j<20; j++) {
        if (x==xSpecialPoints[j]) {
            return 1;
        }
    }
    return 0;
}

-(void)update
{
    NSLog(@"worm (x:%d,y:%d)",_wormPosX,_wormPosY);
    _score+=10;
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
