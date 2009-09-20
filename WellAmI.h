//
//  WellAmI.h
//  AmIAtWherecampPDX
//
//  Created by Michael Weisman on 09-09-17.
//  Copyright 2009 Michael Weisman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface WellAmI : NSObject <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    IBOutlet NSTextField *wellAmIAtWhereCamp;
}

-(IBAction)howAboutNow:sender;
-(void)soAmI:(CLLocation *)location;

@end
