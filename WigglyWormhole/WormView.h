//
//  WormView.h
//  WigglyWormhole
//
//  Created by Alex on 22/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WormView : UIImageView

-(void)moveDown;
-(void)moveUp;
-(void)moveLeft;
-(void)moveRight;
-(void)pause;

@property (strong)UIImage*wormImage;


@end
