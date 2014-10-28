//
//  MyManager.m
//  WigglyWormhole
//
//  Created by Alex on 28/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "MyManager.h"
#import "Macro.h"

@implementation MyManager
{
    int map[20][14];
}

+(id)sharedManager
{
    static MyManager*sharedMyManager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(
                           &onceToken,
    ^{
        sharedMyManager=[[self alloc]init];
    }
                           );
    return sharedMyManager;
}

-(id)init
{
    if (self=[super init]) {
        memset(map,0,sizeof(map));
        _mapIndex=(int**)map;
        
        /*
         random generate mushroom&wormhole
         wormhole index=1
         */
        //generate wormhole
        for (int i=0; i<5;i++ )
        {
            while (1)
            {
                int x=RAND_FROM_TO(0, 13);
                int y=RAND_FROM_TO(0, 19);
                if (map[x][y]==0)
                {
                    map[x][y]=1;
                    break;
                }
            }
        }
        /*
         generate mushroom
         */
        for (int i=0; i<56; i++)
        {
            int x=RAND_FROM_TO(0, 13);
            int y=RAND_FROM_TO(0, 19);
            while(1)
            {
                if (map[x][y]==0)
                {
                    map[x][y]=2;
                    break;
                }
            }

        }
        _mapIndex=(int**)map;
    }
    return self;
}

@end


