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

@property (strong) UIImage*landImage;
@property (strong) UIImage*mushroomImage;
@property (strong) UIImage*wormholeImage;


@property (strong) WormView*wormView;
@property (assign) int wormPosx;
@property (assign) int wormPosy;


@end
