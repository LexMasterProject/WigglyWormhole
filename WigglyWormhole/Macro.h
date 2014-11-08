//
//  Macro.h
//  WigglyWormhole
//
//  Created by Alex on 21/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#ifndef WigglyWormhole_Macro_h
#define WigglyWormhole_Macro_h


#define CELL_SIZE 20

#define SCENE_WIDTH (14*20)
#define SCENE_HEIGHT (20*20)
#define SCENE_X 40
#define SCENE_Y 60
#define SCENE_CELLS_X 14
#define SCENE_CELLS_Y 20

//direction
#define UP 0
#define LEFT 1
#define RIGHT 2
#define DOWN 3
#define DIRECTION_NONE 4 //dead here


#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))
#define ANIMATION_WORM_OPTIONS (UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState)

#define GAME_TITLE (@"Wiggly Wormhole")

#define GRASS_LAND_INDEX 0
#define WORM_HOLE_INDEX 1
#define MUSHROOM_INDEX 2
#define WORM_FACE_INDEX 3
#define WORM_BODY_INDEX 4


#define WORM_HOLE_NUMBER 5
//game default
#define DEFAULT_MUSHROOM_NUMBER 56
#define DEFAULT_MUSHROOM_NUMBER_MAX 156
#define DEFAULT_SPEED 2
#define DEFAULT_SPEED_MAX 20
#define DEFAULT_WORMHOLES 5
#define DEFAULT_WORMHOLES_MAX 20
#define DEFAULT_EVERYSTEPSCORE 10





#endif
