//
//  main.m
//  Patient Doctor
//
//  Created by Errol Cheong on 2017-06-29.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
#import "Doctor.h"  


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Patient *patient = [[Patient alloc] initWithName:@"John Doe" andAge:25];
        Doctor *doctor = [[Doctor alloc] initWithName:@"Bill Gates" andSpecialization:@"Windows"];
        Doctor *newDoctor = [[Doctor alloc] initWithName:@"Steve Jobs" andSpecialization:@"Apple"];
        
        
        patient.hasHealthCard = YES;
        [patient visitDoctor:doctor];
        NSString* perscription = [patient requestMedication:doctor];
        [doctor recordPerscription:perscription forPatient:patient];
        [doctor checkPastPerscriptionsFor:patient];
       
        [patient fallSick];
        //Patient would like to switch doctor
        [newDoctor getPatientRecord:patient fromDoctor:doctor];
        
        [patient visitDoctor:newDoctor];
        NSString* otherPerscription = [patient requestMedication:newDoctor];
        [newDoctor recordPerscription:otherPerscription forPatient:patient];
        [newDoctor checkPastPerscriptionsFor:patient];
    }
    return 0;
}
