//
//  EGBBadDoctor.h
//  4_HomeWork_Delegate
//
//  Created by Eddie on 25.04.2018.
//  Copyright © 2018 Eddie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EGBPatient.h"

@protocol EGBPatientDelegate;

@interface EGBBadDoctor : NSObject <EGBPatientDelegate>

@property (strong, nonatomic) NSString* arrayLeg;

@property (strong, nonatomic) NSArray* arrayHand;
@property (strong, nonatomic) NSArray* arrayNose;
@property (strong, nonatomic) NSArray* arrayThroat;
@property (strong, nonatomic) NSMutableDictionary* arrayTemperature;
@property (strong, nonatomic) NSArray* arrayHeadAche;
@property (strong, nonatomic) NSArray* arrayStomachAche;


@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSMutableDictionary* statisctics;

//- (id) init;
- (void) dayReport;

@end
