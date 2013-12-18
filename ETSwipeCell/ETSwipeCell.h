//
//  ETSwipeCell.h
//  giftboard
//
//  Created by Eugene Trapeznikov on 11/28/13.
//  Copyright (c) 2013 2Nova Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETSwipeCell : UITableViewCell {
    int swipeWidth;
    int cellHieght;
    
    UIPanGestureRecognizer *panGestureRecognizer;
    
    int firstX;
    
    NSMutableArray *buttons;
}

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;

-(void)initSwipeWidth:(int)width;

-(void)initCellHeight:(int)height;

-(void)enablePanGesture:(BOOL)enableGesture;

@end
