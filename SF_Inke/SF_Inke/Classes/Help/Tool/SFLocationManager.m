//
//  SFLocationManager.m
//  SF_Inke
//
//  Created by ma c on 16/9/6.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface SFLocationManager () <CLLocationManagerDelegate>

@property(copy, nonatomic) LocationBlock locationBlock;

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation SFLocationManager

+ (instancetype)sharedManager {
    static SFLocationManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[SFLocationManager alloc] init];
    });
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 100;
        self.locationManager.delegate = self;
        
        if (![CLLocationManager locationServicesEnabled]) {
            NSLog(@"请开启定位服务");
        } else {
        
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            if (status == kCLAuthorizationStatusNotDetermined) {
                [self.locationManager requestWhenInUseAuthorization];
            }
        }
    }
    return self;
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    CLLocationCoordinate2D coor = newLocation.coordinate;
    NSString *lat = [NSString stringWithFormat:@"%@", @(coor.latitude)];
    NSString *lon = [NSString stringWithFormat:@"%@", @(coor.longitude)];
    
    [SFLocationManager sharedManager].lat = lat;
    [SFLocationManager sharedManager].lon = lon;
    
    self.locationBlock(lat, lon);
    
    [self.locationManager stopUpdatingLocation];
}

- (void)getGPS:(LocationBlock)locationBlock {

    self.locationBlock = locationBlock;
    [self.locationManager startUpdatingHeading];
}

@end
