//
//  Game.h
//  WigglyWormhole
//
//  Created by Alex on 21/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDataModel.h"

@interface Game : NSObject

@property (strong) NSString*title;
@property (strong) NSMutableArray*map;
@property (assign) int score;
@property (assign) int speed;
@property (assign) int everyStepScore;
@property (assign) int wormDirection;
@property (assign) int isWormDead;
@property (assign) int mushroomNum;
@property (assign) int wormholeNum;
@property (strong) AppDataModel*appdataModel;
@property (strong) NSMutableArray*headPosArr;


-(id)initWithCofig:(AppDataModel*)appModel;
-(void)update;
-(void)wormDown;
-(void)wormUp;
-(void)wormLeft;
-(void)wormRight;
-(void)initMap;



@end
