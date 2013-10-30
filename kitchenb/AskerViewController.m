//
//  AskerViewController.m
//  kitchenb
//
//  Created by Boyle, Patrick on 10/14/13.
//  Copyright (c) 2013 pat boyle. All rights reserved.
//

#import "AskerViewController.h"

@interface AskerViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *answerField;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@end

@implementation AskerViewController
@synthesize answerField=_answerField;
@synthesize questionLabel=_questionLabel;
@synthesize answer=_answer;
@synthesize question=_question;

// gesture to capture if they enter

- (IBAction)tapGesture:(id)sender {
}


- (void)setQuestion:(NSString *)question
{
    _question=question;
    self.questionLabel.text=question;
}

- (void)setAnswer:(NSString *)answer
{
    _answer=answer;
    self.answerField.text=answer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.questionLabel.text = self.question;
    self.answerField.placeholder = self.answer;
    self.answerField.delegate = self;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.answer = textField.text;
    if (![textField.text length]) {
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:Nil];
    } else {
    [self.delegate askerviewController:self
                        didAskQuestion:self.answer
                          andGotAnswer:self.question];
    }
}

// handle input into the textfiled.

@end



