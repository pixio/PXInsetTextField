//
//  PXViewController.m
//  PXInsetTextField
//
//  Created by Daniel Blakemore on 04/13/2015.
//  Copyright (c) 2014 Daniel Blakemore. All rights reserved.
//

#import "PXViewController.h"
#import "PXView.h"

@implementation PXViewController
{
    UITextField* activeField;
}

- (PXView*)contentView
{
    return (PXView*)[self view];
}

- (void)loadView
{
    [self setView:[[PXView alloc] init]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setTitle:@"PX Inset Text Field"];
    [[self view] setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];

    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor orangeColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

    [self registerForKeyboardNotifications];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [[self contentView] addGestureRecognizer:tap];
    
    [[[self contentView] normalField] setDelegate:self];
    [[[self contentView] defaultField] setDelegate:self];
    [[[self contentView] customField] setDelegate:self];
    [[[self contentView] doubleField] setDelegate:self];
    [[[self contentView] tripleField] setDelegate:self];
    [[[self contentView] bottomLeftField] setDelegate:self];
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hideKeyboard];
    [super touchesBegan:touches withEvent:event];
}

- (void)hideKeyboard
{
    [[self contentView] endEditing:TRUE];
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGRect oldFrame = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect newFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    oldFrame = [self.view convertRect:oldFrame fromView:self.view.window];
    newFrame = [self.view convertRect:newFrame fromView:self.view.window];
    
    CGSize kbSize = newFrame.size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    [[self contentView] setContentInset:contentInsets];
    [self contentView].scrollIndicatorInsets = contentInsets;
    
    [[self contentView] setNeedsLayout];
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = [self contentView].frame;
    aRect.size.height -= kbSize.height;
    CGRect activeFrame = [activeField frame];
    
    if (!CGRectContainsRect(aRect, activeFrame))
    {
        [[self contentView] scrollRectToVisible:activeFrame animated:TRUE];
    }
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    [self contentView].contentInset = contentInsets;
    [self contentView].scrollIndicatorInsets = contentInsets;
}

@end
