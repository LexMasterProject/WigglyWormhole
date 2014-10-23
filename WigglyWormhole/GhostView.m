//
//  GhostView.m
//  OneGhost
//
//  Created by Guy Brown on 07/10/2014.
//  Copyright (c) 2014 Guy Brown. All rights reserved.
//

#import "GhostView.h"

@implementation GhostView

-(void)moveToRandomLocation {
	int x = arc4random()%320;
	int y = arc4random()%350;
	self.center = CGPointMake(x,y);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)moveDown:(int) y
{
    int x=self.center.x;
  //  int y=self.frame.origin.y+self.frame.size.height;
    int framex=self.frame.size.width;
    int framey=self.frame.size.height;
    NSLog(@"%d,%d",framex,framey);
    self.center = CGPointMake(x,y);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
