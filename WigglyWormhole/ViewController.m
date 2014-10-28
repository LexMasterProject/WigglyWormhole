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
    
    //gameScene adjust
    _gameScene.transform=CGAffineTransformScale(_gameScene.transform, 0.8, 0.8);
    _gameScene.transform=CGAffineTransformTranslate(_gameScene.transform, -35, -60);
    
    
    
    [self.view addSubview:_gameScene];
    _nsTimer=[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(update) userInfo:nil repeats:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)update
{
   
  
    self.game.wormPosX=[self.gameScene.wormView getPosX];
    self.game.wormPosY=[self.gameScene.wormView getPosY];
    [self.game update];
    
   // self.gameScene.wormPosx=self.game.wormPosX;
  //  self.gameScene.wormPosy=self.game.wormPosY;
   // [self.gameScene setNeedsDisplay];
    
}
//#define ANIMATION_WORM_OPTIONS (UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState)
- (IBAction)pressUp:(id)sender {
    [self.game wormUp];
    [self.gameScene.wormView pause];
    double length=self.gameScene.wormView.getPosY-10;
    [UIView animateWithDuration:length/self.game.wormSpeed delay:0 options:ANIMATION_WORM_OPTIONS
                     animations:^{
                           [self.gameScene.wormView moveUp];
                     } completion:^(BOOL finished) {
                         
                     }];
}
- (IBAction)pressRight:(id)sender {
    [self.game wormRight];
    [self.gameScene.wormView pause];
    double length=SCENE_WIDTH-self.gameScene.wormView.getPosX-10;
    [UIView animateWithDuration:length/self.game.wormSpeed delay:0 options:ANIMATION_WORM_OPTIONS
                     animations:^{
                         [self.gameScene.wormView moveRight];
                     } completion:^(BOOL finished) {
                         
                     }];
}

- (IBAction)pressDown:(id)sender {
    [self.game wormDown];
    [self.gameScene.wormView pause];
    double length=SCENE_HEIGHT-self.gameScene.wormView.getPosY-10;
    [UIView animateWithDuration:length/self.game.wormSpeed delay:0 options:ANIMATION_WORM_OPTIONS
                     animations:^{
                         [self.gameScene.wormView moveDown];
                     } completion:^(BOOL finished) {
                         
                     }];
}

- (IBAction)pressLeft:(id)sender {
    [self.game wormLeft];
    [self.gameScene.wormView pause];
    double length=self.gameScene.wormView.getPosX-10;
    [UIView animateWithDuration:length/self.game.wormSpeed delay:0 options:ANIMATION_WORM_OPTIONS
                     animations:^{
                         [self.gameScene.wormView moveLeft];
                     } completion:^(BOOL finished) {
                         
                     }];
}

- (IBAction)updateMapTest:(id)sender {
    NSLog(@"map reset");
}



- (IBAction)wormDead:(id)sender {
    NSLog(@"worm dead");
}
@end
