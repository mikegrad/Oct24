//
//  StarView.m
//  Touch
//
//  Created by Michael Gradilone on 10/23/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import "StarView.h"

@implementation StarView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	// this star needs to be relatively small
    
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGContextRef c = UIGraphicsGetCurrentContext();
    
    //blue union jack
	CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake(0,0, self.bounds.size.width, self.bounds.size.height));
    
  
    //White star has 5 vertices (points).
	CGPoint center = CGPointMake((6 + 3.5) * w / 13, h / 5); //of union jack
	CGFloat radius = h / 10;	//of circle that the 5 vertices touch
	CGContextBeginPath(c);
    
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
    
	//Works even though the star's outline intersects with itself.
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 1.0, 1.0);
	CGContextFillPath(c);
}


@end
