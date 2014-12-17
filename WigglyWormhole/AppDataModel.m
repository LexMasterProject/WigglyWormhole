//full name:WEI Wuhao
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
    _usrName=[defaults stringForKey:@"usrName"];
   
    if (_mushroomNum==0) {
        _mushroomNum=DEFAULT_MUSHROOM_NUMBER;

    }
    
    if (_speed==0) {
        _speed=DEFAULT_SPEED;
    }
    
    if (_wormholes==0) {
        _wormholes=DEFAULT_WORMHOLES;
    }
    
    if (_scoreBoard==nil) {
        _scoreBoard=[[NSMutableArray alloc]init];
    }
    
    if (_usrName==nil) {
        _usrName=[[NSString alloc]initWithFormat:@"Alex"];
    }
    
    [self updateEveryStepScore];
     NSLog(@"load defaults");
    
    }

-(void)updateEveryStepScore
{
     _everyStepScore=DEFAULT_EVERYSTEPSCORE+
    (self.mushroomNum-DEFAULT_MUSHROOM_NUMBER)
    +(self.speed-DEFAULT_SPEED)*5
    +(self.wormholes-DEFAULT_WORMHOLES)*3;
}

-(void)saveDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_scoreBoard forKey:@"scoreboard"];
    [defaults setInteger:_mushroomNum forKey:@"mushroomNum"];
    [defaults setInteger:_speed forKey:@"speed"];
    [defaults setInteger:_wormholes forKey:@"wormholes"];
    [defaults setObject:_usrName forKey:@"usrName"];
    [defaults synchronize];
    NSLog(@"defaults saved");
}

-(BOOL)isTopTen:(int)score
{
    if ([_scoreBoard count]<10) {
        return true;
    }
    
    int last=[[[_scoreBoard objectAtIndex:9] objectAtIndex:1]integerValue];
    if (score>last) {
        return true;
    }
    return  false;
    
}
-(void)updateTopTen:(int)score
{
    NSArray*cell=[[NSArray alloc]initWithObjects:
                  [[NSString alloc]initWithString:self.usrName],
                  [[NSNumber alloc]initWithInt:score],
                  nil];
    [self.scoreBoard addObject:cell];
    [self.scoreBoard sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        int first=[((NSNumber*)([(NSArray*)obj1 objectAtIndex:1])) integerValue];
        int sec=[((NSNumber*)([(NSArray*)obj2 objectAtIndex:1])) integerValue];
        return first<sec;
    }];
    
    if ([self.scoreBoard count]>10) {
        [self.scoreBoard removeLastObject];
    }
    
    
}


@end
