//
//  KeyBoardHiddenViewController.h
//  KeyBoardHidden
//
//  Created by David Linsin on 5/9/11.
//  Copyright 2011 GrandCentrix GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyBoardHiddenViewController : UIViewController<UITextFieldDelegate> {
    UITextField *activeField;
}

@end
