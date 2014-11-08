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
    // Do any additional setup after loading the view.
    _nameTextField.delegate = self;
    _nameTextField.text=@"Alex";
    _diffSlider.value=0.5f;
     _diffLabel.text=[NSString stringWithFormat:@"%.2f",_diffSlider.value];
    
    
    int mushroom=_appDataModel.mushroomNum;
    _mushroomLabel.text=[NSString stringWithFormat:@"%d",mushroom];
    _mushroomSlider.value=(float)(mushroom-DEFAULT_MUSHROOM_NUMBER)/DEFAULT_MUSHROOM_NUMBER_MAX;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sliderChanged:(id)sender {
    _diffLabel.text=[NSString stringWithFormat:@"%.2f",_diffSlider.value];
}

- (IBAction)sliderMushroomChanged:(id)sender {
    float sliderValue=self.mushroomSlider.value;
    int mushroom=sliderValue*(DEFAULT_MUSHROOM_NUMBER_MAX-DEFAULT_MUSHROOM_NUMBER)+DEFAULT_MUSHROOM_NUMBER;
    
    self.mushroomLabel.text=[NSString stringWithFormat:@"%d",mushroom];
    
    //update datamodel
    
    self.appDataModel.mushroomNum=mushroom;
}
@end
