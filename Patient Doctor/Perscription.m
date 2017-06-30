//
//  Perscription.m
//  Patient Doctor
//
//  Created by Errol Cheong on 2017-06-29.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "Perscription.h"

@implementation Perscription

-(instancetype)initWithPerscription:(NSString *)perscription{
    self = [super init];
    if (self) {
        _perscription = perscription;
        _issueDate = [NSDate date];
        if ([_perscription isEqualToString:@"Tylenol"] || [_perscription isEqualToString:@"Cough Syrup"]){
            _refillable = YES;
        } else {
            _refillable = NO;
        }
    }
    return self;
}

@end
