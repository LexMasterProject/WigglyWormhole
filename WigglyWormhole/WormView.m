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

-(void)moveDown
{
    self.center=CGPointMake(RAND_FROM_TO(0, 300), RAND_FROM_TO(0, 300));
}
@end
