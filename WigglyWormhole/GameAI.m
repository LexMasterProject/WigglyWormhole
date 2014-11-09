//
//  GameAI.m
//  WigglyWormhole
//
//  Created by Alex on 09/11/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "GameAI.h"

@implementation GameAI
-(int)shouldMoveDirection
{
  
    if ([self.map count]&&[self.headpos count]) {
        int x=[[self.headpos objectAtIndex:0]integerValue];
        int y=[[self.headpos objectAtIndex:1]integerValue];
        
        
        int upEmptyNum=0;
        int downEmptyNum=0;
        int leftEmptyNum=0;
        int rightEmptyNum=0;
        
        NSLog(@"%d",[[[self.map objectAtIndex:x]objectAtIndex:y]integerValue]);
        
        
        
        
        
    }
  
    return 3;
    
}

@end
