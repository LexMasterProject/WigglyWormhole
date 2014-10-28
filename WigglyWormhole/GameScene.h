//
//  GridCell.h
//  WigglyWormhole
//
//  Created by Alex on 21/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WormView.h"


@interface GameScene : UIView

-(id)initWithFrame:(CGRect)frame withMap:(NSMutableArray*)map;

@property (strong) WormView*wormView;
@property (assign) int wormPosx;
@property (assign) int wormPosy;

@property (weak) NSMutableArray*map;



@end
