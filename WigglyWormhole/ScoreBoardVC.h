//
//  ScoreBoardVC.h
//  WigglyWormhole
//
//  Created by Alex on 07/11/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreBoardVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property(strong) NSMutableArray*scores;

@end
