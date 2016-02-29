//
//  WallController.h
//  HW45
//
//  Created by Илья Егоров on 09.02.16.
//  Copyright © 2016 Илья Егоров. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WallController : UITableViewController

@property (assign, nonatomic) NSInteger userID;
@property (strong, nonatomic) NSURL* userPhotoURL;
@end
