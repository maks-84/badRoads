//
//  TMUserDefect.h
//  badRoads
//
//  Created by Mac on 25.10.16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMUserDefect : NSObject

@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) NSString *defectTypeName;
@property (strong, nonatomic) NSString *defectDescription;
@property (strong, nonatomic) NSDate *defectCreateDate;

+(TMUserDefect *) initWithLatitude:(NSString *)latitude longitude:(NSString *)longitude defectTypeName: (NSString *)defectTypeName defectDescription: (NSString *)defectDescription defectCreateDate: (NSString *)defectCreateDate;

@end
