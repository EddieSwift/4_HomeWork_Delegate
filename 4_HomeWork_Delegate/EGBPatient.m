//
//  EGBPatient.m
//  4_HomeWork_Delegate
//
//  Created by Eddie on 23.04.2018.
//  Copyright © 2018 Eddie. All rights reserved.
//

#import "EGBPatient.h"

@implementation EGBPatient


- (void) takePillFromTemperature {
    
    NSLog(@"%@ takes a pill from temperature", self.name);
}

- (void) takePillFromHeadAche {
    NSLog(@"%@ takes a pill from headache", self.name);

}

- (void) takePillfromStomachAche {
    NSLog(@"%@ takes a pill from stomachache", self.name);
}

- (void) showPatientSatisfaction {
    NSLog(@"Name: %@, satisfaction: %s", self.name
          ,  self.areYouPleased ? "YES" : "NO");
}

- (void) drinkWhiskey {
    
    NSLog(@"%@ just go to the bar and drink double Whiskey", self.name);
}

- (void) becameWorse {

    [self.delegate patientFielsBad:self];
    /*
    if (_temperature > 37) {
           NSLog(@"%@ has a temperature", self.name);
           [self.delegate patientFielsTemperature:self];
        }
    
    if (_headAche) {
            NSLog(@"%@ fills head ache", self.name);
            [self.delegate patientFielsHeadAche:self];
        }
    
    if (_stomachAche) {
            NSLog(@"%@ fills stomach ache", self.name);
            [self.delegate patientFielsStomachAche:self];
        }
    
    if (_temperature == 36.6f && (!_headAche) && (!_stomachAche)) {
        [self.delegate patientFielsOk:self];
    }
     */
}



/*
- (void) makeShout {
    NSLog(@"%@ makes shout", self.name);
}
*/
@end
