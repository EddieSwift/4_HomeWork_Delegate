//
//  EGBBadDoctor.m
//  4_HomeWork_Delegate
//
//  Created by Eddie on 25.04.2018.
//  Copyright © 2018 Eddie. All rights reserved.
//

#import "EGBBadDoctor.h"
//#import "EGBPatient.h"

@implementation EGBBadDoctor

#pragma mark - EGBPatientDelegate

- (void) patientFielsTemperature:(EGBPatient*) patient {
    
    [patient drinkWhiskey];
}

- (void) patientFielsHeadAche:(EGBPatient *)patient {
    
    NSLog(@"%@, go home and drink Vodka with friends", patient.name);
    
}

- (void) patientFielsStomachAche:(EGBPatient *)patient {
    
    NSLog(@"%@, I can reccomend you to smoke some sigarets!", patient.name);
}

- (void) patientFielsOk:(EGBPatient *)patient {
    NSLog(@"Hey, %@, if you're healthy, so make big party with girls in your house! :)", patient.name);
}

- (void) patientDrinkWhiskey:(EGBPatient *)patient {
    NSLog(@"%@ just go to the bar and drink double Whiskey", patient.name);
}



- (void) patient:(EGBPatient*) patient hasQuestion:(NSString*) question {
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}

/////////////////////////////////////

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
    
    //NSLog(@"Patient %@ feels bad", patient.name);
    
    if (patient.temperature >= 37.f) {
        //NSLog(@"%@ has a temperature", patient.name);
        [patient drinkWhiskey];
    } else if (patient.headAche) {
         NSLog(@"%@, go home and drink Vodka with friends", patient.name);
        //NSLog(@"%@ fills head ache", patient.name);
        //[patient takePillFromHeadAche];
    } else if (patient.stomachAche) {
         NSLog(@"%@, I can reccomend you to smoke some sigarets!", patient.name);
        //NSLog(@"%@ fills stomach ache", patient.name);
        //[patient stomachAche];
    } else if (patient.temperature == 36.6f && (!patient.headAche) && (!patient.stomachAche)) {
        
        NSLog(@"Hey, %@, if you're healthy, so make big party with girls in your house! :)", patient.name);
    }
}





@end
