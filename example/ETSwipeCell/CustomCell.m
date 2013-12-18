//
//  CustomCell.m
//  ETSwipeCell
//
//  Created by Eugene Trapeznikov on 12/18/13.
//  Copyright (c) 2013 Eugene Trapeznikov. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 70)];
        label.numberOfLines = 2;
        label.textColor = [UIColor blackColor];
        [self.bgView addSubview:label];
        
    }
    return self;
}

-(void)initCellWithTag:(int)tag{
    
    //custom controls
    
    label.text = [@"Press for new controller, swipe for details. " stringByAppendingFormat:@"#%i",tag];
    
    //swipe buttons
    
    [self.button1 removeTarget:self action:@selector(openAlert:) forControlEvents:UIControlEventTouchUpInside];
    [self.button2 removeTarget:self action:@selector(openAlert:) forControlEvents:UIControlEventTouchUpInside];
    
    if (tag == 1){
        
        [self.button2 setTitle:@"Inform" forState:UIControlStateNormal];
        [self.button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button2 setBackgroundColor:[UIColor colorWithWhite:170/255.0 alpha:1.0]];
        self.button2.tag = tag;
        [self.button2 addTarget:self action:@selector(openAlert:) forControlEvents:UIControlEventTouchUpInside];
        
        [self initSwipeWidth:100];
    } else {
        
        [self.button2 setTitle:@"Del" forState:UIControlStateNormal];
        [self.button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button2 setBackgroundColor:[UIColor colorWithWhite:190/255.0 alpha:1.0]];
        self.button2.tag = tag;
        [self.button2 addTarget:self action:@selector(openAlert:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.button1 setTitle:@"More" forState:UIControlStateNormal];
        [self.button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button1 setBackgroundColor:[UIColor colorWithWhite:180/255.0 alpha:1.0]];
        self.button1.tag = tag;
        [self.button1 addTarget:self action:@selector(openAlert:) forControlEvents:UIControlEventTouchUpInside];
        
        [self initSwipeWidth:200];
    }
    
    [self initCellHeight:90];
}

-(void)openAlert:(UIButton*)button{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information" message:[@"" stringByAppendingFormat:@"cell %@ at %i",button.titleLabel.text,button.tag] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
