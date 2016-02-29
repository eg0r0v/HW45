//
//  ViewController.h
//  HW45
//
//  Created by Илья Егоров on 22.08.15.
//  Copyright © 2015 Илья Егоров. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

typedef enum {
    UsersListFriends,
    UsersListFollowers,
    UsersListSubscriptions
}UsersList;

@interface ViewController : UITableViewController

@property (assign, nonatomic) UsersList usersList;
@property (strong, nonatomic) User* user;

@end

