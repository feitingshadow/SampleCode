//
//  Settings.m
//  RelaxnListen
//
//  Created by Stephen on 12/28/13.
//  Copyright (c) 2013 Stephen. All rights reserved.
//

#import "Settings.h"
#import "AppConstants.h"
#import "Storage.h"


@interface Settings()
{
    Storage * storage;
}
@end

@implementation Settings

+ (Settings*)sharedSettings {
    static Settings * sharedSettings = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSettings = [[self alloc] init];
    });
    return sharedSettings;
}

- (id)init {
    if (self = [super init]) {
        storage = [Storage sharedStorage];
    }
    return self;
}

- (void)dealloc {
}

//Begin instance methods

- (void) addItem:(TodoItem*)item;
{
    //Note: Doesn't test for duplicates, might add that to list.
    if(item != nil) {
        NSMutableArray * items = [self getItemsArray];
        [items addObject:item];
        [self setItemsArray:items];
    }
}

- (BOOL) removeItem:(TodoItem*)item;
{
    if(item != nil) {
        NSMutableArray * items = [self getItemsArray];
        TodoItem * tempItem;
        for(int i = 0; i < [items count]; i++) {
            tempItem = items[i];
            if ( [item isEqualToItem:tempItem]) {
                [items removeObjectAtIndex:i];
                [self setItemsArray:items];
                return YES;
            }
        }
    }
    return NO;
}

- (NSMutableArray*) getItemsArray;
{
    NSArray * items =  (NSArray*)[storage getValueForKey:KEY_TODOLIST defaultingTo:@[]];
    NSMutableArray * modifiableList = [NSMutableArray arrayWithArray:items];
    [self sortItemsArray:modifiableList];
    return modifiableList;
}

- (void) setItemsArray:(NSArray*)items;
{
    [storage saveValue:items forKey:KEY_TODOLIST];
}

//MARK: Utility methods on settings data. Would probably write separate util for this if bigger.
- (NSMutableArray*) sortItemsArray:(NSMutableArray*)array
{
    if(array != nil) {
        //Alphabetical, then priority, to show by priority first, then alphabetical in list.
        [array sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            TodoItem * item1 = (TodoItem*)obj1;
            TodoItem * item2 = (TodoItem*)obj2;
            return [item1.title localizedCaseInsensitiveCompare:item2.title];
        }];
        
         [array sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            TodoItem * item1 = (TodoItem*)obj1;
            TodoItem * item2 = (TodoItem*)obj2;
            return (int)item1.priority > (int)item2.priority;
        }];
    }
    else {
        //Debug Error
    }
    return nil;
}

@end
