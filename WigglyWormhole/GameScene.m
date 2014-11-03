//
//  GridCell.m
//  WigglyWormhole
//
//  Created by Alex on 21/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "GameScene.h"
#import "Macro.h"

@implementation GameScene
{
   //image resources
   UIImage*_landImage;
   UIImage*_mushroomImage;
   UIImage*_wormholeImage;
   UIImage*_wormFaceImage;
   UIImage*_wormBodyImage;
}

-(id)initWithFrame:(CGRect)frame withMap:(NSMutableArray*)map
{
    self=[super initWithFrame:frame];
    if (self) {
        
        //load images
        _landImage=[UIImage imageNamed:@"emptycell.png"];
        _mushroomImage=[UIImage imageNamed:@"shroomcell.png"];
        _wormholeImage=[UIImage imageNamed:@"wormholecell.png"];
        _wormFaceImage = [UIImage imageNamed:@"wormface.png"];
        _wormBodyImage=[UIImage imageNamed:@"snakecell.png"];
      
       
       
        _map=map;
    }

    
    return self;
}


- (void)drawLand
{
    for (int i=0; i<SCENE_CELLS_Y; i++)
    {
        for (int j=0; j<SCENE_CELLS_X; j++)
        {
            switch ([_map[i][j] integerValue]) {
                case GRASS_LAND_INDEX:
                    [_landImage drawAtPoint:CGPointMake(j*CELL_SIZE,i*CELL_SIZE)];
                    break;
                case WORM_HOLE_INDEX:
                    [_wormholeImage drawAtPoint:CGPointMake(j*CELL_SIZE,i*CELL_SIZE)];
                    break;
                case MUSHROOM_INDEX:
                     [_mushroomImage drawAtPoint:CGPointMake(j*CELL_SIZE,i*CELL_SIZE)];
                    break;
                case WORM_FACE_INDEX:
                     [_wormFaceImage drawAtPoint:CGPointMake(j*CELL_SIZE,i*CELL_SIZE)];
                    break;
                case WORM_BODY_INDEX:
                    [_wormBodyImage drawAtPoint:CGPointMake(j*CELL_SIZE,i*CELL_SIZE)];
                    break;
                default:
                    break;
            }

        }
    }
    
}

- (void)drawRect:(CGRect)rect
{
    [self drawLand];
   
}


@end
