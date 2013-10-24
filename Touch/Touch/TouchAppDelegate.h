//
//  TouchAppDelegate.h
//  Touch
//
//  Created by Michael Gradilone on 10/21/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface TouchAppDelegate : UIResponder <UIApplicationDelegate> {
    View *view;
    UIWindow *_window;  
    
}

@property (strong, nonatomic) UIWindow *window;

@end
