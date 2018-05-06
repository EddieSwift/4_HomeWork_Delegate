//
//  EGBDoctor.m
//  4_HomeWork_Delegate
//
//  Created by Eddie on 23.04.2018.
//  Copyright © 2018 Eddie. All rights reserved.
//

#import "EGBDoctor.h"
#import "EGBPatient.h"

@protocol EGBPatientDelegate;

@implementation EGBDoctor


- (id) init {
    self = [super init];
    if (self) {
        _statisctics = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                        @(0), @(EGBPatientBodyPartLeg),
                        @(0), @(EGBPatientBodyPartHand),
                        @(0), @(EGBPatientBodyPartNose),
                        @(0), @(EGBPatientBodyPartThroat),
                        nil];
    }
    return self;
}


/*
- (id) init {
    self = [super init];
    if (self) {
        _statisctics = [[NSMutableDictionary alloc] init];
        [_statisctics setObject:@"" forKey:@"Leg"];
        [_statisctics setObject:@"" forKey:@"Hand"];
        [_statisctics setObject:@"" forKey:@"Nose"];
        [_statisctics setObject:@"" forKey:@"Troat"];
    }
    return self;
}

- (void) dayReport {
    for (NSString *key in self.statisctics) {
        NSString *patientNames = [_statisctics objectForKey:key];
        
        //if (![patientNames isEqualToString:@""]) {
            NSLog(@"Patients with who came with ache in %@: %@", key, patientNames);
        //}
    }
}
*/


- (void) dayReport {
    NSLog(@"Day report of %@:", _name);
    
    for (NSNumber* key in self.statisctics) {
        int value = [self.statisctics[key] intValue];
        NSString* stringPart;
        
        switch ([key intValue]) {
            case EGBPatientBodyPartHand:
                stringPart = @"Hand";
                break;
                
            case EGBPatientBodyPartLeg:
                stringPart = @"Leg";
                break;
                
            case EGBPatientBodyPartNose:
                stringPart = @"Nose";
                break;
                
            case EGBPatientBodyPartThroat:
                stringPart = @"Throat";
                break;
                
                default:
                break;
        }
        
        NSLog(@"%@ = %d", stringPart, value);
    }
    NSLog(@"\n");
}



#pragma mark - EGBPatientDelegate

- (void) patientFielsBad:(EGBPatient*) patient {
    
    int count = 0;
    switch (patient.bodyParts) {
        case EGBPatientBodyPartHand:
        case EGBPatientBodyPartLeg:
        case EGBPatientBodyPartNose:
        case EGBPatientBodyPartThroat:
            count = [self.statisctics[@(patient.bodyParts)] intValue];
            count++;
            self.statisctics[@(patient.bodyParts)] = @(count);
            break;
        default:
            break;
    }
    
    if (patient.temperature >= 37.f) {
        NSLog(@"%@ has a temperature", patient.name);
        [patient takePillFromTemperature];
    } else if (patient.headAche) {
        NSLog(@"%@ fills head ache", patient.name);
        [patient takePillFromHeadAche];
    } else if (patient.stomachAche) {
        NSLog(@"%@ fills stomach ache", patient.name);
        [patient stomachAche];
    } else if (patient.temperature == 36.6f && (!patient.headAche) && (!patient.stomachAche)) {
        
    NSLog(@"Hey, %@, you're OK and helthy totally, so go at home and have a rest! :)", patient.name);
}
}


/*
- (void) patientFielsBad:(EGBPatient*) patient {
    
    NSArray *patientAchingParts = patient.achingParts;
    
    for (NSNumber *p in patientAchingParts) {
        switch (p.intValue) {
            case 0: {
                NSLog(@"%@ has problems with his nose", patient.name);
                NSString *names = [NSString stringWithFormat:@"%@ %@", [self.statisctics objectForKey:@"nose"], patient.name];
                [self.statisctics setObject:names forKey:@"nose"];
            }
        break;
    case 1: {
      NSLog(@"%@ fills hand ache", patient.name);
        NSString *names = [NSString stringWithFormat:@"%@ %@", [self.statisctics objectForKey:@"hand"], patient.name];
        [self.statisctics setObject:names forKey:@"hand"];
        }
    break;
            case 2: {
                NSLog(@"%@ has problems with his leg", patient.name);
                NSString *names = [NSString stringWithFormat:@"%@ %@", [self.statisctics objectForKey:@"leg"], patient.name];
                [self.statisctics setObject:names forKey:@"leg"];
            }
                break;
                
            case 3: {
                NSLog(@"%@ has problems with his throat", patient.name);
                NSString *names = [NSString stringWithFormat:@"%@ %@", [self.statisctics objectForKey:@"throat"], patient.name];
                [self.statisctics setObject:names forKey:@"throat"];
            }
        }
    }
}
*/


- (void) patient:(EGBPatient*) patient hasQuestion:(NSString*) question {
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}


@end
    
    
    /*
     - (void) patientFielsOk:(EGBPatient *)patient {
     NSLog(@"Hey, %@, you're OK and helthy totally, so go at home and have a rest! :)", patient.name);
     */



/*
 - (void) patientFielsTemperature:(EGBPatient*) patient {
 
 [patient takePillFromTemperature];
 
 
 //_arrayTemperature = [[NSMutableArray alloc] init];
 //[self.arrayTemperature addob]
 
 //_arrayTemperature = [[NSMutableDictionary alloc] init];
 //[self.arrayTemperature setObject:patient.name forKey:@"hand"];
 //[self.arrayTemperature initWithObjectsAndKeys:patient.name, forkey:@"hand" nil];
 
 
 
 //_arrayTemperature = [NSMutableArray arrayWithCapacity:10];
 //[_arrayTemperature addObject:patient.name];
 
 //[array addObject:@"Tutorials"];
 //NSLog(@"%@",array);
 
 //NSMutableArray *a = [[NSMutableArray arrayWithCapacity:10]];
 
 //[_arrayTemperature addObject:patient.name];
 
 }
 
 - (void) patientFielsHeadAche:(EGBPatient *)patient {
 
 [patient takePillFromHeadAche];
 
 }
 
 - (void) patientFielsStomachAche:(EGBPatient *)patient {
 
 [patient takePillfromStomachAche];
 
 }
 
 */


/*
 - (id) init {
 self = [super init];
 if (self) {
 self.journal = [[NSMutableDictionary alloc] init];
 [self.journal setObject:@"" forKey:@"hand"];
 [self.journal setObject:@"" forKey:@"back"];
 [self.journal setObject:@"" forKey:@"noise"];
 [self.journal setObject:@"" forKey:@"throat"];
 
 }
 return self;
 }
 */


/*
 - (void) report {
 //NSLog(@"Patients who had temperature:");
 for (NSString* key in self.journal) {
 NSString* s = [self.journal objectForKey:key];
 
 if (![s isEqualToString:@""]) {
 NSLog(@"With aching part %@ was cured: %@", key, s);
 }
 }
 }
 */
