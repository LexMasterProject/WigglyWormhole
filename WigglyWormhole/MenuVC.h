//
//  MenuVC.h
//  WigglyWormhole
//
//  Created by Alex on 07/11/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuVC.h"
#import "AppDataModel.h"
#import "ModalViewControllerDelegate.h"

@interface MenuVC : UIViewController<ModalViewControllerDelegate>

@property (strong)AppDataModel*appDataModel;

@end
