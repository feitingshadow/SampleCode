//
//  ViewController.h
//  Todo
//
//  Created by Stephen Johnson on 8/17/16.
//  Copyright © 2016 Nazca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
}

@property (nonatomic, weak) IBOutlet UITableView * tableView;

@end

