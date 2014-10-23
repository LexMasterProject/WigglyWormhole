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

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _land=[UIImage imageNamed:@"emptycell.png"];
      
        
       
        
        UIImage *warmFaceImage = [UIImage imageNamed:@"wormface.png"];
        _wormView=[[WormView alloc]initWithImage:warmFaceImage];
        _wormView.center=CGPointMake(10+SCENE_WIDTH/2, -10+SCENE_HEIGHT/2);
        
        [self addSubview:_wormView];
        
        
       
        NSLog(@"loaded image");
        NSLog(@"%f",self.land.size.width);
        /*
        [UIView beginAnimations:@"start moving" context:nil];
        [self.wormView moveDown];
        [UIView setAnimationDuration:0.2];
        [UIView commitAnimations];
         */
        
        
    }

    
    return self;
}

-(void) drawWorm
{
    _wormView.center=CGPointMake(_wormPosx, _wormPosy);
}
- (void)drawLand
{
    
    for (int i=0; i<SCENE_CELLS_X; i++)
    {
        for (int j=0; j<SCENE_CELLS_Y; j++) {
            
            [self.land drawAtPoint:CGPointMake(i*CELL_SIZE, j*CELL_SIZE)];
        }
    }
    
    
   
}

- (void)drawRect:(CGRect)rect
{
    [self drawLand];
    [self drawWorm];
}


@end
