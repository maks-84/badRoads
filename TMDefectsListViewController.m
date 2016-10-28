//
//  TMDefectsListViewController.m
//  badRoads
//
//  Created by Mac on 25.10.16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "TMDefectsListViewController.h"

@interface TMDefectsListViewController ()

@property (strong, nonatomic) TMDataManager *manager;
@property (strong, nonatomic) NSArray *userDefects;

@end

@implementation TMDefectsListViewController

//- (NSArray *) userDefects {
//    return [self getUserDefects];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    [self getUserDefects];
    
    self.defectTable.delegate = self;
    self.defectTable.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(TMDataManager *) manager {
    return [TMDataManager sharedManager];
}

-(void) getUserDefects {
    NSURL *urlForUserData = [NSURL URLWithString:@"http://badroads.stage.caddiesoft.com/api/users/getUserDefects?userEmail=testadmin@test.com"];
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    
//    __block NSArray *res = nil;
    
    [self.manager getUserDefects:urlForUserData with:^(NSArray * result) {
        
        
        
        self.userDefects = result;
        dispatch_group_leave(group);
    }];
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.userDefects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        

//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    
//    if (!cell) {
//        
//
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
//    }
//    
//    cell.textLabel.text = [[self.userDefects objectAtIndex:indexPath.row] defectTypeName];
//    cell.detailTextLabel.text = [[self.userDefects objectAtIndex:indexPath.row] defectDescription];
//
//    return cell;
//
//    
//    
//    
//    
//    
//    
    TMRoadDefectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RoadDefectCell"];
    if (!cell) {
       // cell = [[TMRoadDefectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        //   cell = [nib objectAtIndex:0];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RoadDefectCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.roadDefectTitleLabel.text = [[self.userDefects objectAtIndex:indexPath.row] defectTypeName];
    cell.roadDefectDescriptionLabel.text = [[self.userDefects objectAtIndex:indexPath.row] defectDescription];
    NSDate *date = [[self.userDefects objectAtIndex:indexPath.row] defectCreateDate];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    
    NSString *dateStr = [formatter stringFromDate:date];
    cell.roadDefectDateLabel.text = dateStr;
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    TMMapViewController *mapView  = [storyboard instantiateViewControllerWithIdentifier:@"mapViewIdentificator"];
    
    [self.navigationController pushViewController:mapView animated:YES];

    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 97.f;
}


@end
