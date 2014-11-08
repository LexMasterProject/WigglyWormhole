//
//  AppDataModel.m
//  WigglyWormhole
//
//  Created by Alex on 07/11/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "AppDataModel.h"
#import "Macro.h"

@implementation AppDataModel
-(void)loadDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    _scoreBoard=[[defaults objectForKey:@"scoreboard"]mutableCopy];
    _mushroomNum=[defaults integerForKey:@"mushroomNum"];
    _speed=[defaults integerForKey:@"speed"];
    _wormholes=[defaults integerForKey:@"wormholes"];
   
    if (_mushroomNum==0) {
        _mushroomNum=DEFAULT_MUSHROOM_NUMBER;

    }
    
    if (_speed==0) {
        _speed=DEFAULT_SPEED;
    }
    
    if (_wormholes==0) {
        _wormholes=DEFAULT_WORMHOLES;
    }
    
    [self updateEveryStepScore];
     NSLog(@"load defaults");
    
    }

-(void)updateEveryStepScore
{
     _everyStepScore=DEFAULT_EVERYSTEPSCORE+
    (self.mushroomNum-DEFAULT_MUSHROOM_NUMBER)
    +(self.speed-DEFAULT_SPEED)*2
    +(self.wormholes-DEFAULT_WORMHOLES)*3;
}

-(void)saveDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_scoreBoard forKey:@"scoreboard"];
    [defaults setInteger:_mushroomNum forKey:@"mushroomNum"];
    [defaults setInteger:_speed forKey:@"speed"];
    [defaults setInteger:_wormholes forKey:@"wormholes"];
    [defaults synchronize];
    NSLog(@"defaults saved");
}

-(void)isTopTen
{
    
}
-(void)updateTopTen
{
    
}


@end
