//
//  ViewController.h
//  badRoads
//
//  Created by Mac on 22.10.16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMUserInfo.h"
#import "TMDataManager.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *userLocaleTextField;
@property (weak, nonatomic) IBOutlet UITextField *userLevelTextField;

//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadDataActivity;

@end

