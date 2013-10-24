//
//  FlagView.m
//  Touch
//
//  Created by Michael Gradilone on 10/24/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import "FlagView.h"

@implementation FlagView

@synthesize numPoints;
@synthesize numStars;

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
	}
	return self;
}

- (id) initWithFrame: (CGRect) frame withPoints: (int) points
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
        
        if ((points > 3) && (points < 10)){
                numPoints = points;
        } else {
            numPoints = 5;
        }
	}
	return self;
}

- (id) initWithFrame: (CGRect) frame withNumberOfStars:(int)numberOfStars
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
        
        if ((numberOfStars > 0) && (numberOfStars < 50)){
            numStars  = numberOfStars;
        } else {
            numberOfStars = 1;
        }
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGContextRef c = UIGraphicsGetCurrentContext();
    
	//seven red stripes
	CGContextBeginPath(c);
    
    for (int i=0; i < 13; i=i+2){
        CGContextAddRect(c, CGRectMake( i * w / 13, 0, w / 13, h));
    }
	
    /*
     CGContextAddRect(c, CGRectMake( 0 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake( 2 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake( 4 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake( 6 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake( 8 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake(10 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake(12 * w / 13, 0, w / 13, h));
    */
    
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	CGContextFillPath(c);
    
	//blue union jack
	CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake(w * 6 / 13, 0, w * 7 / 13, h * 2 / 5));
	CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 1.0);
	CGContextFillPath(c);
    
    
    //can we draw a whole bunch of little ones? somehow or other we need to split up the blue box based on the number of stars
    // here is the rect again
    // CGContextAddRect(c, CGRectMake(w * 6 / 13, 0, w * 7 / 13, h * 2 / 5));
    CGFloat jackPointX = w * 7 / 13;
    CGFloat jackPointY = h * 2 / 5;
    
    // a formual that works is ceiling(numStars / 6) gives the max number of rows, assuming no more than 54 stars
    // only works for a few sts of numbers, but i will figure it out. in the meantime, lets do the easy things
    
	//White star has 5 vertices (points).
    
    //we could make this a property of the class
    if (!numPoints) numPoints = 5;
    
	CGPoint center = CGPointMake((6 + 3.5) * w / 13, h / 5); //of union jack
	CGFloat radius = h / 10;	//of circle that the 5 vertices touch
	CGContextBeginPath(c);
    
    for (int i = 0; i <= numPoints; i = i + 2) {
		CGFloat theta = 2 * M_PI * i / numPoints;
		CGFloat x = center.x + radius * cosf(theta);
		CGFloat y = center.y - radius * sinf(theta);
        
		if (i == 0) {
			CGContextMoveToPoint(c, x, y);
		} else {
			CGContextAddLineToPoint(c, x, y);
		}
	}
    
    /*
	CGFloat theta = 0;		//Start with vertex pointing to right.
	CGContextMoveToPoint(c,
                         center.x + radius * cosf(theta),
                         center.y - radius * sinf(theta)
                         );
    
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper left
	CGContextAddLineToPoint(c,
                            center.x + radius * cosf(theta),
                            center.y - radius * sinf(theta)
                            );
    
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower right
	CGContextAddLineToPoint(c,
                            center.x + radius * cosf(theta),
                            center.y - radius * sinf(theta)
                            );
    
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper right
	CGContextAddLineToPoint(c,
                            center.x + radius * cosf(theta),
                            center.y - radius * sinf(theta)
                            );
    
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower left
	CGContextAddLineToPoint(c,
                            center.x + radius * cosf(theta),
                            center.y - radius * sinf(theta)
                            );
    */
    
	//Works even though the star's outline intersects with itself.
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
	CGContextFillPath(c);
    
}


@end
