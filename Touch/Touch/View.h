//
//  View.h
//  Touch
//
//  Created by Michael Gradilone on 10/21/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyLittleView;
@class StarView;
@class FlagView;

@interface View : UIView {
    MyLittleView  *myLittleView;
    MyLittleView  *myLittleView2;
    StarView *myStarView;
    FlagView *myFlagView;
}
@end
