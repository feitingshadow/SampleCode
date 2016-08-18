//
//  AddViewController.h
//  Todo
//
//  Created by Stephen Johnson on 8/17/16.
//  Copyright © 2016 Nazca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddVC : UIViewController

@property (nonatomic, weak) IBOutlet UITextField * titleTextField;
@property (nonatomic, weak) IBOutlet UILabel * priorityLabel;
@property (nonatomic, weak) IBOutlet UIStepper * priorityStepper;

- (IBAction) saveAndFinish;
- (IBAction) cancel;
- (IBAction) dismissKeyboard;
- (IBAction) priorityChanged:(UIStepper*)stepper;

@end
