//
//  Patient.h
//  Patient Doctor
//
//  Created by Errol Cheong on 2017-06-29.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Doctor;
@class Disease;
@interface Patient : NSObject

@property (nonatomic) NSString* initials;
@property (nonatomic) NSString* name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) BOOL hasHealthCard;
@property (nonatomic) Disease* disease;
@property (nonatomic) NSMutableArray* pastPerscription;

- (instancetype)initWithName:(NSString*)name andAge:(NSInteger)age;

- (void) visitDoctor:(Doctor*)doctor;

- (NSString *) requestMedication:(Doctor*)doctor;

- (void) fallSick;

@end
