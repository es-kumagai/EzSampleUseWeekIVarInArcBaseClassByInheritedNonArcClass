//
//  EzSampleValue.m
//  EzSampleUseWeekIVarInArcBaseClassByInheritedNonArcClass
//
//  Created by 熊谷 友宏 on H.24/11/29.
//  Copyright (c) 平成24年 Tomohiro Kumagai. All rights reserved.
//

#import "EzSampleValue.h"

@implementation EzSampleValue

- (id)copyWithZone:(NSZone *)zone
{
	id result = [[[self class] allocWithZone:zone] init];
	
	NSLog(@"Source=%p, Copyed=%p", self, result);
	
	return result;
}

- (NSString*)value
{
	return @"Value";
}

- (id)autorelease
{
	NSLog(@"autorelease:%p", self);
	return [super autorelease];
}

- (id)retain
{
	NSLog(@"retain:%p", self);
	return [super retain];
}

- (oneway void)release
{
	NSLog(@"release:%p", self);
	[super release];
}

- (void)dealloc
{
	NSLog(@"dealloc:%p", self);
	[super dealloc];
}

@end
