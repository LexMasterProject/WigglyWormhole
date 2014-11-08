//
//  AppDataModel.h
//  WigglyWormhole
//
//  Created by Alex on 07/11/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDataModel : NSObject

@property (strong) NSMutableArray*scoreBoard;
@property (assign) int speed;
@property (assign) int wormholes;
@property (assign) int mushroomNum;
@property (assign) int everyStepScore;
@property (strong) NSString*usrName;




-(void)updateEveryStepScore;
-(BOOL)isTopTen:(int)score;
-(void)updateTopTen:(int)score;
-(void)loadDefaults;
-(void)saveDefaults;
@end
