//
//  Doctor.m
//  Patient Doctor
//
//  Created by Errol Cheong on 2017-06-29.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"
#import "Perscription.h"
#import "Disease.h"

@interface Doctor ()

@property (nonatomic) NSMutableDictionary* patientRecord;
@property (nonatomic) NSMutableArray* pastPerscriptions;

@end

@implementation Doctor

- (instancetype)init
{
    NSLog(@"Please initialize using initWithName.");
    return nil;
}


- (instancetype)initWithName:(NSString*)name andSpecialization:(NSString*)specialization
{
    self = [super init];
    if (self) {
        _name = name;
        _specialization = specialization;
        _patientRecord = [[NSMutableDictionary alloc] init];
        _pastPerscriptions = [[NSMutableArray alloc] init];
    }
    return self;
}

// Add patient record if patient has health card
- (void) addPatientRecord:(Patient*)patient{
    NSLog(@"Doctor: Do you have a health card?\n");
    if (patient.hasHealthCard){
        NSLog(@"Patient: Yes, I have a health card\n");
        NSLog(@"Doctor: I have added you as a patient.");
        [self.patientRecord setObject:patient forKey:patient.initials];
    } else {
        NSLog(@"Patient: No, I don't have a health card\n");
        NSLog(@"Doctor: Sorry, we can't take you as a patient.\n");
    }
}

// Check if patient records exists
- (BOOL)checkPatientRecords:(Patient *)patient {
    if (self.patientRecord[patient.initials]){
        return YES;
    } else {
        NSLog(@"Patient record does not exist");
        [self addPatientRecord:patient];
        return NO;
    }
}

- (NSString*) perscribeMedication:(Disease*)disease {
    switch (disease.illness){
        case fever:
            NSLog(@"Here is Tylenol for a Fever");
            return @"Tylenol";
        case cold:
            NSLog(@"Here is Cough Syrup for a Cold");
            return @"Cough Syrup";
        case brokenBone:
            NSLog(@"Here is Pain Killers for a Broken Bone");
            return @"Pain Killers";
        case chickenPox:
            NSLog(@"Here is a Vaccine for Chicken Pox");
            return @"Vaccine";
    }
    
}

- (void) recordPerscription:(NSString *)medication forPatient:(Patient*)patient{
    Perscription *perscription = [[Perscription alloc] initWithPerscription:medication];
    Patient *currentPatient = self.patientRecord[patient.initials];
    [currentPatient.pastPerscription addObject:perscription];
    self.patientRecord[patient.initials] = currentPatient;
    NSLog(@"Doctor: I have recorded your perscription.");
}

- (void) getPatientRecord:(Patient*)patient fromDoctor:(Doctor*)doctor{
    Patient* passPatient = doctor.patientRecord[patient.initials];
    [self.patientRecord setObject:passPatient forKey:passPatient.initials];
    [doctor.patientRecord removeObjectForKey:patient.initials];
    NSLog(@"Patient records passed from %@ to %@",doctor.name , self.name);
}

- (void)checkPastPerscriptionsFor:(Patient *)patient {
    for (Perscription* perscriptions in [self.patientRecord[patient.initials] pastPerscription]) {
        NSLog(@"\nPerscription: %@\n"
              "Date perscribed: %@\n"
              "Refillable: %s\n", perscriptions.perscription, perscriptions.issueDate, perscriptions.refillable ? "YES" : "NO");
        
    }
}

-(void)displayPatientRecord:(Patient *)patient{
    Patient* currentPatient = self.patientRecord[patient.initials];
    NSLog(@"\nPatient record:\n"
          "Name: %@\n"
          "Age: %li\n"
          "OHIP: %s\n", currentPatient.name, currentPatient.age, currentPatient.hasHealthCard ? "YES" : "NO");
}

@end

