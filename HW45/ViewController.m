//
//  ViewController.m
//  HW45
//
//  Created by Илья Егоров on 22.08.15.
//  Copyright © 2015 Илья Егоров. All rights reserved.
//

#import "ViewController.h"
#import "ServerManager.h"
#import "User.h"
#import "UserInfoTableViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()

@property (strong, nonatomic) User* user;
@property (strong, nonatomic) NSMutableArray* friendsArray;

@end

@implementation ViewController

static NSInteger friendsInRequest = 20;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (self.user == nil) {
        self.user = [[User alloc] initWithServerResponce:];
    }
    
    self.friendsArray =  [NSMutableArray array];
    
    [self getFriendsFromServer];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - API

-(void)getFriendsFromServer {
    
    [[ServerManager sharedManager]
     getFriendsWithId:self.user.userID
     Offset:[self.friendsArray count]
     andCount:friendsInRequest
     onSuccess:^(NSArray *friends) {
         
         [self.friendsArray addObjectsFromArray:friends];
         
         //
         //
         //         NSMutableArray* newPaths = [NSMutableArray array];
         //
         //         for (int i = (int)[self.friendsArray count] - (int)[friends count]; i < (int)[self.friendsArray count]; i++) {
         //             [newPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
         //         }
         //
         //         [self.tableView beginUpdates];
         //         [self.tableView insertRowsAtIndexPaths:newPaths withRowAnimation:UITableViewRowAnimationTop];
         //         [self.tableView endUpdates];
         
         [self.tableView reloadData];
         
     } onFailure:^(NSError *error, NSInteger statusCode) {
         
         NSLog(@"error = %@, code = %d", [error localizedDescription], statusCode);
         
     }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.friendsArray count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    
    if (indexPath.row == [self.friendsArray count]) {
        
        cell.textLabel.text = @"Load More";
        cell.imageView.image = nil;
        
    } else {
        
        User* friend = [self.friendsArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",friend.firstName, friend.lastName];
        
        NSURLRequest* request = [NSURLRequest requestWithURL:friend.smallImageURL];
        
        __weak UITableViewCell* weakCell = cell;
        
        weakCell.imageView.image = nil;
        
        [cell.imageView setImageWithURLRequest:request
                              placeholderImage:nil
                                       success:^void(NSURLRequest * __nonnull request,
                                                     NSHTTPURLResponse * __nonnull responce,
                                                     UIImage * __nonnull image) {
                                           weakCell.imageView.image = image;
                                       } failure:^ void(NSURLRequest * __nonnull request,
                                                        NSHTTPURLResponse * __nonnull responce,
                                                        NSError * __nonnull error) {
                                       }];
    }
    
    
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == [self.friendsArray count]) {
        [self getFriendsFromServer];
    } else {
        UserInfoTableViewController* vc = [[UserInfoTableViewController alloc] initForUser:[self.friendsArray objectAtIndex:indexPath.row]];
        [self.navigationController showViewController:vc sender:self];
    }
}

@end

