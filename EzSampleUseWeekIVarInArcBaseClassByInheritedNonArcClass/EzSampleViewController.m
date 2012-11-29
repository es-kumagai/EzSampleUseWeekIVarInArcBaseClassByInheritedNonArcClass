//
//  EzSampleViewController.m
//  EzSampleUseWeekIVarInArcBaseClassByInheritedNonArcClass
//
//  Created by 熊谷 友宏 on H.24/11/29.
//  Copyright (c) 平成24年 Tomohiro Kumagai. All rights reserved.
//

#import "EzSampleViewController.h"

@interface EzSampleViewController ()

@end

@implementation EzSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSLog(@"B: View Did Load");
	_value = [[EzSampleValue alloc] init];
	_weakValue = _value;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	// ARC で Weak を参照するとオートリリースプールに入る。
	NSLog(@"B: Weak Value = %p", _weakValue);
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	NSLog(@"B: View Did Appear");
	_value = nil;
	[self test:self];
}

- (void)test:(id)sender
{
	NSLog(@"-------------------------------------");
	NSLog(@"WeakValue=%@ (%p)", [_weakValue value], _weakValue);
	NSLog(@"Value=%@ (%p)", [_value value], _value);
}

- (void)doRelease:(id)sender
{
	NSLog(@"-------------------------------------");
	_value = nil;
}

@end
