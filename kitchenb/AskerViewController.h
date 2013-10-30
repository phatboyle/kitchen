//
//  AskerViewController.h
//  kitchenb
//
//  Created by Boyle, Patrick on 10/14/13.
//  Copyright (c) 2013 pat boyle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AskerViewController;  // remind me why this is needed

@protocol AskerViewControllerDelegate <NSObject>
- (void)askerviewController: (AskerViewController *) sender
             didAskQuestion: (NSString *) question
               andGotAnswer: (NSString *) answer;
@end

@interface AskerViewController : UIViewController


@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *question;
@property (nonatomic, weak) id <AskerViewControllerDelegate> delegate;


@end
