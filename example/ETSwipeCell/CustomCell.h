//
//  CustomCell.h
//  ETSwipeCell
//
//  Created by Eugene Trapeznikov on 12/18/13.
//  Copyright (c) 2013 Eugene Trapeznikov. All rights reserved.
//

#import "ETSwipeCell.h"

@interface CustomCell : ETSwipeCell {
    UILabel *label;
}

-(void)initCellWithTag:(int)tag;

@end
