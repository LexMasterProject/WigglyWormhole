//
//  SettingsVC.m
//  WigglyWormhole
//
//  Created by Alex on 07/11/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "SettingsVC.h"
#import "Macro.h"

@interface SettingsVC ()

@end

@implementation SettingsVC

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    NSLog(@"text");
    return NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //init settings vc
    
    //init namefield
    _nameTextField.delegate = self;
    _nameTextField.text=@"Alex";
    
    //init mushroom
    int mushroom=_appDataModel.mushroomNum;
    _mushroomLabel.text=[NSString stringWithFormat:@"%d",mushroom];
    _mushroomSlider.value=(float)(mushroom-DEFAULT_MUSHROOM_NUMBER)/(DEFAULT_MUSHROOM_NUMBER_MAX-DEFAULT_MUSHROOM_NUMBER);
    
    //init speed
    int speed=_appDataModel.speed;
    _speedLabel.text=[NSString stringWithFormat:@"%d",speed];
    _speedSlider.value=(float)(speed-DEFAULT_SPEED)/(DEFAULT_SPEED_MAX-DEFAULT_SPEED);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



- (IBAction)sliderMushroomChanged:(id)sender {
    float sliderValue=self.mushroomSlider.value;
    int mushroom=sliderValue*(DEFAULT_MUSHROOM_NUMBER_MAX-DEFAULT_MUSHROOM_NUMBER)+DEFAULT_MUSHROOM_NUMBER;
    
    self.mushroomLabel.text=[NSString stringWithFormat:@"%d",mushroom];
    
    //update datamodel
    self.appDataModel.mushroomNum=mushroom;
}
- (IBAction)speedSliderChanged:(id)sender {
    
    float sliderValue=self.speedSlider.value;
    int speed=sliderValue*(DEFAULT_SPEED_MAX-DEFAULT_SPEED)+DEFAULT_SPEED;
    
    self.speedLabel.text=[NSString stringWithFormat:@"%d",speed];
    
    //update datamodel
    self.appDataModel.speed=speed;
}
@end
