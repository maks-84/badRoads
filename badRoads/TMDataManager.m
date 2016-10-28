//
//  TMDataManager.m
//  badRoads
//
//  Created by Mac on 22.10.16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "TMDataManager.h"

@implementation TMDataManager

+(TMDataManager *) sharedManager {
    static TMDataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[TMDataManager alloc] init];
    });
    
    return manager;
}


-(void) getDataAboutUser: (NSURL *)url with: (void(^)(NSString *, NSString *, NSString *))completion {

    NSURLSessionConfiguration *configSession = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSString *userName = [result objectForKey:@"userName"];
            NSString *userLocale = [result objectForKey:@"userlocale"];
            NSString *userType = [result objectForKey:@"userType"];
            
            completion(userName, userLocale, userType);

        }
    }];
    [dataTask resume];
}

-(void) getUserDefects: (NSURL *)url with: (void (^)(NSArray *)) completion {
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
            NSArray *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSMutableArray *userDefects = [NSMutableArray new];
            
            for (id obj in result) {
                TMUserDefect *userDefect = [TMUserDefect initWithLatitude:[obj objectForKey:@"Latitude"] longitude:[obj objectForKey:@"Longtitude"] defectTypeName:[obj objectForKey:@"DefectTypeName"] defectDescription:[obj objectForKey:@"FirstDescription"] defectCreateDate:[obj objectForKey:@"TripDate"]];
                
                [userDefects addObject:userDefect];
            }
            
            
            
            
            
            completion(userDefects);
        }
    }];
    
    [dataTask resume];
    
}
@end
