#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeekFoxLocationHelper : NSObject

@property (nonatomic,copy) NSString* addressName;

+ (instancetype)initializeManager;
+ (NSString *)isOpenLocation;
+ (NSString *)getLocationStatus;
+ (NSString *)checkFileExists:(NSString *)path;
- (void)startLocation;

@end

NS_ASSUME_NONNULL_END
