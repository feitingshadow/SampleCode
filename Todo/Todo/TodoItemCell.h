//
//  TodoItemCell.h
//  Todo
//
//  Created by Stephen Johnson on 8/17/16.
//  Copyright © 2016 Nazca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoItem.h"

@interface TodoItemCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * titleLbl;
@property (nonatomic, weak) IBOutlet UILabel * priorityLbl;
@property (nonatomic, weak) IBOutlet UIView * titleContainerView;
@property (nonatomic, weak) IBOutlet UIImageView * priorityImageView;

- (void) setupWithItem:(TodoItem*)todoItem;
- (void) scrollTitleIfTooBig;

@end
