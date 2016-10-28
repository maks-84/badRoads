//
//  TMUserInfo.h
//  badRoads
//
//  Created by Mac on 22.10.16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMUserInfo : NSObject

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userLocale;
@property (strong, nonatomic) NSString *userType;

+(TMUserInfo *) initUserWithInfo: (id)info;

@end
