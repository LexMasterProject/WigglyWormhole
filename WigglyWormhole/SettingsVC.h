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

@property (weak, nonatomic) IBOutlet UILabel *diffLabel;
@property (weak, nonatomic) IBOutlet UISlider *diffSlider;
@property (weak) id <ModalViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property(strong) AppDataModel*appDataModel;

- (IBAction)sliderChanged:(id)sender;

@end
