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
    NSMutableArray*_wormArr;
    NSMutableArray*_emptyCell;
    
}


-(id)init
{
    if (self=[super init]) {
        _title=GAME_TITLE;
        _score=0;
        _wormDirection=DOWN;
        
        
         NSMutableArray*head=[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:10],
             [NSNumber numberWithInt:7],
                              nil];
        
        _wormArr=[NSMutableArray arrayWithObjects:
                  head,
                  nil];
        
        
        _emptyCell=[NSMutableArray arrayWithCapacity:SCENE_CELLS_X*SCENE_CELLS_Y];
        for (int i=0; i<SCENE_CELLS_Y*SCENE_CELLS_X; i++) {
            [_emptyCell addObject:[NSNumber numberWithInt:i]];
        }
       [self initMap];
        
      
        
        _isWormDead=0;
        
        
        
    }
    return self;
}

-(void) initMap
{
 
    _map=[NSMutableArray arrayWithCapacity:20];
    for (int i=0; i<20; i++) {
        NSMutableArray*line=[NSMutableArray arrayWithCapacity:14];
        [_map addObject:line];
        for (int j=0; j<14; j++) {
            [line addObject:[NSNumber numberWithInt:0]];
        }
    }
    
     [_emptyCell removeObjectAtIndex:10*14+7];
      _map[10][7]=[NSNumber numberWithInt:WORM_FACE_INDEX];
    
    for (int i=0; i<WORM_HOLE_NUMBER;i++) {
        int index=RAND_FROM_TO(0, [_emptyCell count]-1);
        int posInfo=[_emptyCell[index] integerValue];
        int x=posInfo/14;
        int y=posInfo%14;
        
        [_emptyCell removeObjectAtIndex:index];
         _map[x][y]=[NSNumber numberWithInt:WORM_HOLE_INDEX];
        
    }

    for (int i=0; i<MUSHROOM_NUMBER;i++ ) {
        int index=RAND_FROM_TO(0, [_emptyCell count]-1);
        int posInfo=[_emptyCell[index] integerValue];
        int x=posInfo/14;
        int y=posInfo%14;
    
        [_emptyCell removeObjectAtIndex:index];
        _map[x][y]=[NSNumber numberWithInt:MUSHROOM_INDEX];

    }
    
    
    
}
-(void)updateMapAndWormWithNextX:(int)nextx andY:(int)nexty
{
    int headx=[_wormArr[0][0] integerValue];
    int heady=[_wormArr[0][1] integerValue];
    int tailx=[[_wormArr lastObject][0] integerValue];
    int taily=[[_wormArr lastObject][1] integerValue];
    
    switch ([_map[nextx][nexty]integerValue]) {
        case MUSHROOM_INDEX:
            //update map
            _map[nextx][nexty]=[NSNumber numberWithInt:WORM_FACE_INDEX];
            _map[headx][heady]=[NSNumber numberWithInt:WORM_BODY_INDEX];
            //add new head
            [_wormArr insertObject:[NSMutableArray arrayWithObjects:
                                    [NSNumber numberWithInt:nextx],
                                    [NSNumber numberWithInt:nexty],
                                    nil] atIndex:0];
            //leave tail there
            break;
        case GRASS_LAND_INDEX:
        
            //update map
            for (int i=0; i<[_emptyCell count]; i++) {
                if (nextx*14+taily==[_emptyCell[i] integerValue]) {
                    [_emptyCell removeObjectAtIndex:i];
                    break;
                }
            }
            _map[nextx][nexty]=[NSNumber numberWithInt:WORM_FACE_INDEX];
            _map[headx][heady]=[NSNumber numberWithInt:WORM_BODY_INDEX];
            _map[tailx][taily]=[NSNumber numberWithInt:GRASS_LAND_INDEX];
            [_emptyCell addObject:[NSNumber numberWithInt:14*tailx+taily]];
            //add new head
            [_wormArr insertObject:[NSMutableArray arrayWithObjects:
                                    [NSNumber numberWithInt:nextx],
                                    [NSNumber numberWithInt:nexty],
                                    nil] atIndex:0];
            
            //cut tail
            [_wormArr removeLastObject];
            break;
        case WORM_HOLE_INDEX:
        case WORM_BODY_INDEX:
            _wormDirection=DIRECTION_NONE;
        default:
            break;
    }

}
-(void)update
{
    int headx=[_wormArr[0][0] integerValue];
    int heady=[_wormArr[0][1] integerValue];
    int nextx=-1;
    int nexty=-1;
 
    switch (_wormDirection) {
        case UP:
            nexty=heady;
            nextx=headx-1;
            break;
        case DOWN:
            nexty=heady;
            nextx=headx+1;
            break;
        case LEFT:
            nextx=headx;
            nexty=heady-1;
            break;
        case RIGHT:
            nextx=headx;
            nexty=heady+1;
        default:
            break;
    }
    //hit wall detect
    if (nextx<0||nexty<0||nextx>19||nexty>13) {
        _wormDirection=DIRECTION_NONE;
    }
    else
    {
    [self updateMapAndWormWithNextX:nextx andY:nexty];
    _score+=10;
    }
}

-(void)wormDown
{
    _wormDirection=(_wormDirection==UP)?UP:DOWN;
}
-(void)wormUp
{
     _wormDirection=(_wormDirection==DOWN)?DOWN:UP;
}
-(void)wormLeft
{
     _wormDirection=(_wormDirection==RIGHT)?RIGHT:LEFT;
}
-(void)wormRight
{
     _wormDirection=(_wormDirection==LEFT)?LEFT:RIGHT;
}
@end
