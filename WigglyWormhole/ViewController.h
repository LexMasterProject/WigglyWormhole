//
//  ViewController.h
//  WigglyWormhole
//
//  Created by Alex on 21/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "GameScene.h"

@interface ViewController : UIViewController

@property (strong)Game*game;
@property (strong) GameScene*gameScene;
@property (strong) NSTimer*nsTimer;


@property (weak, nonatomic) IBOutlet UILabel *uiGameTitle;

@property (weak, nonatomic) IBOutlet UILabel *uiGameScore;

- (IBAction)pressUp:(id)sender;

- (IBAction)pressRight:(id)sender;

- (IBAction)pressDown:(id)sender;

- (IBAction)pressLeft:(id)sender;

- (IBAction)updateMapTest:(id)sender;



@end

