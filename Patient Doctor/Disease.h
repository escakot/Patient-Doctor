//
//  Disease.h
//  Patient Doctor
//
//  Created by Errol Cheong on 2017-06-29.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SicknessType){
    fever,
    cold,
    brokenBone,
    chickenPox
};

@interface Disease : NSObject

@property SicknessType illness;
@property NSString* illnessName;

@end
