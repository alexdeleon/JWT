//
//  JWTAlgorithmHS256.m
//  Pods
//
//  Created by Alexander De Leon on 17/12/13.
//
//

#import "JWTAlgorithmHS256.h"

#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonHMAC.h>

#import "MF_Base64Additions.h"

@implementation JWTAlgorithmHS256
- (NSString *)name;
{
    return @"HS256";
}

- (NSData *)encodePayload:(NSString *)theString withSecret:(NSString *)theSecret;
{
    NSData *decodedSecret = [MF_Base64Codec dataFromBase64String:theSecret];
    const char *cString = [theString cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cSecret = [decodedSecret bytes];
    
    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, cSecret, strlen(cSecret), cString, strlen(cString), cHMAC);
    return [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
}
@end