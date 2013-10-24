//
//  FlagView.h
//  Touch
//
//  Created by Michael Gradilone on 10/24/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlagView : UIView

@property (nonatomic) int numPoints;
@property (nonatomic) int numStars;

- (id) initWithFrame: (CGRect) frame withPoints: (int) points;

- (id) initWithFrame: (CGRect) frame withNumberOfStars: (int) numberOfStars;

@end
