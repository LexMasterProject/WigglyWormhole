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
    static int a=0;
    a++;
    a=a%4;
    return a;
    
}

@end
