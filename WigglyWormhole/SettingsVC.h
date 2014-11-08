//
//  SettingsVC.h
//  WigglyWormhole
//
//  Created by Alex on 07/11/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewControllerDelegate.h"
#import "AppDataModel.h"

@interface SettingsVC : UIViewController<UITextFieldDelegate>



@property (weak) id <ModalViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property(strong) AppDataModel*appDataModel;


@property (weak, nonatomic) IBOutlet UILabel *mushroomLabel;
@property (weak, nonatomic) IBOutlet UISlider *mushroomSlider;
- (IBAction)sliderMushroomChanged:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
- (IBAction)speedSliderChanged:(id)sender;




@end
