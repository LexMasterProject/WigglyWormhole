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
    _gameScene=[[GameScene alloc]initWithFrame:sceneRect withMap:self.game.map];
    _gameScene.map=self.game.map;
    _gameScene.backgroundColor=[UIColor whiteColor];
    
    //gameScene adjust
    _gameScene.transform=CGAffineTransformScale(_gameScene.transform, 0.8, 0.8);
    _gameScene.transform=CGAffineTransformTranslate(_gameScene.transform, -35, -60);
    

    
    [self.view addSubview:_gameScene];
    _nsTimer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(update) userInfo:nil repeats:true];
    
   // [MyManager sharedManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)update
{
   
    [self.game update];
    self.uiGameScore.text=[NSString stringWithFormat:@"%5d",self.game.score];
    self.gameScene.map=self.game.map;
    [self.gameScene setNeedsDisplay];
    
    if (self.game.wormDirection==DIRECTION_NONE) {
        NSLog(@"worm dead");
        NSString*alertMsg=[NSString stringWithFormat:@"You scored %d",self.game.score];
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"Oh no, you died!"
                                                      message:alertMsg
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
        
        [alert show];
        [_nsTimer invalidate];
    }
    
}
//#define ANIMATION_WORM_OPTIONS (UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState)
- (IBAction)pressUp:(id)sender {
    [self.game wormUp];
   
  
}
- (IBAction)pressRight:(id)sender {
    [self.game wormRight];

}

- (IBAction)pressDown:(id)sender {
    [self.game wormDown];
   
}

- (IBAction)pressLeft:(id)sender {
    [self.game wormLeft];
   
}

- (IBAction)updateMapTest:(id)sender {
    NSLog(@"map reset");
}



- (IBAction)wormDead:(id)sender {
    NSLog(@"worm dead");
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"Oh no, you died!"
                                      message:@"You dead!"
                                     delegate:self
                            cancelButtonTitle:@"OK"
                            otherButtonTitles:nil];
    
    [alert show];
}

-(void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:    (NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        NSLog(@"press ok");
         _game=[[Game alloc]init];
          _nsTimer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(update) userInfo:nil repeats:true];
    }
}


@end
