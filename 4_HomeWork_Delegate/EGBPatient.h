//
//  EGBPatient.h
//  4_HomeWork_Delegate
//
//  Created by Eddie on 23.04.2018.
//  Copyright © 2018 Eddie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol EGBPatientDelegate;

@interface EGBPatient : NSObject

typedef enum {
    EGBPatientBodyPartLeg,
    EGBPatientBodyPartHand,
    EGBPatientBodyPartNose,
    EGBPatientBodyPartThroat
} EGBPatientBodyParts;

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat temperature;
@property (assign, nonatomic) BOOL headAche;
@property (assign, nonatomic) BOOL stomachAche;
@property (weak, nonatomic) id <EGBPatientDelegate> delegate; //Pointer on Delegate
@property (assign, nonatomic) EGBPatientBodyParts bodyParts;
@property (assign, nonatomic) NSArray* arrayTemperature;
@property (strong, nonatomic) NSArray *achingParts;
@property (assign, nonatomic) BOOL areYouPleased;

- (void) becameWorse;
- (void) takePillFromTemperature;
- (void) takePillFromHeadAche;
- (void) takePillfromStomachAche;
- (void) drinkWhiskey;
- (void) showPatientSatisfaction;

@end

@protocol EGBPatientDelegate <NSObject>

@required
- (void) patientFielsBad:(EGBPatient*) patient;


@optional
//- (void) patientDrinkWhiskey:(EGBPatient *)patient;
- (void) patient:(EGBPatient*) patient hasQuestion:(NSString*) question;

@end

/*
 - (void) patientFielsOk:(EGBPatient*) patient;
 - (void) patientFielsTemperature:(EGBPatient*) patient;
 - (void) patientFielsHeadAche:(EGBPatient*) patient;
 - (void) patientFielsStomachAche:(EGBPatient*) patient;
 */

/*
 #import <UIKit/UIKit.h>
 
 @protocol EGBPatientDelegate;
 
 @interface EGBPatient : NSObject
 
 @property (strong, nonatomic) NSString* name;
 @property (assign, nonatomic) CGFloat temperature;
 @property (weak, nonatomic) id <EGBPatientDelegate> delegate;
 
 - (BOOL) howAreyou;
 - (void) takePill;
 - (void) makeShout;
 
 @end
 
 
 @protocol EGBPatientDelegate <NSObject>
 
 @required
 - (void) patientFielsBad:(EGBPatient*) patient;
 - (void) patient:(EGBPatient*) patient hasQuestion:(NSString*) question;
 
 
 @end
 */
