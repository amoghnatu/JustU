//
//  JustUResourceNameConstants.m
//  JustU
//
//  Created by Anusha Tondapu on 13/07/14.
//  Copyright (c) 2014 AmoghAnusha. All rights reserved.
//

#import "JustUResourceNameConstants.h"

@implementation JustUResourceNameConstants

+(NSString *)getResourceStringValue:(NSString *)resourceKey fromFile:(NSString *)resourceFilename {
    if (![resourceKey isEqualToString:@""]) {
        return NSLocalizedStringFromTable(resourceKey, resourceFilename , @"");
    }
    else
        return @"";
}

@end
