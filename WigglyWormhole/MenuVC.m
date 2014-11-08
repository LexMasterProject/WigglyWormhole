//
//  MenuVC.m
//  WigglyWormhole
//
//  Created by Alex on 07/11/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "MenuVC.h"
#import "ScoreBoardVC.h"

@interface MenuVC ()

@end

@implementation MenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _appDataModel=[[AppDataModel alloc]init];
    [_appDataModel loadDefaults];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"goTopTen"])
    {
        ScoreBoardVC*vc=[segue destinationViewController];
        vc.delegate=self;
        self.appDataModel.speed=5;
        vc.appDataModel=self.appDataModel;
    }
}

-(void)dismiss
{
    [self.view setNeedsDisplay];
   // [self dismissViewControllerAnimated:YES ];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
