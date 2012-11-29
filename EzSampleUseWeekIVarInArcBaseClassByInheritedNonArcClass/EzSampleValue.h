//
//  EzSampleValue.h
//  EzSampleUseWeekIVarInArcBaseClassByInheritedNonArcClass
//
//  Created by 熊谷 友宏 on H.24/11/29.
//  Copyright (c) 平成24年 Tomohiro Kumagai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EzSampleValue : NSObject <NSCopying>

@property (atomic,readonly,strong) NSString* value;

@end
