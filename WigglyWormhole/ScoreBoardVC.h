//full name:WEI Wuhao
//  ScoreBoardVC.h
//  WigglyWormhole
//
//  Created by Alex on 07/11/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDataModel.h"
#import "ModalViewControllerDelegate.h"

@interface ScoreBoardVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak) id <ModalViewControllerDelegate> delegate;
@property(strong) NSMutableArray*scores;


@end
