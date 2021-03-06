//
//  SBEmbeddedSegmentSegue.m
//  SBSegmentedViewController
//
//  Created by Scott Berrevoets on 7/10/13.
//  Copyright (c) 2013 Scotty Doesn't Code. All rights reserved.
//

#import "SBEmbeddedSegmentSegue.h"
#import "SBSegmentedViewController.h"

@implementation SBEmbeddedSegmentSegue

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination {
	
	self = [super initWithIdentifier:identifier source:source destination:destination];
	
	if (self) {
	
		if (![self.sourceViewController isKindOfClass:[SBSegmentedViewController class]]) {
			NSLog(@"The source view controller for a %@ has to be a %@", NSStringFromClass([self class]), NSStringFromClass([SBSegmentedViewController class]));
			return nil;
		}
		
		SBSegmentedViewController *source = self.sourceViewController;
		[source addViewController:self.destinationViewController];
	}
	
	return self;
}

- (void)perform {
	/*	We are really "misusing" a segue here, much like Apple misuses an embedded segue
	 *	in iOS 6. There is no real segue, or transition to a different view controller.
	 *	Segues here are just used to create relationships between an SBSegmentedViewController
	 *	and the view controllers it switches between. Initially it may appear that this
	 *	method would be a good place to perform transitions between view controllers.
	 *	However, the segues are supposed to be performed in viewDidLoad of
	 *	SBSegmentedViewController (or a subclass thereof), just so that initWithIdentifier:source:destination:
	 *	can make the relationship between the two view controllers.
	 *	Performing a segue can therefore not be used to do the actual transition. We still
	 *	have to implement this method to avoid an NSInternalInconsistencyException.
	 */
}

@end
