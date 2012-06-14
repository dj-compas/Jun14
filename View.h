//
//  View.h
//  Jun14
//
//  Created by Michael Compas on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView
{
	UIFont *font;
	CGPoint point;
	UIColor *color;
	//UIColor *fillColor;
	NSArray *fillColor;
}

@property (nonatomic, strong) NSString *message;

//- (void) makeString: (NSString *) s;
- (id) initWithFrame: (CGRect) frame andMessage:(NSString *) msg andBackgroundColor: (UIColor *) col;

@end
