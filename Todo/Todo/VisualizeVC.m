//
//  VisualizeVC.m
//  Todo
//
//  Created by Stephen Johnson on 8/18/16.
//  Copyright © 2016 Nazca. All rights reserved.
//

#import "VisualizeVC.h"
#import "AppConstants.h"
#import "Settings.h"

@implementation VisualizeVC
{
}

- (void) viewDidLoad {
    [self setupContainers];
    [self setupLabels];
}

- (void) setupContainers {
    self.nowViewContainer.backgroundColor = [TodoItem getStandardColorForPriority:PRIORITY_NOW];
    self.soonViewContainer.backgroundColor = [TodoItem getStandardColorForPriority:PRIORITY_SOON];
    self.delegateViewContainer.backgroundColor = [TodoItem getStandardColorForPriority:PRIORITY_DELEGATE];
    self.ignorableViewContainer.backgroundColor = [TodoItem getStandardColorForPriority:PRIORITY_IGNORABLE];
}

- (void) setupLabels {
    NSArray * itemsArray = [[Settings sharedSettings] getItemsArray];
    
    TodoItem * tempItem = nil;
    int sums[4] = {0,0,0,0};
    for(int i = 0; i < itemsArray.count; i++) {
        tempItem = itemsArray[i];
        sums[(int)tempItem.priority] += 1;
    }
    NSArray * labels = @[self.nowLbl, self.soonLbl, self.delegateLbl, self.ignorableLbl];
    UILabel * tempLabel = nil;
    for(int i = 0; i < labels.count; i++) {
        tempLabel = (UILabel*)labels[i];
        tempLabel.text = [NSString stringWithFormat:@"%i", sums[i]];
    }
}

@end
