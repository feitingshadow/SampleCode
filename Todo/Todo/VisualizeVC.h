//
//  VisualizeVC.h
//  Todo
//
//  Created by Stephen Johnson on 8/18/16.
//  Copyright © 2016 Nazca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VisualizeVC : UIViewController

@property (nonatomic, weak) IBOutlet UILabel * nowLbl;
@property (nonatomic, weak) IBOutlet UILabel * soonLbl;
@property (nonatomic, weak) IBOutlet UILabel * delegateLbl; //I dislke this name. Note: Find synonym.
@property (nonatomic, weak) IBOutlet UILabel * ignorableLbl;

@property (nonatomic, weak) IBOutlet UIView * nowViewContainer;
@property (nonatomic, weak) IBOutlet UIView * soonViewContainer;
@property (nonatomic, weak) IBOutlet UIView * delegateViewContainer;
@property (nonatomic, weak) IBOutlet UIView * ignorableViewContainer;

@end
