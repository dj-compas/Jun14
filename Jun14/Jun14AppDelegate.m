//
//  Jun14AppDelegate.m
//  Jun14
//
//  Created by Michael Compas on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Jun14AppDelegate.h"
#import "View.h"

@implementation Jun14AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // hide status bar
	application.statusBarHidden = YES;
	
	UIScreen *screen = [UIScreen mainScreen];
	//CGRect applicationFrame = screen.applicationFrame;
	CGRect bounds = screen.bounds;
	CGFloat defaultWidth = bounds.size.width;
	CGFloat defaultHeight = bounds.size.height/3;
	
	// make frames for each view
	CGRect frame1 = CGRectMake(0, 0, defaultWidth, defaultHeight);
	CGRect frame2 = CGRectMake(0, (frame1.origin.y + frame1.size.height), defaultWidth, defaultHeight);
    CGRect frame3 = CGRectMake(0, (frame2.origin.y + frame2.size.height), defaultWidth, defaultHeight);
    
	// define colors
	UIColor *red = [UIColor colorWithRed:.5 green:0 blue:0 alpha:1];
	UIColor *green = [UIColor colorWithRed:0 green:.5 blue:0 alpha:1];
	UIColor *blue = [UIColor colorWithRed:0 green:0 blue:.5 alpha:1];
	
	// misc messages
	UIDevice *device = [UIDevice alloc];
	date = [[NSDate alloc] init];
	
	// instansiate views
	View *view1 = [[View alloc] initWithFrame:frame1 andMessage:@"UDID prop deprecated in iOS 5.0" andBackgroundColor:red];
	View *view2 = [[View alloc] initWithFrame:frame2 andMessage:[NSString stringWithFormat: @"Battery: %f", device.batteryLevel] andBackgroundColor:green];
	view3 = [[View alloc] initWithFrame:frame3 andMessage:[NSString stringWithFormat:@"%@", date] andBackgroundColor:blue];
	
	self.window = [[UIWindow alloc] initWithFrame: bounds];
	
	// add views to window
	[self.window addSubview:view1];
	[self.window addSubview:view2];
	[self.window addSubview:view3];
	
	// make root view visible
	[self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	date = [[NSDate alloc] init];
	view3.message = [NSString stringWithFormat:@"%@", date];
	[view3 setNeedsDisplay];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	
	NSLog(@"application active");
	
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
