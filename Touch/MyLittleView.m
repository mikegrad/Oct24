//
//  MyLittleView.m
//  Touch
//
//  Created by Michael Gradilone on 10/22/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import "MyLittleView.h"
#import <QuartzCore/QuartzCore.h>


@implementation MyLittleView

@synthesize color = _color;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        
        //CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB() ;
        
        //const CGFloat components[] = {1.0, 1.0, 0.0, 1.0};
        
        //CALayer *layer = self.layer;
        
        //layer.backgroundColor = CGColorCreate(colorspace, components);
        
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        
        //i wonder will this work? I want to bne able to use the same class, but set different colors
        self.color = color;
        
        
        //CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB() ;
        
        //const CGFloat components[] = {1.0, 1.0, 0.0, 1.0};
        
        //CALayer *layer = self.layer;
        
        //layer.backgroundColor = CGColorCreate(colorspace, components);
        
        
    }
    return self;
}

-(UIColor *) color {
    
    if (_color) {
        return _color;
    } else {
        //set the default = blue
        return [UIColor blueColor];
    }
}

-(void) setColor:(UIColor *)color
{
    // should probably do introspection here to make sure its a color. 
    _color = color;
    
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // in here i want to draw something interesting to move around
    // maybe a clock that animates itslef, or an image. Maybe add multiple items and move them at random?
    
    //start simple, draw a circle and fill it
    
    //two circles - if the collide can i make something happen? use the bounds of each?
    CGRect bounds = self.bounds;
	CGFloat radius = 40;  //this needs to be small
    
    
	CGRect r = CGRectMake(
                          bounds.origin.x,
                          bounds.origin.y,
                          radius,
                          radius
                          );
    
    CGContextRef cont = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(cont); // for use in getting back to the priginal state later?
    
    CGContextBeginPath(cont);	//unnecessary here: the path is already empty.
	CGContextAddEllipseInRect(cont, r);
    
    //this is kind of a hack - checking the color property to come up witht eEGB?
    if (_color == [UIColor blueColor]) {
        CGContextSetRGBFillColor(cont, 0, 0.0, 1.0, 1.0);	//blue, opaque
    } else if (_color == [UIColor redColor]) {
        CGContextSetRGBFillColor(cont, 1.0, 0.0, 0.0, 1.0);	//red, opaque
    } else if (_color == [UIColor greenColor]) {
        CGContextSetRGBFillColor(cont, 0.0, 1.0, 0.0, 1.0);	//red, opaque
    } else if (_color == [UIColor yellowColor]){
        CGContextSetRGBFillColor(cont, 1.0, 1.0, 0.0, 1.0);	//, opaque
    } else {
        CGContextSetRGBFillColor(cont, 1.0, 1.0, 0.0, 1.0);	//, opaque
    }
    
    
    
    
    CGContextFillPath(cont);
    
    
}


@end
