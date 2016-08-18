//
//  Settings.h
//
//
//  Created by Stephen on 12/29/13.
//

#import <Foundation/Foundation.h>
#import "TodoItem.h"

@interface Settings : NSObject

+ (Settings*) sharedSettings;

- (NSMutableArray*) getItemsArray;
- (void) setItemsArray:(NSArray*)items;
- (void) addItem:(TodoItem*)item;
- (BOOL) removeItem:(TodoItem*)item; //True on success, unused. For debugging if big application.

@end
