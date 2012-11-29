//
//  EzSampleViewController.h
//  EzSampleUseWeekIVarInArcBaseClassByInheritedNonArcClass
//
//  Created by 熊谷 友宏 on H.24/11/29.
//  Copyright (c) 平成24年 Tomohiro Kumagai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EzSampleValue.h"

@interface EzSampleViewController : UIViewController
{
@protected
	__strong EzSampleValue* _value;
	__weak EzSampleValue* _weakValue;
}

- (IBAction)test:(id)sender;
- (IBAction)doRelease:(id)sender;

@end
