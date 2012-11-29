//
//  EzSampleNonARCViewController.m
//  EzSampleUseWeekIVarInArcBaseClassByInheritedNonArcClass
//
//  Created by 熊谷 友宏 on H.24/11/29.
//  Copyright (c) 平成24年 Tomohiro Kumagai. All rights reserved.
//

#import "EzSampleNonARCViewController.h"
#import <objc/runtime.h>

@interface EzSampleNonARCViewController ()

@end

@implementation EzSampleNonARCViewController

- (void)viewWillAppear:(BOOL)animated
{	
	NSLog(@"I: View Will Appear");

	// Non-ARC での単純な代入は、ARC 環境でこの変数を参照すると nil になる。それまでは使える。
	// _weakValue = [[EzSampleValue alloc] init];

	// 同じ値の代入であれば問題ない。
	// _weakValue = _value;
	
	// ここで retain すると、これをリリースしない限り weak も解放されなくなる。
	// _weakValue = [_value retain];
	
	// copy については単純な代入のときと同じ。
	// _weakValue = [_value copy];
	
	// ここで解放してしまうと、ARC 環境で本体をリリースしようとしたときに deallocated instance になるのは自然なこと。
	// [_value release];
	
	// つまり weak は ARC 環境の方で設定したときしか効果がない。
	// ARC 環境で値を取得したとき、本来の値と矛盾が有ると nil になる仕組みのようだ。
	
	
	// Non-ARC で Weak を参照してもオートリリースプールに入らない。
	//	NSLog(@"I: Weak Value = %p", _weakValue);

//	[self test2:self];
//	[self test:self];
//	NSLog(@"I: Weak Value = %p", _weakValue);

	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	NSLog(@"I: View Did Appear");
	[_value release];
}

- (void)test2:(id)sender
{
	NSLog(@"---------------------------------(2)-");
	NSLog(@"Value=%@ (%p)", [_value value], _value);
	NSLog(@"WeakValue=%@ (%p)", [_weakValue value], _weakValue);
}

@end
