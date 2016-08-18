//
//  AppConstants.h
//  Todo
//
//  Created by Stephen Johnson on 8/17/16.
//  Copyright © 2016 Nazca. All rights reserved.
//

#ifndef AppConstants_h
#define AppConstants_h

#define KEY_TODOLIST @"TodoList"
#define KEY_ITEM_INDEX @"IndexOfItem"

#define NAVIGATION_FLAGS_EDIT @"NavigationEdit"

#define PRI_COLOR_RED [UIColor colorWithRed:168/255.0 green:59/255.0 blue:59/255.0 alpha:1]
#define PRI_COLOR_GREEN [UIColor colorWithRed:47/255.0 green:134/255.0 blue:47/255.0 alpha:1]
#define PRI_COLOR_BLUE [UIColor colorWithRed:36/255.0 green:99/255.0 blue:102/255.0 alpha:1]
#define PRI_COLOR_YELLOW [UIColor colorWithRed:168/255.0 green:109/255.0 blue:59/255.0 alpha:1]

#define PRI_COLOR_NOW PRI_COLOR_RED
#define PRI_COLOR_SOON PRI_COLOR_BLUE
#define PRI_COLOR_DELEGATE PRI_COLOR_YELLOW
#define PRI_COLOR_IGNORABLE PRI_COLOR_GREEN

#define PRIORITY_NOW 0
#define PRIORITY_SOON 1
#define PRIORITY_DELEGATE 2
#define PRIORITY_IGNORABLE 3

#endif /* AppConstants_h */
