//
//  UserInfoTableViewController.h
//  HW45
//
//  Created by Илья Егоров on 20.09.15.
//  Copyright © 2015 Илья Егоров. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;
@protocol ButtonsDelegate;

@interface UserInfoTableViewController : UITableViewController <ButtonsDelegate>

@property (strong, nonatomic) User* user;

- (instancetype)initForUser:(User*)user;

@end
