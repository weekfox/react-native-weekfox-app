#import "WeekFoxLocation.h"
#import <React/RCTUIManager.h>
#import "WeekFoxLocationHelper.h"

@implementation WeekFoxLocation

RCT_EXPORT_MODULE(LocationManager);


RCT_EXPORT_METHOD(getAddressNameWithcallback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[WeekFoxLocationHelper initializeManager].addressName]);
}

RCT_EXPORT_METHOD(checkOpenLocation:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[WeekFoxLocationHelper isOpenLocation],[WeekFoxLocationHelper getLocationStatus]]);
}

RCT_EXPORT_METHOD(checkFileExistsWithVideoPath:(NSString *)videoPath ImagePath:(NSString *)imagePath callback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[WeekFoxLocationHelper checkFileExists:videoPath],[WeekFoxLocationHelper checkFileExists:imagePath]]);
}

@end
