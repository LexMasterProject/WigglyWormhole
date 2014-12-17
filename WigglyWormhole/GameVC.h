//full name:WEI Wuhao
//  ViewController.h
//  WigglyWormhole
//
//  Created by Alex on 21/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "GameScene.h"
#import "ModalViewControllerDelegate.h"
#import "AppDataModel.h"
#import "GameAI.h"

@interface GameVC : UIViewController<UIGestureRecognizerDelegate>

@property (strong)Game*game;
@property (strong) GameScene*gameScene;
@property (strong) NSTimer*nsTimer;
@property (strong) NSTimer*nsCountDown;
@property (strong) UILabel*countDownLabel;
@property (assign) int countDownSec;
@property (weak) id <ModalViewControllerDelegate> delegate;
@property(strong) AppDataModel*appDataModel;
@property (assign) BOOL aiEnabled;
@property (strong) GameAI*gameAI;


@property (weak, nonatomic) IBOutlet UILabel *uiGameTitle;

@property (weak, nonatomic) IBOutlet UILabel *uiGameScore;

- (IBAction)pressUp:(id)sender;

- (IBAction)pressRight:(id)sender;

- (IBAction)pressDown:(id)sender;

- (IBAction)pressLeft:(id)sender;



- (IBAction)wormDead:(id)sender;

-(void)swipeLeft;
-(void)swipeRight;
-(void)swipeDown;
-(void)swipeUp;


@end

