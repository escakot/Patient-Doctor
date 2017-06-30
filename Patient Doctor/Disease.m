//
//  Disease.m
//  Patient Doctor
//
//  Created by Errol Cheong on 2017-06-29.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "Disease.h"


@implementation Disease

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        switch (arc4random_uniform(4)){
            case fever:
                _illness = fever;
                _illnessName = @"Fever";
                break;
            case cold:
                _illness = cold;
                _illnessName = @"Cold";
                break;
            case brokenBone:
                _illness = brokenBone;
                _illnessName = @"Broken Bone";
                break;
            case chickenPox:
                _illness = chickenPox;
                _illnessName = @"Chicken Pox";
                break;
        }
    }
    return self;
}

@end
