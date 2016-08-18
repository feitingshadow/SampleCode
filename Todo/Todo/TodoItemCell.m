//
//  TodoItemCell.m
//  Todo
//
//  Created by Stephen Johnson on 8/17/16.
//  Copyright © 2016 Nazca. All rights reserved.
//

#import "TodoItemCell.h"
#import <QuartzCore/QuartzCore.h>
#import "AppConstants.h"
#define ANIMATION_SCROLL @"scrolls"


@implementation TodoItemCell

- (void) scrollTitleIfTooBig {
    NSDictionary * attributes = @{NSFontAttributeName: self.titleLbl.font};
    
    CGSize labelSize = [self.titleLbl.text sizeWithAttributes:attributes];
    [self.titleLbl sizeToFit];
    self.titleLbl.frame = CGRectMake(0,0, self.titleLbl.frame.size.width ,self.titleContainerView.bounds.size.height);
    if (self.titleLbl.frame.size.width > self.titleContainerView.frame.size.width) {
        float pixelsPerSec = 50.0f;
        float scrollAnimPadding = 44.0f;
        float halfWidth = self.titleLbl.bounds.size.width/2.0f;
        float xDifference = labelSize.width - self.titleContainerView.frame.size.width;
        CABasicAnimation * scrollAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        scrollAnimation.fromValue = [NSValue valueWithCGPoint: CGPointMake(self.titleLbl.center.x + halfWidth, self.titleLbl.center.y)];
        scrollAnimation.toValue = [NSValue valueWithCGPoint: CGPointMake(self.titleLbl.center.x - xDifference - scrollAnimPadding, self.titleLbl.center.y)];
        scrollAnimation.repeatCount = INFINITY;
        scrollAnimation.duration = (self.titleLbl.bounds.size.width + scrollAnimPadding + halfWidth)/pixelsPerSec;
        scrollAnimation.autoreverses = NO;
        scrollAnimation.cumulative = NO;
        [self.titleLbl.layer addAnimation:scrollAnimation forKey:ANIMATION_SCROLL];
    }
}

- (void) layoutSubviews {
    [super layoutSubviews];
    //Upon first layout, the constraints reset the frame so the end-text doesn't show. This override ensures.
    [self scrollTitleIfTooBig];
}

- (void) setupWithItem:(TodoItem*)todoItem;
{
    self.titleLbl.text = todoItem.title;
    self.priorityLbl.text = todoItem.nameForPriority;
    self.priorityLbl.hidden = YES; //enable swapping between text and image maybe?
    self.priorityImageView.image = todoItem.imageForPriority;
    self.contentView.backgroundColor = todoItem.colorForPriority;
}

- (void)prepareForReuse {
    self.titleLbl.frame = self.titleContainerView.bounds;
    [self.titleLbl.layer removeAnimationForKey:ANIMATION_SCROLL];
}
@end
