//
//  PXView.h
//  PXInsetTextField
//
//  Created by Calvin Kern on 6/10/15.
//  Copyright (c) 2015 Daniel Blakemore. All rights reserved.
//

#import <PXInsetTextField/PXInsetTextField.h>
#import <UIKit/UIKit.h>

@interface PXView : UIScrollView

@property (nonatomic, readonly) UITextField* normalField;
@property (nonatomic, readonly) PXInsetTextField* defaultField;
@property (nonatomic, readonly) PXInsetTextField* customField;
@property (nonatomic, readonly) PXInsetTextField* doubleField;
@property (nonatomic, readonly) PXInsetTextField* tripleField;
@property (nonatomic, readonly) PXInsetTextField* bottomLeftField;

@end
