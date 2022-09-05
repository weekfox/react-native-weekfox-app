#import "WeekFoxLocationHelper.h"
#import <CoreLocation/CoreLocation.h>

@interface WeekFoxLocationHelper () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation WeekFoxLocationHelper

+ (instancetype)initializeManager {
  static WeekFoxLocationHelper *helper = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    helper = [self new];
  });
  return helper;
}

+ (NSString *)isOpenLocation {
  return [CLLocationManager locationServicesEnabled] ? @"true" : @"false";
}

+ (NSString *)getLocationStatus {
  NSString *code = [NSString stringWithFormat:@"%d", [CLLocationManager authorizationStatus]];
  return code;
}

+ (NSString *)checkFileExists:(NSString *)path {
  NSString *nowPath = [path stringByReplacingOccurrencesOfString:@"file://" withString:@""];
  NSString *isExists = [[NSFileManager defaultManager] fileExistsAtPath:nowPath] ? @"true" : @"false";

  return isExists;
}

- (NSString *)addressName {
  if (!_addressName) {
    _addressName = @"";
  }
  return _addressName;;
}

- (void)startLocation {
  CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if ([CLLocationManager locationServicesEnabled] && status != kCLAuthorizationStatusDenied) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 10.0f;
        [_locationManager requestWhenInUseAuthorization];
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
  CLLocation *currLocation = [locations lastObject];
  CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
  
  [geoCoder reverseGeocodeLocation:currLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {

      if (placemarks.count > 0) {
        CLPlacemark *placeMark = placemarks[0];
        NSString *address = [NSString stringWithFormat:@"%@%@%@",placeMark.locality,placeMark.subLocality,placeMark.name];
        self.addressName = address;
      }
  }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (error.code == kCLErrorDenied) {

    } else if (error.code == kCLErrorLocationUnknown) {

    }
}

@end
