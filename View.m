//
//  View.m
//  Jun14
//
//  Created by Michael Compas on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"



@implementation View

@synthesize message;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // error-check for color variable
			// this is necessary because color is defined in initWithFrame:andMessage:andBackgroundColor
			// if initWithFrame alone were called, then color wouldn't be defined, so the background color is provided here as a fail-safe
		if (!color)
		{
			self.backgroundColor = [UIColor yellowColor];
		}
		else if (color)
		{
			self.backgroundColor = color;
		}
		
		point = CGPointMake(0, 0);
		font = [UIFont systemFontOfSize:.3 * 72];
		
		//Keep the size of the view the same,
		//but move the origin to the center of the view.
		CGFloat w = self.bounds.size.width;
		CGFloat h = self.bounds.size.height;
		self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
		
    }
    return self;
}

- (id) initWithFrame: (CGRect) frame andMessage:(NSString *) msg andBackgroundColor: (UIColor *) col{
	// message is error-checked in drawRect(), color is error checked in initWithFrame
		// because color is defined here before initWithFrame is called, color is stored in an instance variable for later use
	message = msg;
	color = col;
	
	return [self initWithFrame:frame];
}
//- (void) makeString: (NSString *) s
//{
//	//CGPoint point = CGPointMake(0, 0);
//	//
//	
//}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // apply fill color
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(c, 1, 1, 1.0, 1.0); //red, green, blue, alpha
	
	// Drawing code
	if (!message)
	{
		message = @"blank";
	}
	
	[message drawAtPoint:[self centerText:message] withFont:font];
}

// Proof-of-Concept custom function to return center point of string 'text' within bounds 
- (CGPoint) centerText: (NSString *) text
{
	// s returns the width and height of the string with the applied font in struct format
	CGSize s = [text sizeWithFont: font];
	
	// b is the bounds for this instance of the view object
	CGRect b = self.bounds;
	
	// calculate the proper x and y for the string centered within bounds b
	CGFloat x = b.origin.x + (b.size.width - s.width) / 2;
	CGFloat y = b.origin.y + (b.size.height - s.height) / 2;
	
	// make a point object to be returned
	// this point object is needed in the final method [string drawAtPoint] to place the string in the view
	CGPoint p = CGPointMake(x, y);
	
	return p;
}

@end
