//
//  AddViewController.m
//  Todo
//
//  Created by Stephen Johnson on 8/17/16.
//  Copyright © 2016 Nazca. All rights reserved.
//

#import "AddVC.h"
#import "TodoItem.h"
#import "Settings.h"
#import "AppConstants.h"

@interface AddVC() <UITextFieldDelegate> {
    TodoItem * item;
    BOOL textIsDirty;
    BOOL isEditing;
    NSInteger editedIndex;
}
@end

@implementation AddVC

- (void) viewDidLoad {
    isEditing = [[NSUserDefaults standardUserDefaults] boolForKey:NAVIGATION_FLAGS_EDIT];
    if(isEditing == YES) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:NAVIGATION_FLAGS_EDIT];
        editedIndex = [[NSUserDefaults standardUserDefaults] integerForKey:KEY_ITEM_INDEX];
        item = [[Settings sharedSettings] getItemsArray][editedIndex];
    }
    else {
        item = [[TodoItem alloc] init];
        item.title = @"";
        item.priority = kTodoItemNow;
    }
    [self updateUI];
}

//MARK: IBAction methods
- (IBAction) saveAndFinish {
    item.title = self.titleTextField.text;
    
    if(item.title.length == 0) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Warning" message:@"No Title Entered" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else {
        if(isEditing) {
            Settings * settings = [Settings sharedSettings];
            [settings removeItem:[settings getItemsArray][editedIndex]];
        }
        [[Settings sharedSettings] addItem:item];
        [self exitViewController];
    }
}

- (IBAction) dismissKeyboard {
    [self.titleTextField resignFirstResponder];
}

- (IBAction) cancel {
    [self exitViewController];
}

- (IBAction) priorityChanged:(UIStepper*)stepper {
    item.priority = stepper.value;
    [self updateData];
    [self updateUI];
}

//MARK: UITextField functions
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    textIsDirty = YES;
    return YES;
}

//MARK: Custom functions
- (void) updateData {
    if (!textIsDirty) {
        return;
    }
    item.title = self.titleTextField.text;
}

- (void) updateUI {
    self.titleTextField.text = item.title;
    self.priorityLabel.text = [NSString stringWithFormat:@"%i: %@", (int)item.priority, item.nameForPriority];
}

- (void) exitViewController; {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
