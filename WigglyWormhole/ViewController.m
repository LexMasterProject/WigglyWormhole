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
    _nsTimer=[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(update) userInfo:nil repeats:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)update
{
    [self.game update];
   // self.gameScene.wormPosx=self.game.wormPosX;
  //  self.gameScene.wormPosy=self.game.wormPosY;
   // [self.gameScene setNeedsDisplay];
    
}
- (IBAction)pressUp:(id)sender {
    [self.game wormUp];
    [UIView beginAnimations:@"movingspookily" context:nil];
    [UIView setAnimationDuration:5];
    [self.gameScene.wormView moveUp];
    [UIView commitAnimations];
}
- (IBAction)pressRight:(id)sender {
     [self.game wormRight];
    [UIView beginAnimations:@"movingspookily" context:nil];
    [UIView setAnimationDuration:5];
    [self.gameScene.wormView moveRight];
    [UIView commitAnimations];
}

- (IBAction)pressDown:(id)sender {
    [self.game wormDown];
    //todo
    [UIView beginAnimations:@"movingspookily" context:nil];
    [UIView setAnimationDuration:5];
    [self.gameScene.wormView moveDown];
    [UIView commitAnimations];
}

- (IBAction)pressLeft:(id)sender {
    [self.game wormLeft];
    [UIView beginAnimations:@"movingspookily" context:nil];
    [UIView setAnimationDuration:5];
    [self.gameScene.wormView moveLeft];
    [UIView commitAnimations];
}

- (IBAction)updateMapTest:(id)sender {
    NSLog(@"update map test");
    if (self.gameScene.wormView.alpha) {
        [UIView animateWithDuration:2 animations:^{
            self.gameScene.wormView.alpha=0.0;
        }];
    }else
    {
    [UIView animateWithDuration:2 animations:^{
        self.gameScene.wormView.alpha=1;
    }];
    }
 
  
}
@end
