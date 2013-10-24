//
//  View.m
//  Touch
//
//  Created by Michael Gradilone on 10/21/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import "View.h"
#import "MyLittleView.h"
#import "StarView.h"
#import "FlagView.h"

@implementation View

BOOL b;
BOOL reverse;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        b = YES;
        reverse = YES;
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        //put the origin at the center
        CGRect b = self.bounds;
        self.bounds = CGRectMake(-b.size.width/2, -b.size.height/2, b.size.width, b.size.height);
        

        CGFloat width = 40;
        CGFloat height = 40;
        
        // now init my frame
        //CGRect f = CGRectMake(0, 0, 80, 40);
        CGRect f = CGRectMake(-width/2, -height/2, width, height);
    
        
        myLittleView = [[MyLittleView alloc ] initWithFrame:f withColor:[UIColor blueColor]];
        
        [self  addSubview:myLittleView];
        
        CGRect f2 = CGRectMake(-100, -100, width, height);
        
        myLittleView2 =[[MyLittleView alloc]initWithFrame:f2 withColor:[UIColor redColor]];
                        
        [self addSubview:myLittleView2];
        
        
        //add the star
        CGFloat starWidth = b.size.width/3;
        CGFloat starHeight = b.size.height/3;
        
        CGRect f3 = CGRectMake(50, 50, starWidth, starHeight);

        myStarView =[[StarView alloc]initWithFrame:f3];
        myStarView.backgroundColor = [UIColor clearColor];
        
        [self addSubview:myStarView];
        
        
        //add a Flag
        CGFloat flagWidth = b.size.width/2-20;
        CGFloat flagHeight = b.size.height/2-20;
        
        //if the origin is at the center, lets put this in the upper left
        CGRect flagFrame = CGRectMake(-b.size.width/2 + 10,0, flagWidth, flagHeight);
        
        myFlagView =[[FlagView alloc]initWithFrame:flagFrame withPoints:5];
        myFlagView.backgroundColor = [UIColor clearColor];
        
        [self addSubview:myFlagView];
        
        
    }
    return self;
}


- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    
    CGPoint prevPoint = myStarView.center;
    
    if (touches.count > 0) {
        
        if (myFlagView.numPoints > 5){
            if (!reverse) { myFlagView.numPoints += 1; } else { myFlagView.numPoints -= 1;}
            
        }
        
        if (myFlagView.numPoints == 5){
            
            reverse = !reverse;
            myFlagView.numPoints += 1;
            
        }
        
        if (myFlagView.numPoints == 10) {
            myFlagView.numPoints -= 1;
            reverse = !reverse;
            
        }
        [myFlagView setNeedsDisplay];
        
        
		[UIView animateWithDuration: 1
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction| UIViewAnimationOptionBeginFromCurrentState
                         animations: ^{
                             [UIView setAnimationRepeatCount: 1];
                             //This block describes what the animation should do.
                             
                             
                             myLittleView.center = [[touches anyObject] locationInView: self];
                             //littleView.backgroundColor =  [UIColor greenColor];
                             
                             myStarView.center  = [[touches anyObject] locationInView:self];
                             
                             
                         }
                         completion:^(BOOL b) {
                             
                         [UIView animateWithDuration: 1
                                                   delay: 0.0
                                                 options: UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction| UIViewAnimationOptionBeginFromCurrentState
                                              animations: ^{
                                                  [UIView setAnimationRepeatCount: 1];
                                                  //This block describes what the animation should do.
                                                  myStarView.center  = prevPoint;
                                                  
                                              }
                                              completion: NULL
                          
                          ];
                         }
         ];
        
            
        [UIView animateWithDuration: .5
                              delay: 0.0
                            options: UIViewAnimationOptionTransitionCurlUp|UIViewAnimationOptionAllowUserInteraction| UIViewAnimationOptionBeginFromCurrentState
                         animations: ^{
                             [UIView setAnimationRepeatCount: 1];
                             //This block describes what the animation should do.
                             
                             
                             myLittleView2.center = [[touches anyObject] locationInView: self];
                             //littleView.backgroundColor =  [UIColor greenColor];
                             
                         }
                         completion: NULL
         ];

    }
    
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	myLittleView2.center = [[touches anyObject] locationInView: self];
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {

}


/*
- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView: self];
        littleView.center = point;	//Move the littleView to a new location.
        
        //Can combine the above three statements to
        //littleView.center = [[touches anyObject] locationInView: self];
    }
}
*/

/*
- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	littleView.backgroundColor = [UIColor greenColor];
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	littleView.center = [[touches anyObject] locationInView: self];
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	littleView.backgroundColor = [UIColor yellowColor];
}
*/

//motion mved?
/*
- (void) motionMoved: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView: self];
        littleView.center = point;	//Move the littleView to a new location.
        
        //Can combine the above three statements to
        //littleView.center = [[touches anyObject] locationInView: self];
    }
}
*/
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
