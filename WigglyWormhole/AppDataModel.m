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
   
    if (_mushroomNum==0) {
        _mushroomNum=DEFAULT_MUSHROOM_NUMBER;

    }
    if (_speed==0) {
        _speed=2;
    }
    NSLog(@"load defaults");
    
    }
    


-(void)saveDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_scoreBoard forKey:@"scoreboard"];
    [defaults setInteger:_mushroomNum forKey:@"mushroomNum"];
    [defaults setInteger:_speed forKey:@"speed"];
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
