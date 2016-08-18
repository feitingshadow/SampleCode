//
//  TodoItem.m
//  Todo
//
//  Created by Stephen Johnson on 8/17/16.
//  Copyright © 2016 Stephen Johnson. All rights reserved.
//

#import "TodoItem.h"
#import "AppConstants.h"

#define ENCODING_TITLE @"Title"
#define ENCODING_PRIORITY @"Priority"

@implementation TodoItem

@synthesize priority = _priority;

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.title forKey:ENCODING_TITLE];
    [coder encodeInteger:(NSUInteger)self.priority forKey:ENCODING_PRIORITY];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.title = [coder decodeObjectForKey:ENCODING_TITLE];
        self.priority = (Priority)[coder decodeIntegerForKey:ENCODING_PRIORITY];
    }
    return self;
}

- (NSString *) nameForPriority {
    //Would use standard localizer or define. Localizer favored, so just using string.
    switch (_priority) {
        case kTodoItemNow: {
            return @"Now";
            break;
        }
        case kTodoItemSoon: {
            return @"Soon";
            break;
        }
        case kTodoItemDelegate: {
            return @"Get Help";
            break;
        }
        case kTodoItemUnimportant: {
           return  @"Ignore";
            break;
        }
        default: {
#ifdef DEBUG
            //Log error/NSAssert
#endif
            break;
        }
    }
    return @"";
}

- (UIColor*) colorForPriority {
   return [TodoItem getStandardColorForPriority:(int)_priority];
}

+ (UIColor*) getStandardColorForPriority:(int)priority {
    switch (priority) {
        case kTodoItemNow: {
            return PRI_COLOR_RED;
            break;
        }
        case kTodoItemSoon: {
            return PRI_COLOR_BLUE;
            break;
        }
        case kTodoItemDelegate: {
            return PRI_COLOR_YELLOW;
            break;
        }
        case kTodoItemUnimportant: {
            return  PRI_COLOR_GREEN;
            break;
        }
        default: {
#ifdef DEBUG
            //Log error/NSAssert
#endif
            break;
        }
    }
    return nil;
}

- (UIImage *) imageForPriority {
    switch (_priority) {
        case kTodoItemNow: {
            return [UIImage imageNamed:@"exMark1.png"];
            break;
        }
        case kTodoItemSoon: {
            return [UIImage imageNamed:@"calendar1.png"];
            break;
        }
        case kTodoItemDelegate: {
            return [UIImage imageNamed:@"phone1.png"];
            break;
        }
        case kTodoItemUnimportant: {
            return [UIImage imageNamed:@"closex.png"];
            break;
        }
        default: {
#ifdef DEBUG
            //Log error/NSAssert
#endif
            break;
        }
    }
    return nil;
}
- (BOOL) isEqualToItem:(TodoItem*)other
{
    return ( ([self.title isEqualToString: other.title]) && (self.priority == other.priority) );
}


@end
