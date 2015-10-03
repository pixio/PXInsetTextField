//
//  PXView.m
//  PXInsetTextField
//
//  Created by Calvin Kern on 6/10/15.
//  Copyright (c) 2015 Daniel Blakemore. All rights reserved.
//

#import "PXView.h"
#import <PXInsetTextField/PXInsetTextField.h>

@implementation PXView
{
    NSMutableArray* _constraints;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self == nil) {
        return nil;
    }
    
    _constraints = [NSMutableArray array];
    
    // Make all the backgrounds white so that the inset difference is visible
    _normalField = [[UITextField alloc] init];
    [_normalField setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [_normalField setText:@"Standard UI"];
    [_normalField setBackgroundColor:[UIColor redColor]];
    [self addSubview:_normalField];
    
    _defaultField = [[PXInsetTextField alloc] init];
    [_defaultField setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [_defaultField setText:@"Default Inset"];
    [_defaultField setBackgroundColor:[UIColor orangeColor]];
    [self addSubview:_defaultField];

    int ten = 10;
    int thirty = 30;
    
    _customField = [[PXInsetTextField alloc] init];
    [_customField setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [_customField setText:@"Custom Inset"];
    [_customField setInsets:(UIEdgeInsets){ten,thirty,ten,thirty}];
    [_customField setBackgroundColor:[UIColor yellowColor]];
    [self addSubview:_customField];

    _doubleField = [[PXInsetTextField alloc] init];
    [_doubleField setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [_doubleField setText:@"Double Custom Inset"];
    [_doubleField setInsets:(UIEdgeInsets){ten * 2,thirty * 2,ten * 2,thirty * 2}];
    [_doubleField setBackgroundColor:[UIColor greenColor]];
    [self addSubview:_doubleField];

    _tripleField = [[PXInsetTextField alloc] init];
    [_tripleField setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [_tripleField setText:@"Triple Custom Inset"];
    [_tripleField setInsets:(UIEdgeInsets){ten * 3,thirty * 3,ten * 3,thirty * 3}];
    [_tripleField setBackgroundColor:[UIColor blueColor]];
    [self addSubview:_tripleField];

    _bottomLeftField = [[PXInsetTextField alloc] init];
    [_bottomLeftField setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [_bottomLeftField setText:@"Bottom Left Inset"];
    [_bottomLeftField setInsets:(UIEdgeInsets){0,thirty * 2,thirty * 2,0}];
    [_bottomLeftField setBackgroundColor:[UIColor purpleColor]];
    [self addSubview:_bottomLeftField];
    
    [self setNeedsUpdateConstraints];
    
    return self;
}

- (void)updateConstraints
{
    [self removeConstraints:_constraints];
    [_constraints removeAllObjects];
    
    NSDictionary* views = NSDictionaryOfVariableBindings(_normalField, _defaultField, _customField, _doubleField, _tripleField, _bottomLeftField);
    NSDictionary* metrics = @{ @"sp" : @25};
    
    // Horizontal
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_normalField]|" options:0 metrics:metrics views:views]];
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_defaultField]" options:0 metrics:metrics views:views]];
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_customField]" options:0 metrics:metrics views:views]];
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_doubleField]" options:0 metrics:metrics views:views]];
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tripleField]" options:0 metrics:metrics views:views]];
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_bottomLeftField]" options:0 metrics:metrics views:views]];
    
    // Vertical
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-sp-[_normalField]-sp-[_defaultField]-sp-[_customField]-sp-[_doubleField]-sp-[_tripleField]-sp-[_bottomLeftField]-sp-|" options:0 metrics:metrics views:views]];
    
    [self addConstraints:_constraints];
    [super updateConstraints];
}

@end
