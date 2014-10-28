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
{
    int xSpecialPoints[14];
    int ySpecialPoints[20];
    
    int map[20][14];
}

-(id)init
{
    self=[super init];
    if (self) {
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
        
       
        memset(map,0,sizeof(map));
        _mapIndex=(int**)map;
        
        /*
         random generate mushroom&wormhole
         wormhole index=1
        */
        //generate wormhole
        for (int i=0; i<5;i++ ) {
            while (1) {
                int x=RAND_FROM_TO(0, 13);
                int y=RAND_FROM_TO(0, 19);
                if (map[x][y]==0) {
                    map[x][y]=1;
                    break;
                }
            }
        }
        
        /*
         generate mushroom
        */
        for (int i=0; i<56; i++) {
            int x=RAND_FROM_TO(0, 13);
            int y=RAND_FROM_TO(0, 19);
            if (map[x][y]==0) {
                map[x][y]=2;
                break;
            }
        }
    }
    return self;
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
