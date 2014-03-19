//
//  JWTClaimsSetSerializer.m
//  JWT
//
//  Created by Klaas Pieter Annema on 31-05-13.
//  Copyright (c) 2013 Karma. All rights reserved.
//

#import "JWTClaimsSetSerializer.h"

@implementation JWTClaimsSetSerializer

+ (NSDictionary *)dictionaryWithClaimsSet:(JWTClaimsSet *)theClaimsSet;
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [self dictionary:dictionary setObjectIfNotNil:theClaimsSet.issuer forKey:@"iss"];
    [self dictionary:dictionary setObjectIfNotNil:theClaimsSet.subject forKey:@"sub"];
    [self dictionary:dictionary setObjectIfNotNil:theClaimsSet.audience forKey:@"aud"];
    [self dictionary:dictionary setObjectIfNotNil:@([theClaimsSet.expirationDate timeIntervalSince1970]) forKey:@"exp"];
    [self dictionary:dictionary setObjectIfNotNil:theClaimsSet.identifier forKey:@"jti"];
    [self dictionary:dictionary setObjectIfNotNil:theClaimsSet.type forKey:@"typ"];
    [self dictionary:dictionary setObjectIfNotNil:theClaimsSet.scope forKey:@"scope"];
    return dictionary;
}

+ (JWTClaimsSet *)claimsSetWithDictionary:(NSDictionary *)theDictionary;
{
    JWTClaimsSet *claimsSet = [[JWTClaimsSet alloc] init];
    claimsSet.issuer = [theDictionary objectForKey:@"iss"];
    claimsSet.subject = [theDictionary objectForKey:@"sub"];
    claimsSet.audience = [theDictionary objectForKey:@"aud"];
    claimsSet.expirationDate = [NSDate dateWithTimeIntervalSince1970:[[theDictionary objectForKey:@"exp"] doubleValue]];
    claimsSet.notBeforeDate = [NSDate dateWithTimeIntervalSince1970:[[theDictionary objectForKey:@"nbf"] doubleValue]];
    claimsSet.issuedAt = [NSDate dateWithTimeIntervalSince1970:[[theDictionary objectForKey:@"iat"] doubleValue]];
    claimsSet.identifier = [theDictionary objectForKey:@"jti"];
    claimsSet.scope = [theDictionary objectForKey:@"scope"];
    return claimsSet;
}

+ (void)dictionary:(NSMutableDictionary *)theDictionary setObjectIfNotNil:(id)theObject forKey:(id<NSCopying>)theKey;
{
    if (!theObject)
        return;
    
    [theDictionary setObject:theObject forKey:theKey];
}

@end
