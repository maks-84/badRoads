//
//  ViewController.m
//  badRoads
//
//  Created by Mac on 22.10.16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) TMDataManager *manager;

@end

@implementation ViewController

-(TMDataManager *) manager {
    return [TMDataManager sharedManager];
}

-(void) loadUserInfo {
    NSURL *urlForUserData = [NSURL URLWithString:@"http://badroads.stage.caddiesoft.com/api/users/getUserInfo"];

    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);

            [self.manager getDataAboutUser:urlForUserData with:^(NSString *userName, NSString *userLocale, NSString *userType) {
                
                self.userEmailTextField.text = userName;
                self.userLocaleTextField.text = userLocale;
                self.userLevelTextField.text = userType;
                
            dispatch_group_leave(group);
        }];

    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:245 green:245 blue:245 alpha:0.3f];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self loadUserInfo];
    
    self.userEmailTextField.delegate = self;
    self.userLocaleTextField.delegate = self;
    self.userLevelTextField.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return NO;
}

-(void) viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void) viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
