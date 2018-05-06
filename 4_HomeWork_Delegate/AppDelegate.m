
//
//  AppDelegate.m
//  4_HomeWork_Delegate
//
//  Created by Eddie on 23.04.2018.
//  Copyright © 2018 Eddie. All rights reserved.
//

#import "AppDelegate.h"
#import "EGBPatient.h"
#import "EGBDoctor.h"
#import "EGBBadDoctor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    EGBPatient* patient1 = [[EGBPatient alloc] init];
    patient1.name = @"John";
    patient1.temperature = 39.5f;
    patient1.headAche = YES;
    patient1.stomachAche = NO;
    patient1.bodyParts = EGBPatientBodyPartHand;
    
    EGBPatient* patient2 = [[EGBPatient alloc] init];
    patient2.name = @"Andy";
    patient2.temperature = 36.9f;
    patient2.headAche = NO;
    patient2.stomachAche = YES;
    patient2.bodyParts = EGBPatientBodyPartLeg;
    
    EGBPatient* patient3 = [[EGBPatient alloc] init];
    patient3.name = @"Rodger";
    patient3.temperature = 40.3f;
    patient3.headAche = NO;
    patient3.stomachAche = NO;
    patient3.bodyParts = EGBPatientBodyPartNose;
    
    EGBPatient* patient4 = [[EGBPatient alloc] init];
    patient4.name = @"Gary";
    patient4.temperature = 36.6f;
    patient4.headAche = YES;
    patient4.stomachAche = YES;
    patient4.bodyParts = EGBPatientBodyPartThroat;
    
    EGBPatient* patient5 = [[EGBPatient alloc] init];
    patient5.name = @"Nancy";
    patient5.temperature = 37.0f;
    patient5.headAche = NO;
    patient5.stomachAche = YES;
    patient5.bodyParts = EGBPatientBodyPartHand;
    
    EGBPatient* patient6 = [[EGBPatient alloc] init];
    patient6.name = @"Richi";
    patient6.temperature = 38.9f;
    patient6.headAche = YES;
    patient6.stomachAche = YES;
    patient6.bodyParts = EGBPatientBodyPartLeg;
    
    EGBPatient* patient7 = [[EGBPatient alloc] init];
    patient7.name = @"Steve";
    patient7.temperature = 36.6f;
    patient7.headAche = NO;
    patient7.stomachAche = NO;
    patient7.bodyParts = EGBPatientBodyPartNose;
    
    EGBPatient* patient8 = [[EGBPatient alloc] init];
    patient8.name = @"Kathy";
    patient8.temperature = 40.1f;
    patient8.headAche = YES;
    patient8.stomachAche = YES;
    patient8.bodyParts = EGBPatientBodyPartNose;
    
    EGBDoctor* doctor = [[EGBDoctor alloc] init];
    doctor.name = @"Real Doctor";
    
    EGBDoctor* doctor2 = [[EGBDoctor alloc] init];
    doctor2.name = @"Real Doctor Two";
    
    //patient1.delegate = doctor;
    
    EGBBadDoctor* badDoctor1 = [[EGBBadDoctor alloc] init];
    badDoctor1.name = @"Bad Doctor #1";
    
    EGBBadDoctor* badDoctor2 = [[EGBBadDoctor alloc] init];
    badDoctor2.name = @"Bad Doctor #2";
    
    patient3.delegate = badDoctor1;
    patient5.delegate = badDoctor2;
    
    //create array with doctors
    NSArray *doctors = @[doctor, doctor2, badDoctor1, badDoctor2];
    
    //creating array with patients
    NSArray* allPatients = [NSArray arrayWithObjects:patient1, patient2, patient3, patient4, patient5, patient6, patient7, patient8, nil];
   
  
    /*
    for (int i = 0; i < [allPatients count]; i++) {
        
        EGBPatient* patients = [allPatients objectAtIndex:i];
        
        patients.areYouPleased = arc4random() % 2;
        
    }
     */
    
 
#pragma mark - Level Pupil
  
/*
        NSLog(@"Level Pupil:");
    
    
    for (id obj in allPatients) {
        [obj setDelegate:doctor];
        NSLog(@"*** Next Patient, Please ***\n\n");
        NSLog(@" ");
        NSLog(@"Patient %@, how are you doing?", [obj name]);
        [obj becameWorse];
        NSLog(@" ");
    }
  
 [doctor dayReport];
 */
    
    #pragma mark - Level Master
    

    
    
    #pragma mark - Level SuperMan

    NSLog(@"Level Superman:");
    NSLog(@" ");
    
    //Select ramdomly doctors for patients
    for (int i = 0; i < [allPatients count]; i++)
    {
        EGBPatient* patients = [allPatients objectAtIndex:i];
        
        NSInteger selectDoctor = arc4random() % 4;
  
        NSLog(@"*** Next Patient, Please ***\n\n");
        
        if (selectDoctor == 0) {
            
            [patients setDelegate:doctor];
            NSLog(@"%@ goes to Real Doctor", patients.name);
            patients.areYouPleased = YES;
            
        } else if (selectDoctor == 1) {
            
            [patients setDelegate:badDoctor1];
            NSLog(@"%@ goes to Fake Doctor One", patients.name);
            patients.areYouPleased = NO;
            
        } else if (selectDoctor == 2) {
            
           [patients setDelegate:badDoctor2];
           NSLog(@"%@ goes to Fake Doctor Two", patients.name);
           patients.areYouPleased = NO;
            
        } else if (selectDoctor == 3) {
            [patients setDelegate:doctor2];
            NSLog(@"%@ goes to Real Doctor Two", patients.name);
            patients.areYouPleased = YES;
        }
       
        NSLog(@"Patient %@, how are you doing?", [patients name]);
        [patients becameWorse];
        [patients showPatientSatisfaction];
        NSLog(@" ");
    }
    
    [doctor dayReport];
    [doctor2 dayReport];
    [badDoctor1 dayReport];
    [badDoctor2 dayReport];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"areYouPleased = NO"];
    
    NSArray *dissatisfiedPatiens = [allPatients filteredArrayUsingPredicate:pred];
    
    //change doctor for unpleased patients
    for (EGBPatient *patient in dissatisfiedPatiens) {
        
        id doctor = patient.delegate;
        
        while ([patient.delegate isEqual:doctor]) {
            patient.delegate = doctors[arc4random() % 3];
            patient.areYouPleased = YES;
        }
    }
    
    NSLog(@"After changing doctors:");
    NSLog(@"\n");
    
    [dissatisfiedPatiens makeObjectsPerformSelector:@selector(showPatientSatisfaction)];

    return YES;
}
    


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
