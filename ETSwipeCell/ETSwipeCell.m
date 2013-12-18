//
//  ETSwipeCell.m
//  giftboard
//
//  Created by Eugene Trapeznikov on 11/28/13.
//  Copyright (c) 2013 2Nova Interactive. All rights reserved.
//

#import "ETSwipeCell.h"

@implementation ETSwipeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(120, 0, 100, 45)];
        [self addSubview:self.button1];
        
        self.button2 = [[UIButton alloc] initWithFrame:CGRectMake(220, 0, 100, 45)];
        [self addSubview:self.button2];
        
        self.bgView = [[UIView alloc] init];
        self.bgView.frame = CGRectMake(0, 0, 320, 45);
        self.bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.bgView];
        
        panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
        [panGestureRecognizer setMinimumNumberOfTouches:1];
        [panGestureRecognizer setMaximumNumberOfTouches:1];
        panGestureRecognizer.delegate = self;
        [self.bgView addGestureRecognizer:panGestureRecognizer];
        
        firstX = 0;
        
    }
    return self;
}

-(void)initSwipeWidth:(int)width {
    swipeWidth = width;
}

-(void)initCellHeight:(int)height{
    
    self.bgView.frame = CGRectMake(0, 0, 320, height);
    
    CGRect button1Frame = self.button1.frame;
    button1Frame.size.height = height;
    self.button1.frame = button1Frame;
    
    CGRect button2Frame = self.button2.frame;
    button2Frame.size.height = height;
    self.button2.frame = button2Frame;

}

-(void)enablePanGesture:(BOOL)enableGesture{
    if (enableGesture){
        [self.bgView removeGestureRecognizer:panGestureRecognizer];
    } else {
        [self.bgView addGestureRecognizer:panGestureRecognizer];
    }
}

-(void)move:(UIPanGestureRecognizer*)sender {
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.bgView];
    
    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        firstX = [[sender view] center].x;
    }
    
    if (firstX+translatedPoint.x > self.frame.size.width/2){
        translatedPoint = CGPointMake(self.frame.size.width/2, self.bgView.center.y);
    } else if (firstX+translatedPoint.x <self.frame.size.width/2 - swipeWidth) {
        translatedPoint = CGPointMake(self.frame.size.width/2 - swipeWidth, self.bgView.center.y);
    } else {
        translatedPoint = CGPointMake(firstX+translatedPoint.x, self.bgView.center.y);
    }
    
    [[sender view] setCenter:translatedPoint];
    
    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded || [(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateCancelled) {
        CGFloat velocityX = (0.2*[(UIPanGestureRecognizer*)sender velocityInView:self.bgView].x);
        
        CGFloat finalX = translatedPoint.x + velocityX;
        
        if (finalX < self.frame.size.width/2 - swipeWidth/2) {
            finalX = self.frame.size.width/2 - swipeWidth;
        } else {
            finalX = self.frame.size.width/2;
        }
        
        CGFloat animationDuration = (ABS(velocityX)*.0002)+.2;
        
        [UIView animateWithDuration:animationDuration animations:^{
            [[sender view] setCenter:CGPointMake(finalX, self.bgView.center.y)];
        }];
        
    }
    
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([gestureRecognizer class] == [UIPanGestureRecognizer class]) {
        
        UIPanGestureRecognizer *g = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint point = [g velocityInView:self];
        
        if (fabsf(point.x) > fabsf(point.y) ) {
            
            return YES;
        }
    }
    return NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
