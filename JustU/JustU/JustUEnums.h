//
//  JustUEnums.h
//  JustU
//
//  Created by Anusha Tondapu on 13/07/14.
//  Copyright (c) 2014 AmoghAnusha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JustUEnums : NSObject

typedef enum responseStatusCodes
{
    RESPONSE_OK=200,
    RESPONSE_NO_CONTENT=204,
    RESPONSE_BAD_REQUEST=400,
    RESPONSE_FORBIDDEN=403,
    RESPONSE_NOT_FOUND=404,
    RESPONSE_REQUEST_TIMEOUT=408,
    RESPONSE_INTERNAL_SERVER_ERROR=500,
    RESPONSE_BAD_GATEWAY=502,
    RESPONSE_SERVICE_UNAVAILABLE=503,
    RESPONSE_NETWORK_AUTHENTICATION_REQUIRED=511
} ResponseCode;

@end
