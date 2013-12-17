//
//  JWTAlgorithmHS512.m
//  JWT
//
//  Created by Klaas Pieter Annema on 31-05-13.
//  Copyright (c) 2013 Karma. All rights reserved.
//

#import "JWTAlgorithmHS512.h"

#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonHMAC.h>

#import "MF_Base64Additions.h"

@implementation JWTAlgorithmHS512

- (NSString *)name;
{
    return @"HS512";
}

- (NSData *)encodePayload:(NSString *)theString withSecret:(NSString *)theSecret;
{
    NSData *decodedSecret = [MF_Base64Codec dataFromBase64String:theSecret];
    const char *cString = [theString cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cSecret = [decodedSecret bytes];
    
    unsigned char cHMAC[CC_SHA512_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA512, cSecret, strlen(cSecret), cString, strlen(cString), cHMAC);
    return [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
}

@end