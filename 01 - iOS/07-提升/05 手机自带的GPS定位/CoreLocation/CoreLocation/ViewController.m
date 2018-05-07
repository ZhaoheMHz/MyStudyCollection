//
//  ViewController.m
//  CoreLocation
//
//  Created by 赵赤赤 on 15/11/6.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate> {
    CLLocationManager *_manager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [[CLLocationManager alloc] init];
    _manager.delegate = self;
    [_manager requestAlwaysAuthorization];
    [_manager requestWhenInUseAuthorization];
    [_manager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations lastObject];
    NSLog(@"%f, %f", location.coordinate.latitude, location.coordinate.longitude);
    
    // 定位之后停止定位，防止费电
    [_manager stopUpdatingLocation];
}


@end
