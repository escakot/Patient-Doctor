//
//  Patient.m
//  Patient Doctor
//
//  Created by Errol Cheong on 2017-06-29.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "Patient.h"
#import "Doctor.h"
#import "Disease.h"

@implementation Patient

- (instancetype)init
{
    NSLog(@"Please initialize using initWithName.");
    return nil;
}


- (instancetype)initWithName:(NSString*)name andAge:(NSInteger)age
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        NSMutableString *concatInitials = [[NSMutableString alloc] init];
        for (NSString* firstLetters in [name componentsSeparatedByString:@" "]) {
            [concatInitials appendString:[[firstLetters substringToIndex:1] uppercaseString]];
        }
        _initials = concatInitials;
        _disease = [[Disease alloc]init];
        _pastPerscription = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)visitDoctor:(Doctor *)doctor{
    NSLog(@"%@ goes to see %@\n", self.name, doctor.name);
    [doctor checkPatientRecords:self];
}

-(NSString*)requestMedication:(Doctor *)doctor{
    BOOL canReceiveMeds = [doctor checkPatientRecords:self];
    NSLog(@"Patient: I would like medication for %@.", self.disease.illnessName);
    if (canReceiveMeds){
        NSLog(@"Doctor: Yes, you have a patient record.");
        return [doctor perscribeMedication:self.disease];
    } else {
        NSLog(@"Doctor: Sorry, but I can't give you a perscription without a patient record.");
        return nil;
    }
}

-(void)fallSick{
    self.disease = [[Disease alloc]init];
}

@end
