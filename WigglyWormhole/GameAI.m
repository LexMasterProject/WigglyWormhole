//full name:WEI Wuhao
//  GameAI.m
//  WigglyWormhole
//
//  Created by Alex on 09/11/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "GameAI.h"
#import "Macro.h"

@implementation GameAI
-(int)shouldMoveDirection
{
    int flag=DOWN;
    if ([self.map count]&&[self.headpos count]) {
        
       
        int x=[[self.headpos objectAtIndex:0]integerValue];
        int y=[[self.headpos objectAtIndex:1]integerValue];
        
        
        int upEmptyNum=0;
        int downEmptyNum=0;
        int leftEmptyNum=0;
        int rightEmptyNum=0;
        
        //store wormface environment
        NSMutableArray*xarr=[[NSMutableArray alloc]init];
        NSMutableArray*yarr=[[NSMutableArray alloc]init];
        for (int i=0; i<[self.map count]; i++) {
            for (int j=0; j<[[self.map objectAtIndex:i]count]; j++) {
                if (i==x) {
                    int index=[[[self.map objectAtIndex:i]objectAtIndex:j]integerValue];
                    [xarr addObject:[NSNumber numberWithInt:index]];
                }
                if (j==y) {
                    int index=[[[self.map objectAtIndex:i]objectAtIndex:j]integerValue];
                    [yarr addObject:[NSNumber numberWithInt:index]];
                }
            }
        }
        
       
        
        //detect left spaces
        for (int i=y-1; i>=0; i--) {
            if ([[xarr objectAtIndex:i]integerValue]==0) {
                leftEmptyNum++;
            }
            else
            {
                break;
            }
        }
        //detect right spaces
        for (int i=y+1; i<[xarr count]-1; i++) {
            
            if ([[xarr objectAtIndex:i]integerValue]==0) {
                rightEmptyNum++;
            }
            else
            {
                break;
            }

        }
        //detect up spaces
        for (int j=x-1; j>=0; j--) {
            if ([[yarr objectAtIndex:j]integerValue]==0) {
                upEmptyNum++;
            }
            else
            {
                break;
            }
        }
        //detect down spaces
        for (int j=x+1; j<[yarr count]; j++) {
            if ([[yarr objectAtIndex:j]integerValue]==0) {
                downEmptyNum++;
            }
            else
            {
                break;
            }
        }
        
        switch (_lastOp) {
            case UP:
                downEmptyNum=0;
                break;
            case RIGHT:
                leftEmptyNum=0;
                break;
            case LEFT:
                rightEmptyNum=0;
            case DOWN:
                upEmptyNum=0;
                break;
        }
        int max=[self maxwithFirst:
                     [self maxwithFirst:rightEmptyNum Second:leftEmptyNum]
                 Second:
                     [self maxwithFirst:upEmptyNum Second:downEmptyNum]
                 ];
      
        
      
        if (max==0) {
            //aliasing in case of index out of bound
            int xcount=[self.map count];
            int ycount=[[self.map objectAtIndex:0]count];
            int upPos=(x-1>=0)?(x-1):x;
            int downPos=(x+1>=xcount)?x:(x+1);
            int rightPos=(y+1>=ycount)?y:(y+1);
            int leftPos=(y-1>=0)?(y-1):y;
            
            if ([self isMushroomWithX:upPos andY:y]) {
                _lastOp=UP;
                return UP;
            }
            if ([self isMushroomWithX:downPos andY:y]) {
                _lastOp=DOWN;
                return DOWN;
            }
            if ([self isMushroomWithX:x andY:rightPos]) {
                _lastOp=RIGHT;
                return RIGHT;
            }
            if ([self isMushroomWithX:x andY:leftPos]) {
                _lastOp=LEFT;
                return LEFT;
            }
           
           
        }
        if (max==rightEmptyNum)
        {
            flag= RIGHT;
        }
        else if(max==leftEmptyNum)
        {
            
            flag= LEFT;
        }
        else if(max==upEmptyNum)
        {
            
            flag= UP;
        }
        else if(max==downEmptyNum)
        {
            
            flag= DOWN;
        }
        
    }
    _lastOp=flag;
    return flag;
    
}

-(int)isMushroomWithX:(int)x andY:(int)y
{
    if ([[[self.map objectAtIndex:x]objectAtIndex:y]integerValue]==MUSHROOM_INDEX) {
        return 1;
    }
    return 0;
}
-(int)maxwithFirst:(int)a Second:(int)b
{
    return (a>b)?a:b;
}

@end
