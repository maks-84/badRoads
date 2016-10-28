//
//  TMDataManager.h
//  badRoads
//
//  Created by Mac on 22.10.16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMUserDefect.h"

@interface TMDataManager : NSObject

//@property (strong, nonatomic) TMUserInfo *userData;

+(TMDataManager *) sharedManager;
-(void) getDataAboutUser: (NSURL *)url with: (void(^)(NSString *, NSString *, NSString *))completion;
-(void) getUserDefects: (NSURL *)url with: (void (^)(NSArray *)) completion;

@end
