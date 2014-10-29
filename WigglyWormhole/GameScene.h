//
//  GridCell.h
//  WigglyWormhole
//
//  Created by Alex on 21/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface GameScene : UIView

-(id)initWithFrame:(CGRect)frame withMap:(NSMutableArray*)map;


@property (assign) int wormPosx;
@property (assign) int wormPosy;

@property (weak) NSMutableArray*map;



@end
