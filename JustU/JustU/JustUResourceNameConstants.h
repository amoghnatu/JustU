//
//  JustUResourceNameConstants.h
//  JustU
//
//  Created by Anusha Tondapu on 13/07/14.
//  Copyright (c) 2014 AmoghAnusha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JustUResourceNameConstants : NSObject
+(NSString *) getResourceStringValue : (NSString *)resourceKey fromFile:(NSString *)resourceFilename;
@end
