//
//  KeyBoardHiddenAppDelegate.h
//  KeyBoardHidden
//
//  Created by David Linsin on 5/9/11.
//  Copyright 2011 GrandCentrix GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KeyBoardHiddenViewController;

@interface KeyBoardHiddenAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet KeyBoardHiddenViewController *viewController;

@end
