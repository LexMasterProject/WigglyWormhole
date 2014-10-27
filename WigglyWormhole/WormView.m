//
//  WormView.m
//  WigglyWormhole
//
//  Created by Alex on 22/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "WormView.h"
#import "Macro.h"

@implementation WormView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
}

-(void)pause
{
  
    self.frame=[self.layer.presentationLayer frame];
    [self.layer removeAllAnimations];

}
-(void)moveDown
{
    self.center=CGPointMake(self.center.x,SCENE_HEIGHT-10);
}
-(void)moveUp
{
     self.center=CGPointMake(self.center.x,10);
}
-(void)moveLeft
{
    self.center=CGPointMake(10,self.center.y);
}
-(void)moveRight
{
       self.center=CGPointMake(SCENE_WIDTH-10,self.center.y);
}
-(int)getPosX
{
    return [self.layer.presentationLayer frame].origin.x+10;
}
-(int)getPosY
{
     return [self.layer.presentationLayer frame].origin.y+10;
}
@end
