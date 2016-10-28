//
//  TMDefectsListViewController.h
//  badRoads
//
//  Created by Mac on 25.10.16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMDataManager.h"
#import "TMRoadDefectCell.h"
#import "TMMapViewController.h"

@interface TMDefectsListViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *defectTable;
@end
