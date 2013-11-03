//
//  KitchenSinkViewController.m
//  kitchenb
//
//  Created by Boyle, Patrick on 10/14/13.
//  Copyright (c) 2013 pat boyle. All rights reserved.
//

#import "KitchenSinkViewController.h"
#import "AskerViewController.h"

@interface KitchenSinkViewController () <AskerViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIView *kitchenSink;


@end

@implementation KitchenSinkViewController

- (void)askerviewController:(AskerViewController *)sender didAskQuestion:(NSString *)question andGotAnswer:(NSString *)answer
{
    [self addLabel:answer];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)addLabel:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:48.0];
    label.backgroundColor = [UIColor clearColor];
    [self setRandomLocationForView:label];
    [self.kitchenSink addSubview:label];
}

- (void)setRandomLocationForView:(UIView *)view
{
    [view sizeToFit];
    CGRect sinkBounds = CGRectInset(self.kitchenSink.bounds, view.frame.size.width/2, view.frame.size.height/2);
    CGFloat x = arc4random() % (int)sinkBounds.size.width + view.frame.size.width/2;
    CGFloat y = arc4random() % (int)sinkBounds.size.height + view.frame.size.height/2;
    view.center = CGPointMake(x, y);
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier hasPrefix:@"Create Label"] ){
        AskerViewController *asker = (AskerViewController *)segue.destinationViewController;
        asker.question = @"What do you want the label to say";
        asker.answer = @"Label text";
        asker.delegate = self;
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


@end
