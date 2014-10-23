//
//  ViewController.m
//  WigglyWormhole
//
//  Created by Alex on 21/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "ViewController.h"
#import "Macro.h"




#define _DEBUG
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initial game
    _game=[[Game alloc]init];
    
    //initial view
    self.view.backgroundColor=[UIColor blackColor];
    self.uiGameTitle.text=_game.title;
    self.uiGameTitle.textColor=[UIColor whiteColor];
    self.uiGameScore.text=[[NSString alloc]initWithFormat:@"%d",_game.score];
    self.uiGameScore.textColor=[UIColor whiteColor];
    
    //initial scene
    CGPoint sceneOrigin=CGPointMake(SCENE_X, SCENE_Y);
    CGSize  sceneSize=CGSizeMake(SCENE_WIDTH, SCENE_HEIGHT);
    CGRect  sceneRect=CGRectMake(sceneOrigin.x, sceneOrigin.y, sceneSize.width, sceneSize.height);
    _gameScene=[[GameScene alloc]initWithFrame:sceneRect];
    _gameScene.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:_gameScene];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressUp:(id)sender {
    NSLog(@"up pressed");
    
}
- (IBAction)pressRight:(id)sender {
     NSLog(@"right pressed");
}

- (IBAction)pressDown:(id)sender {
     NSLog(@"down pressed");
}

- (IBAction)pressLeft:(id)sender {
     NSLog(@"left pressed");
}

- (IBAction)updateMapTest:(id)sender {
    NSLog(@"update map test");
    [UIView beginAnimations:@"movingspookily" context:nil];
    [UIView setAnimationDuration:5];
    [self.gameScene.wormView moveDown];
    [UIView commitAnimations];
  
}
@end
