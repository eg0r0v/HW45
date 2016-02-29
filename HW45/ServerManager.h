//
//  ServerManager.h
//  HW45
//
//  Created by Илья Егоров on 24.08.15.
//  Copyright © 2015 Илья Егоров. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface ServerManager : NSObject

+ (ServerManager*) sharedManager;

-(void)getUserWithID:(NSInteger)userID
            onSuccess:(void(^)(User* user)) success
            onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

-(void)getFriendsForID:(NSInteger)userID
                Offset:(NSInteger)offset
              andCount:(NSInteger)count
             onSuccess:(void(^)(NSArray* friends)) success
             onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

-(void)getFollowersForID:(NSInteger)userID
                  Offset:(NSInteger)offset
                andCount:(NSInteger)count
               onSuccess:(void(^)(NSArray* friends)) success
               onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

-(void)getSubscriptionsForID:(NSInteger)userID
                      Offset:(NSInteger)offset
                    andCount:(NSInteger)count
                   onSuccess:(void(^)(NSArray* friends)) success
                   onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

-(void)getWallForID:(NSInteger)userID
             Offset:(NSInteger)offset
           andCount:(NSInteger)count
          onSuccess:(void(^)(NSNumber* postsNumber, NSArray* wallPosts)) success
          onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;
@end
