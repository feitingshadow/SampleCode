//
//  TodoItem.h
//  Todo
//
//  Created by Stephen Johnson on 8/17/16.
//  Copyright © 2016 Stephen Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum Priority : NSUInteger {
    kTodoItemNow = 0,
    kTodoItemSoon,
    kTodoItemDelegate,
    kTodoItemUnimportant
    
} Priority;

@interface TodoItem : NSObject <NSCoding> //Enable archiving to local storage

@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) Priority priority;
@property (nonatomic, readonly) NSString * nameForPriority;
@property (nonatomic, readonly) UIColor * colorForPriority;
@property (nonatomic, readonly) UIImage * imageForPriority;

+ (UIColor*) getStandardColorForPriority:(int)priority;

- (BOOL) isEqualToItem:(TodoItem*) other;


@end
