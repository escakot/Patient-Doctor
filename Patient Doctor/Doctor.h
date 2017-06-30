//
//  Doctor.h
//  Patient Doctor
//
//  Created by Errol Cheong on 2017-06-29.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Patient;
@class Disease;
@interface Doctor : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) NSString* specialization;


- (instancetype)initWithName:(NSString*)name andSpecialization:(NSString*)specialization;

- (void) addPatientRecord:(Patient*)patient;

- (BOOL) checkPatientRecords:(Patient *)patient;

- (NSString*) perscribeMedication:(Disease*)disease;

- (void) recordPerscription:(NSString*)medication forPatient:(Patient*)patient;

- (void) getPatientRecord:(Patient*)patient fromDoctor:(Doctor*)doctor;

- (void) checkPastPerscriptionsFor:(Patient*)patient;

- (void) displayPatientRecord:(Patient*)patient;

@end
