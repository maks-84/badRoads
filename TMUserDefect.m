//
//  TMUserDefect.m
//  badRoads
//
//  Created by Mac on 25.10.16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "TMUserDefect.h"

@implementation TMUserDefect

+(TMUserDefect *) initWithLatitude:(NSString *)latitude longitude:(NSString *)longitude defectTypeName: (NSString *)defectTypeName defectDescription: (NSString *)defectDescription defectCreateDate: (NSString *)defectCreateDate {
    TMUserDefect *userDefect = [[TMUserDefect alloc] init];
    userDefect.latitude = latitude;
    userDefect.longitude = longitude;
    userDefect.defectTypeName = defectTypeName;
    userDefect.defectDescription = defectDescription;
    
//    NSDate *date = [[NSDate alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'hh:mm:ss"];
    userDefect.defectCreateDate = [formatter dateFromString:defectCreateDate];
    return userDefect;
}

@end
