//
//  WellAmI.m
//  AmIAtWherecampPDX
//
//  Created by Michael Weisman on 09-09-17.
//  Copyright 2009 Michael Weisman. All rights reserved.
//

#import "WellAmI.h"

#define WHERE_CAMP_LAT 45.528073
#define WHERE_CAMP_LON -122.660508

@implementation WellAmI

- (id) init
{
    self = [super init];
    if (self != nil) {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager startUpdatingLocation];
        [locationManager setDelegate:self];
    }
    return self;
}

-(IBAction) howAboutNow:sender{
    [locationManager startUpdatingLocation];    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [manager stopUpdatingLocation];
    NSLog(@"%@",newLocation);
    [self soAmI:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"%@",error);
}

- (void)soAmI:(CLLocation *)location {
    NSDate *now = [NSDate date];
    NSDate *whereCampStartTime = [NSDate dateWithNaturalLanguageString:@"October 2, 2009"];
    NSDate *whereCampEndTime = [NSDate dateWithNaturalLanguageString:@"October 4, 2009"];
    CLLocation *whereCampLocation = [[CLLocation alloc] initWithLatitude:WHERE_CAMP_LAT longitude:WHERE_CAMP_LON];
    if ([location distanceFromLocation:whereCampLocation] <= 200) {
        if ([now compare:whereCampStartTime] == NSOrderedAscending) {
            [wellAmIAtWhereCamp setStringValue:@"Not Yet, but soon!"];
        } else if ([now compare:whereCampEndTime] == NSOrderedDescending) {
            [wellAmIAtWhereCamp setStringValue:@"No"];
        } else {
            [wellAmIAtWhereCamp setStringValue:@"Yes"];
        }

    } else {
        [wellAmIAtWhereCamp setStringValue:@"No"];
    }
    
}

@end
